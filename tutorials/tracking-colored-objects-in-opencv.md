---
title: "Tracking colored objects in OpenCV"
date: "2010-07-19 23:48:35"
excerpt: "Given an object that is distinctly colored, you'll learn how to detect the object in the scene and track it as it moves across the frame - live!"
category: "Projects"
author: "sinha.utkarsh1990@gmail.com"
post_image: "/static/img/tut/post-tracking.jpg"
featured: true
---
If you're new to image processing, you'll enjoy this project. What we'll attempt to achieve in this tutorial is tracking the location of a coloured object in an image. In our case, it'll be a yellow colored ball. Once we're finished, we'll have something like this: Looks great right? So lets dive right in! 

## Creating the project

First, create a Win32 console application. Choose any name you like, and accept the default wizard options. You'll get an empty project with a main function. First, add these header files to the code: 
    
    :::c++
    #include "cv.h"
    #include "highgui.h"

Next, add the library files to the project. Go to Project > Properties > Configuration > Linker > Input and write cv.lib cxcore.lib cvaux.lib highgui.lib in Additional Dependencies.

If you have any problems with setting this up, I suggest you go through [Using OpenCV with Window](/tutorials/using-opencv-on-windows/). 

## The plan of action

Before diving right into the code, its always a good idea to put a little insight into what we're doing. Our program flow should go something like this: 

  * Get an image from the camera
  * Figure out where the yellow ball is
  * Add the current position to an array of some sort

To get an image from the camera, we'll use code from [Capturing Images](/tutorials/capturing-images/), that is, we'll use inbuilt OpenCV functions that let you access camera.

For figuring out where the ball is, we'll first threshold the image and use zero order and first order moments.

To keep a track of where the ball has been, we'll use another image. We'll keep drawing wherever the ball goes, and combine this image with the original frame. That way, we'll get a "scribble" like effect. You'll see what I mean when we implement it in code. 

## The dive into code

We'll start off by writing the thresholding function: 
    
    
    :::c++
    IplImage* GetThresholdedImage(IplImage* img)
    {

This function will take an image, and return a binary image (where yellow will be white and the rest will be black). Here's a sample of what might be a scenario:

![Thresholding with the Hue-Saturation-Value channels](/static/img/tut/hsv-thresholding.jpg)

To achieve this thresholding, we'll be using the HSV colour space, instead of the more common RGB colour space. In HSV, each "tint" of colour is assigned a particular number (the Hue). The "amount" of colour is assigned another number (the Saturation) and the brightness of the colour is assigned another number (the Intensity or Value).

This gives us the advantage of having a single number (hue) for the yellow ball despite multiple shades of yellow (all the way from dark yellow to a bright yellow). For more information you might want to read up [Colour spaces - Grayscale, RGB, HSV and Y'CrCb](/tutorials/color-spaces-1/).

Back to the code now. Firstly, we convert the image into an HSV image: 
    
    
    :::c++
        // Convert the image into an HSV image
        IplImage* imgHSV = cvCreateImage(cvGetSize(img), 8, 3);
        cvCvtColor(img, imgHSV, CV_BGR2HSV);

We keep the original image (img) intact, for future uses. The image is originally stored in the BGR format, so we convert BGR into HSV.

Now, create a new image that will hold the threholded image (which will be returned). 
    
    
    :::c++
        IplImage* imgThreshed = cvCreateImage(cvGetSize(img), 8, 1);

Now we do the actual thresholding:
    
    
    :::c++
        cvInRangeS(imgHSV, cvScalar(20, 100, 100), cvScalar(30, 255, 255), imgThreshed);

Here, imgHSV is the reference image. And the two cvScalars represent the lower and upper bound of values that are yellowish in colour. (These bounds should work in almost all conditions. If they don't, try experimenting with the last two values).

Consider any pixel. If all three values of that pixel (H, S and V, in that order) like within the stated ranges, imgThreshed gets a value of 255 at that corresponding pixel. This is repeated for all pixels. So what you finally get is a thresholded image.

And finally, release the temporary HSV image and return this thresholded image: 
    
    
    :::c++
        cvReleaseImage(&imgHSV);
        return imgThreshed;
    }

That finishes up our thresholding function.

Next we'll get to the main function: 
    
    
    :::c++
    int main()
    {

First, we initialize the capturing device. If we don't get a device, we simply exit... no questions asked. 
    
    
    :::c++
        // Initialize capturing live feed from the camera
        CvCapture* capture = 0;
    
        capture = cvCaptureFromCAM(0);
    
        // Couldn't get a device? Throw an error and quit
        if(!capture)
        {
            printf("Could not initialize capturing...");
            return -1;
        }

And then we setup windows that will display the live images: 
    
    
    :::c++
        // The two windows we'll be using
        cvNamedWindow("video");
        cvNamedWindow("thresh");

video will display the actual output of the program (like the one you saw in the video at the top of this image). thresh will display the thresholded image, just to aid debugging if its needed.

Now we initialize the image that will hold the "scribble" data. 
    
    
    :::c++
        // This image holds the "scribble" data...
        // the tracked positions of the ball
        IplImage* imgScribble = NULL;

We'll keep updating imgScribble with appropriate lines. And we'll add this image to the current frame.. and we'll get the final output. Here's a possible situation:

![A sample of the tracking being done](/static/img/tut/tracking-coloured-objects-sample.jpg)

I hope it makes sense.

Moving on, we create an infinite loop (we're working on a realtime project here): 
    
    :::c++
        // An infinite loop
        while(true)
        {
            // Will hold a frame captured from the camera
            IplImage* frame = 0;
            frame = cvQueryFrame(capture);

We capture a frame from the camera, and store it in frame.

Just in case, if we won't get a frame, we simply quit. 
    
    
    :::c++
            // If we couldn't grab a frame... quit
            if(!frame)
                break;

If you noticed, we just created imgScribble. We didn't allocate any memory to it. The first frame would be a good place to do so. And to determine if its the first frame, we can check if imgScribble is currently NULL or not: 
    
    
    :::c++
            // If this is the first frame, we need to initialize it
            if(imgScribble == NULL)
            {
                imgScribble = cvCreateImage(cvGetSize(frame), 8, 3);
            }

If the code reaches this far, we're sure that a frame was captured, and the imgScribble is a valid image. So we get down to business, and generate the thresholded image using the function we wrote above: 
    
    
    :::c++
            // Holds the yellow thresholded image (yellow = white, rest = black)
            IplImage* imgYellowThresh = GetThresholdedImage(frame);

Now imgYellowThresh holds a binary image similar to the ones shown above. Now we use mathematics based calculations to figure out the position of the yellow ball.

NOTE: I'm assuming that there will be only one yellow object on screen. If you have multiple objects, this code won't work. 
    
    
    :::c++
            // Calculate the moments to estimate the position of the ball
            CvMoments *moments = (CvMoments*)malloc(sizeof(CvMoments));
    
            cvMoments(imgYellowThresh, moments, 1);
    
            // The actual moment values
            double moment10 = cvGetSpatialMoment(moments, 1, 0);
            double moment01 = cvGetSpatialMoment(moments, 0, 1);
    
            double area = cvGetCentralMoment(moments, 0, 0);

You first allocate memory to the moments structure, and then you calculate the various moments. And then using the moments structure, you calculate the two first order moments (moment10 and moment01) and the zeroth order moment (area).

Dividing moment10 by area gives the X coordinate of the yellow ball, and similarly, dividing moment01 by area gives the Y coordinate.

Now, we need some mechanism to be able to store the previous position. We do that using static variables: 
    
    
    :::c++
            // Holding the last and current ball positions
            static int posX = 0;
    
            static int posY = 0;
    
            int lastX = posX;
    
            int lastY = posY;
    
            posX = moment10/area;
            posY = moment01/area;

The current position of the ball is stored in posX and posY, and the previous location is stored in lastX and lastY.

We'll just print out the current position for debugging purposes: 
    
    
    :::c++
            // Print it out for debugging purposes
            printf("position (%d,%d)", posX, posY);

Now, we do some scribbling: 
    
    
    :::c++
            // We want to draw a line only if its a valid position
            if(lastX>0 && lastY>0 && posX>0 && posY>0)
            {
                // Draw a yellow line from the previous point to the current point
                cvLine(imgScribble, cvPoint(posX, posY), cvPoint(lastX, lastY), cvScalar(0,255,255), 5);
    
            }

We simply create a line from the previous point to the current point, of yellow colour and a width of 5 pixels.

The if condition prevents any invalid points from being drawn on the screen. (Just try taking the yellow object out of the screen once the program is done... you'll see what I mean).

Once all of this processing is over, we combine the scribble and the captured frame: 
    
    
    :::c++
            // Add the scribbling image and the frame...
            cvAdd(frame, imgScribble, frame);
            cvShowImage("thresh", imgYellowThresh);
            cvShowImage("video", frame);

After displaying the images, we check if a key was pressed: 
    
    
    :::c++
            // Wait for a keypress
            int c = cvWaitKey(10);
            if(c!=-1)
            {
                // If pressed, break out of the loop
                break;
            }

If a key was pressed, break out of the loop.

And finally, we release the thresholded image. We don't want to accumulate multiple thresholded images... 
    
    
    :::c++
            // Release the thresholded image+moments... we need no memory leaks.. please
            cvReleaseImage(&imgYellowThresh);
            delete moments;
        }

And finally, once the loop gets over, we release the camera so that other program can use it: 
    
    
    :::c++
        // We're done using the camera. Other applications can now use it
        cvReleaseCapture(&capture);
        return 0;
    }

Thats it! Try running the program now, it should work, just like in the video! 

## Tracking different colors

If you want to try some different color, you'll have to figure out it's hue. There are two ways to do that. First - hit and trial. Go through all possible values and you'll hopefully end up getting a good value.

The other method requires using some photo manipulation software (MS Paint will do). Open the color selection palette. Go through the colors and you should see a text box labeled Hue. 

![The color selection dialog box](/static/img/tut/color_selection.jpg)

Go through all possible Hues to find the range of values. For example, in MS Paint, it is 0-239. But OpenCV's hue values range from 0-179. So you need to scale any hue value you take from MS Paint (multiple the hue from MS Paint by 180/240). 

## Wrap up

Hope you learned something from this little project!

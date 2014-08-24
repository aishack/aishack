---
title: "HighGUI: Creating Interfaces"
date: "2010-02-16 16:20:04"
excerpt: ""
category: "OpenCV"
author: "sinha.utkarsh1990@gmail.com"
post_image: "/static/img/tut/post-highgui-creating-interfaces.jpg"
track: "OpenCV Basics"
track_part: 6
---


## Introduction

In this tutorial, you'll learn how to add trackbars to windows. And also how to detect mouse click events within a window. An application of these flexibilities would be being able to dynamically control things within your program... like changing the amount of erode without recompiling the code.

In this tutorial, we'll create an application which grabs images from your camera and lets you adjust the brightness and contrast of the image... on the fly. And on clicking, displays the X and Y coordinates of that point. 

## On the fly brightness and contrast

We'll start off by creating a program that will constantly input images from a camera. If you want, you can read about that in detail in Capturing Images. For now, create a new project of Win32 Console Application. Name it whatever you want. I named it Interface. Click OK and accept the default options by clicking Finish.

We start off by including the OpenCV header files and creating a camera capture object: 
    
    :::c++
    #include <cv.h>
    #include <highgui.h>
    int main()
    {
        CvCapture* capture = 0;
        capture = cvCaptureFromCAM(0);
        if(!capture)
        {
            printf("Could not initialize capturing...\
    ");
            return -1;
        }
    
        cvNamedWindow("video");

The code above creates a capture structure pointing to camera #0 and creates a window named "video".

All this code has been explained in detail in the previous tutorial, Capturing Images. So if you have any doubts, please refer to it.

Now, we create two variables. These variables will hold the value of the trackbars we'll create in a moment: 
    
    
    :::c++
        int bright=128, contrast=26;

And now we actually create the trackbars: 
    
    
    :::c++
        cvCreateTrackbar("brightness", "video", &bright, 255, NULL);
        cvCreateTrackbar("contrast", "video", &contrast, 50, NULL);

The cvCreateTrackbar takes in five parameters: 

  1. The name of the trackbar to be created
  2. The name of the window in which it will be placed
  3. A pointer to a variable (this will hold the value of the trackbar)
  4. The maximum value of the trackbar (the minimum is always 0)
  5. A callback function (which is called whenever the position of the trackbar is changed)

We create two trackbars, one named "brightness" and the other named "contrast". Both are placed in the "video" window. We send the addresses of brightness and contrast as pointers too. So, whenever the user moves the trackbar, these variables are updated.

The maximum possible value for brightness is 255 and for contrast is 50. And because we don't use the callback functions, we send NULL.

Now we get to the infinite loop. Within this infinite loop, we request for frames: 
    
    
    :::c++
        while(true)
        {
            IplImage* frame = 0;
            frame = cvQueryFrame(capture);
            if(!frame)
    
                break;

Again, if you have any doubts with whats going on, have a look at Capturing Images.

Now, frame contains the image captured from the camera. We need to modify the image, based on the value stored in brightness and contrast. And we do that using code developed in the Processing and Filtering Images tutorial.

For brightness, we could either reduce or increase brightness. Since the minimum value of a trackbar is always 0, subtracting 128 from brightness would give us values from -128 to 127... which it good enough for our purposes (reduce to increase brightness). Here's the code: 
    
    
    :::c++
            cvAddS(frame, cvScalar(bright-128,bright-128,bright-128), frame);

And then, we modify the contrast using the cvScale command. Since this trackbar has a from from 0 to 50... subtracting 25 from contrast will give us a range of -25 to 25. Now, multiplying by a negative number makes no sense (you can't have negative intensity of pixel... atleast not on a monitor/LCD).

Positive value of the contrast trackbar physically means increasing contrast. For that, we multiply. Ngative physically means is decreasing contrast. And that means dividing by a constant factor. To do this, you use the following code: 
    
    
    :::c++
            if(contrast>25)
                cvScale(frame, frame, contrast-25);
            else if(contrast<25)
                cvScale(frame, frame, 1/(double)(25-contrast));

If you noticed the code well enough.. you'll see that nothing happens when contrast = 0 (or, value 25). Thats because, you can't do either thing... you can't divide by 0... nor will multiplying by 0 give any meaningful result.

Finally, we display the image in the window "video" and wait for key presses. If the Esc key (ASCII = 27) isn't pressed you continue with the loop. Else, you exit. 
    
    
    :::c++
            cvShowImage("video", frame);
            int c = cvWaitKey(20);
            if((char)c==27)
                break;
    
        }
    
        cvReleaseCapture(&capture);
        return 0;
    }

And this finishes the first part of the tutorial. You can now compile and run the program. You should see the webcam's video feed on your screen... and two trackbars which you can use to modify the brightness and contrast of the image.

## Detecting mouse clicks

Now for something different. We'll print out the coordinates of the point the use clicks. Once you have the coordinates, you can do almost anything... make a sribble type application (with live video going on in the background!!), or something even more wierd.

To accomplish this task, we'll use a callback function. A callback function is nothing special... its just that another function calls it. In our case, you'll pass this function (actually, the address of this function) to HighGUI. And HighGUI will call this function whenever any event (like mouse click) occurs.

We'll first write this function. Add it before the main function: 
    
    
    :::c++
    void on_mouse(int evt, int x, int y, int flags, void* param)
    {

The parameters of this functions are provided by the HighGUI library itself. The first parameter is the type of event that occured (left mouse button down/up, etc), followed by the X and Y coordinates. The fourth parameter indicates which buttons were pressed (left/middle/right mouse button, the Ctrl/Alt,Shift button). And finally some user defined parameter.

For now, we'll just add some printing code: 
    
    
    :::c++
        if(evt==CV_EVENT_LBUTTONDOWN)
            printf("Clicked at (%d,%d)\
    ", x, y);
    }

So, whenever this function is called, and the event that occured is "left mouse button was pressed), it will print out the coordinates of the point where the mouse was clicked.

Now, we need to tell the HighGUI window to call this function whenever there is any mouse related event. To do that, add this line: 
    
    
    :::c++
        cvNamedWindow("video");
        cvSetMouseCallback("video", on_mouse, 0); // ADD this line
        int bright=128, contrast=26;

We're setting the mouse callback, for the window "video". The callback function is on_mouse (note that there are no parantheses after on_mouse). And finally, because we're not using and user defined parameter, we send a 0.

And we're done! Compile and execute this program and try clicking on the webcam image you see!! 

## Wrap up

In this tutorial, you learned a bit more about HighGUI and how you can make use of it. You learned about trackbars and using them to affect calculations in your program. You also learned how you can use your mouse.

## Other parts

This post is a part of an article series on OpenCV for Beginners 

  1. [Why OpenCV?](/tutorials/why-opencv/)
  2. [Installing and getting OpenCV running](/tutorials/installing-and-getting-opencv-running/)
  3. [Hello, World! With Images!](/tutorials/hello-world-with-images/)
  4. [Filtering Images](/tutorials/filtering-images/)
  5. [Capturing Images](/tutorials/capturing-images/)
  6. [HighGUI: Creating Interfaces](/tutorials/highgui-creating-interfaces/)

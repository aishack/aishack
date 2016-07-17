---
title: "Capturing images"
date: "2010-02-13 16:08:31"
excerpt: ""
category: "OpenCV"
author: "sinha.utkarsh1990@gmail.com"
post_image: "/static/img/tut/post-capturing-images.jpg"
track: "OpenCV Basics"
track_part: 5
---


## Introduction

Uptill now, we've used static images - images loaded from disk, and we did things with it. Now, you'll see how to capture images from a camera using the functions within the CV library itself. After we've got a working application, we'll add a filter to modify the image, (you can read up about filters in the Processing and filtering images tutorial).

## Part A: Capturing images

Create a new Win32 Console Application project... name it whatever you want. I named it Camera.

![](/static/img/tut/capture_1.jpg)

Click OK. As always, accept the defaults and click Finish. Again, this creates a file called Camera.cpp. Open it up. We'll be modifying it. 
    
    :::c++
    // Camera.cpp : Defines the entry point for the console application.
    //
    #include "stdafx.h"
    int main()
    {
        return 0;
    }

Above is the original Camera.cpp. We'll start off by including OpenCV headers. Add these lines at the top of Camera.cpp: 
    
    
    :::c++
    #include <cv.h>
    #include <highgui.h>

Also, go to Project > Camera Properties > Linker > Input, and put the following piece of text in the Additional Dependencies: "cv.lib cvaux.lib cxcore.lib highgui.lib", without the quotes of course.

With all this done, we'll start off with the actual capturing part. In OpenCV, you create a CvCapture structure. The structure is defined within the OpenCV headers and it "represents" a camera. If you have more than one camera connected to your computer, you can have this object point to any one camera. 

After the structure is created (successfully that is), you can ask it give you the current frame. If you repeatedly ask for the current frame, you can get images in real time. And that is exactly what we'll be doing: an infinite loop in which you request for the current image.

We'll start of by creating the capture structure. Add these lines to the main function: 
    
    
    :::c++
        CvCapture* capture = 0;
        capture = cvCaptureFromCAM(0);

capture is the pointer to a CvCapture structure. We initially set it to nothing (the zero). Then you initialize capture to point to the very first camera on your system (camera indices start from 0).

Once we've tried initializing capture, we need to make sure that it initialized properly. To do that, just check if capture is non zero. If it is, then it points to a camera properly. Add this code: 
    
    
    :::c++
        if(!capture)
        {
            printf("Could not initialize capturing...\
    ");
            return -1;
    
        }
    
        cvNamedWindow("video");

If capture is nonzero, it got initialized. If not, we print out a message and exit the program these itself. And we also create a new window, with the title "video".

Now that we have a CvCapture structure, we can request OpenCV to give us frames captured from the camera whenever we want. We'll start off with an infinite loop. Add this to the main function: 
    
    
    :::c++
        while(true)
        {
    

Next, we create an IplImage structure that will store the image captured from the camera: 
    
    
    :::c++
            IplImage* frame = 0;

Then we request OpenCV to give us the latest frame using the cvQueryFrame function:
    
    
    :::c++
            frame = cvQueryFrame(capture);
    
            if(!frame)
    
                break;

The cvQueryFrame function takes capture as a parameter. If you had multiple cameras attached, you could take images from the ones you wanted, and ignore the rest.

Then we check if the image we got is valid or not. If its zero, its an invalid image and we immediately get out of the infinite loop.

Finally, you display the image: 
    
    
    :::c++
            cvShowImage("video", frame);

Since this is an infinite loop, you need to have a mechanism to get out of it. We'll use the cvWaitKey() function I told you about earlier. We'll use it for two purposes: 1) Create a delay between capturing images (to restrict the number of images taken per second) 2) Check which key was pressed (to be able to decide when to quit).

First, to create a delay: 
    
    
    :::c++
            int c = cvWaitKey(20);

This makes sure that the program halts for 20 miliseconds. And in case there is a key press during this period... the ASCII value of the key goes into the variable c.

We can then check the value of c to decide when to get out of the infinite loop. And we do that using the following: 
    
    
    :::c++
            if((char)c==27 )
                break;
        }

27 is the ASCII code for the Escape key. So whenever you press the Escape key, the infinite loop ends.

Once the loop ends, we need to do a bit of cleanup. We need to release the camera so that other applications can use it. And we do that like this: 
    
    
    :::c++
        cvReleaseCapture(&capture);
        return 0;
    }

And that finishes up our program! As a checkpoint, here's the entire program:

Compile your program and execute it. You should see a windows with some video in it.

## Live effects!

Now that we have a working camera capturing application, you can use OpenCV to process images in real time!

You can really do anything - search for circles, or detect patches of colour, or anything else you can think of. For the sake of explanation, I'll show how to erode the image.

Just before the line cvShowImage("video", frame); in the code, add this line: 
    
    
    :::c++
    if(!frame)
    
        break;
    
    cvErode(frame, frame, 0, 2); // ADD this line
    cvShowImage("video", frame);

Whenever a frame is taken in from the camera, it is eroded and then displayed. So what you ultimately get is an eroded video of yours 

## Conclusion

In this tutorial you learned how to use OpenCV to access all the camera on your computer and also do things with the images you get. Next you'll learn how to create a bit more advanced user interfaces.

## Next Parts

This post is a part of an article series on OpenCV for Beginners 

  1. [Why OpenCV?](/tutorials/opencv/)
  2. [Installing and getting OpenCV running](/tutorials/installing-getting-opencv-running/)
  3. [Hello, World! With Images!](/tutorials/hello-world-images/)
  4. [Filtering Images](/tutorials/filtering-images/)
  5. **Capturing Images**
  6. [HighGUI: Creating Interfaces](/tutorials/highgui-creating-interfaces/)

---
title: "Hello World! with Images"
date: "2010-02-07 15:43:21"
excerpt: ""
category: "OpenCV"
author: "sinha.utkarsh1990@gmail.com"
post_image: "/static/img/tut/post-hello-world.jpg"
---


## Introduction

In this tutorial, we'll go through the essential steps for creating an OpenCV application. You'll see how to load an image into memory. And how to display it on screen. Along with this you'll also see some dirty work that needs to be done in order to compile OpenCV programs successfully.

## Step 1: Create a new project

Create a new Win32 Console Application named Hello.

![](/static/img/tut/helloworld_1.jpg)

Click OK. Accept the defaults. You'll end up with a bare project with a file named Hello.cpp. Open it, and we're ready for step 2. 

## Step 2: The code

At the very top of the file Hello.cpp, add the following lines of code: 
    
    :::c++
    #include <cv.h>
    #include <highgui.h>

This two lines include the main OpenCV headers and HighGUI (a library that lets you display windows).

Then, edit the main function: 
    
    :::c++
    int main()
    {

and add this line to it: 
    
    :::c++
        IplImage* img = cvLoadImage("C:\\\\hello.jpg");

IplImage is a structure pre-defined in the OpenCV libraries. It used by OpenCV to store an image and contains information about it, like its height, width, etc, and a pointer to the actual image data.

Then add these lines to the main function: 
    
    :::c++
        cvNamedWindow("myfirstwindow");
    
        cvShowImage("myfirstwindow", img);

These two lines use the HighGUI functions cvNamedWindow and cvShowImage. cvNamedWindow creates a new window with the specified title. And you always refer to a window using its title. In this case, its title is myfirstwindow.

cvShowImage does what you think it does... it displays the image passed to it in the given window.

Now, add these lines: 
    
    
    :::c++
        cvWaitKey(0);
        cvReleaseImage(&img);
        return 0;
    
    }

cvWaitKey is another HighGUI function. It waits for the given number of miliseconds for a key press, and returns the code of the key pressed. If the given time is 0 miliseconds, or less, it waits till eternity.

cvReleaseImage releases the memory allocated to an image. It is a good practice to always release images. Otherwise, you might end up using HUGE amounts of memory, for no reason. Notice the ampersand before img.

Just as a checkpoint, your code must look like this:

![](/static/img/tut/helloworld_2.jpg)

Everything is case sensitive, so make sure you've got it all right. 

Also, I've placed a file called hello.jpg in the C drive on my computer. You might want to place one too. I used this file, just in case you want:

![](/static/img/tut/hello.jpg)

## Step 3: Telling it to use OpenCV

Uptill now, we've included the OpenCV header files. But these header files just have informations about which function takes which parameters. They don't have any code which actually manipulates images.

All that code is stored within library files. So we need to include those as well. To do that, go to Project > Hello Properties. 

![](/static/img/tut/helloworld_3.jpg)

Then go to Configuration Properties > Linker > Input, and put the following piece of text in the Additional Dependencies: "cv.lib cvaux.lib cxcore.lib highgui.lib", without the quotes of course. 

![](/static/img/tut/helloworld_4.jpg)

Note: I'm assuming you added the directories as shown in the previous step, Installing and getting OpenCV running. 

## Step 4: Execution and a bit of analysis

Finally, if everything went right, compile it. You should get no warnings or errors. If you do, make sure your code is exactly the same as in the picture above. Check the case too.

Here's the output I got:

![](/static/img/tut/helloworld_5.jpg)

If you get an error saying that some DLL was not found, go to the BIN folder in your OpenCV directory and copy all the DLL files there into C:\\\Windows\\\System32. That should make it work. If not, try copying them into C:\\\Windows\\\System\\\

We created a console application, so we got a console. You can use this console the usual way (like using scanf to input, printf to print out things, etc).

We loaded a JPG file from the disk. cvLoadImage is a really powerful function... reading a JPG file is actually a lot of work, but all of that has been encapsulated into this single function. You can also use other file formats too. Currently supported formats include: 

  * Windows bitmaps - BMP, DIB
  * JPEG files - JPEG, JPG, JPE;
  * Portable Network Graphics - PNG;
  * Portable image format - PBM, PGM, PPM;
  * Sun rasters - SR, RAS;
  * TIFF files - TIFF, TIF;
  * OpenEXR HDR images - EXR;
  * JPEG 2000 images - jp2.

And this single function returns a IplImage, irrespective of the type of image loaded.

Next, we created a window with the title "myfirstwindow" and displayed the picture in it. And then we wait till eternity for a key press. If we remove this line, you window will flash, and it will instantly close. Try it out yourself. 

And finally, we released the memory allocated for the image.

## Next Parts

This post is a part of an article series on OpenCV for Beginners 

  1. [Why OpenCV?](/tutorials/why-opencv/)
  2. [Installing and getting OpenCV running](/tutorials/installing-and-getting-opencv-running/)
  3. [Hello, World! With Images!](/tutorials/hello-world-with-images/)
  4. [Filtering Images](/tutorials/filtering-images/)
  5. [Capturing Images](/tutorials/capturing-images/)
  6. [HighGUI: Creating Interfaces](/tutorials/highgui-creating-interfaces/)

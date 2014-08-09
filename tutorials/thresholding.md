---
title: "Thresholding"
date: "2010-01-03 19:07:36"
excerpt: ""
category: "OpenCV"
author: "sinha.utkarsh1990@gmail.com"
post_image: "/static/img/tut/post-thresholding.jpg"
---


## Introduction

Thresholding is one of the most basic techniques for what is called Image Segmentation. When you threshold an image, you get segments inside the image... each representing something. For example... complex segmentation algorithms might be able to segment out "house-like" structures in an image.

With thresholding, you can segment the image based on colour. For example, you can segment all red colour in an image. 

## Our Goal

Here's what we'll be making in this tutorial: an application that will threshold out the red regions in an image... something like this:

![An example of how thresholding works](/static/img/tut/thresholding_example.jpg)
: An example of how thresholding works

You might ask, exactly why go through all the trouble of thresholding an image? The reason for this is: The thresholded image is easier for the computer to analyse. It has got clear, stark boundaries, so the computer can easily find the boundary of each region (each of which represents a red patch).

Remember, thresholding isn't the best algorithm (as you'll see later)... but it gives reasonably good results for many images (as you can see in the image above). 

## The project

Start off by creating a C++ Win32 console application. Choose any name you want and click OK. Then, accept the default options and click Finish.

As always, we'll start off by adding OpenCV's headers: 
    
    :::c++
    #include <cv.h>
    #include <highgui.h>

Then, goto the Project > Properties > Configuration Properties > Linker > Input, and put the following piece of text in the Additional Dependencies: "cv.lib cvaux.lib cxcore.lib highgui.lib", without the quotes of course. Now we're ready to use OpenCV.

We'll start off by loading an image. Write this in the main function: 
    
    
    :::c++
    int main()
    {
        IplImage* img = cvLoadImage("C:\\\\shaastra.jpg");

NOTE: Make sure you change the image's path to something that actually exists.

Now, we'll create 3 grayscale images. These 3 images will hold the red, green and blue channels of the image img. Add these lines to the main function: 
    
    
    :::c++
        IplImage* channelRed = cvCreateImage(cvGetSize(img), 8, 1);
        IplImage* channelGreen = cvCreateImage(cvGetSize(img), 8, 1);
        IplImage* channelBlue = cvCreateImage(cvGetSize(img), 8, 1);

The cvCreateImage function allocates memory for an image. Currently, all these images are the same blank... each pixel is black.

Now, we'll copy each channel into these images... one at a time: 
    
    
    :::c++
        cvSplit(img, channelBlue, channelGreen, channelRed, NULL);

The cvSplit command split the 3 channel image img into three different channels. The order is Blue, Green and Red because thats how its stored in memory.

Up till now, we have the three channels with us:

![The three channels comprising the image](/static/img/tut/thresholding_channels.jpg)
: Red, green and blue channels of the image

We're interested in finding out the red regions... so we'll focus on the red channel (the top most in the above image).

You'll notice that not just the red regions are bright in the red channel... even the white regions are bright (because white=red+green+blue... so white is seen in all three channels).

To extract actual red areas, we remove areas common with the green and blue channels... something like this: Just red = red channel - (green channel + blue channel). And we implement this in code using the following commands (add these to the main function): 
    
    
    :::c++
        cvAdd(channelBlue, channelGreen, channelGreen);
    
        cvSub(channelRed, channelGreen, channelRed);

Basically, what we've done is add the blue and green channels, and store the result in the green channel. Then, subtract this green channel from the red channel. And store the result in red channel.

Here is what channelRed has after these operations have been performed:

![Only the red part remains](/static/img/tut/thresholding_onlyred.jpg)
: Only the red part remains

Notice that this in this image, only the actual red regions are bright... the rest of the image is dark. So uptill now we've been successful in isolating the red regions in the image.

Now, we do the thresholding. Add these lines to the main function: 
    
    
    :::c++
        cvThreshold(channelRed, channelRed, 20, 255, CV_THRESH_BINARY);

After this line, channelRed stores this:

![The thresholded image](/static/img/tut/thresholding_thresholded1.jpg)
: The thresholded image

See how the red region turn bright? This is segmentation. You create segments... White=red in the original image... black=non red.

Now, an analysis of what actually happens in the cvThreshold function. The function goes through each pixel of the image. If the value of the pixel is greater than 20 (the third parameter)... it changes it to a 255 (the fourth parameter). Thats the reason all the reds turn bright.

The first parameter is the source image. The second is the destination image.

And see the last parameter? (CV_THRESH_BINARY) This parameter decides the behaviour of this function. CV_THRESH_BINARY change the value to 255 when the value is greater than 20. An other possible value is: CV_THRESH_BINARY_INV... which is the reverse: if the value is greater than 20, it is set it 0... else it is set to 255.

Now that we've thresholded the image, all we need to do is display it. Add these lines: 
    
    
    :::c++
        cvNamedWindow("original");
        cvNamedWindow("red");
        cvShowImage("original", img);
        cvShowImage("red", channelRed);
        cvWaitKey(0);
        return 0;
    }

Execute the program, and you should see the thresholded image. 

## Thresholding isn't that great

But it lets you get through a lot of situations quite easily (and efficiently). If you tried thresholding the same image to get the green patches, you'd get something like this:

![Bad thresholding](/static/img/tut/thresholding_bad.jpg)
: Bad thresholding

You do get some greenish areas, but none of them isn't prominent enough.. and would probably be discarded as noise.

In such situations, you could try converting the image into HSV colour space. And then, segmenting the H channel. You'd have a narrow range of hues for green... to do that, you'd have to use the cvInRangeS function... which is described below.

## Advanced Thresholding

The cvThreshold function is good for simple purposes... places where you just need to check if a pixel's value is greater or less than a particular value.

More powerful functions are the cvCmp, cvCmpS, inRange and inRangeS function. The functions ending in an S let you compare the image against a particular value (like 20). The others let you compare the image against another image (so you could have different comparison values for different pixels).

The cvCmp function lets you specify the type of comparison (greater than, greater or equal, etc). Its syntaxes are: 
    
    
    :::c++
    cvCmp(src1, src2, dst, cmp_op);
    cvCmpS(src, value, dst, cmp_op);

`cmp_op` can take these values: 

  * CV_CMP_EQ - equal to
  * CV_CMP_GT - greater than
  * CV_CMP_GE - greater or equal
  * CV_CMP_LT - less than
  * CV_CMP_LE - less or equal
  * CV_CMP_NE - not equal to

The inRange function lets you specify a range of values (a minimum and a maximum) which is converted to a 255. Any value outside the range is set to 0. Its syntaxes are: 
    
    
    :::c++
    cvInRange(src1, lowersrc, uppersrc, dst);
    cvInRangeS(src, scalarLower, scalarHigher, dst);

Pretty much self explanatory. This function can be used to threshold out an HSV image... where the H channel holds the colour image. I've written a tutorial that uses these function, you might be interested in reading it: Tracking coloured objects. 

## Wrap up

Thats it for now. I hope you learned something from this.

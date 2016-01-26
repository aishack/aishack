---
title: "An introduction to contours"
date: "2010-01-01 18:45:56"
excerpt: ""
category: "Computer Vision"
author: "sinha.utkarsh1990@gmail.com"
post_image: ""
track: "Image processing algorithms (level 1)"
track_part: 4
---


## Introduction

In this tutorial, you'll get to know how to use contours. You can think of contours as a boundary. Consider the following thresholded image:

![A thresholded image](/static/img/tut/thresholding_thresholded.jpg)
: A thresholded image

Using contours, the computer can create a list of points for each "patch" or "blob" of white in the above image. Then you can do whatever you want with these points... figure out the center of the patch, or calculate its approximate size... etc. 

## The project

In this tutorial, we'll try and detect all quadrilaterals (polygons with 4 sides) in a thresholded image. We use a thresholded image because it has a clear differentiation: it's either black or white. And this really helps in generating accurate contours. You can go through the thresholding tutorial to learn about that.

Start off by creating a new C++ Win32 console application. Choose any name you want and click OK. Accept the defaults and click Finish. 

Goto the Project > Properties > Configuration Properties > Linker > Input, and put the following piece of text in the Additional Dependencies: "cv.lib cvaux.lib cxcore.lib highgui.lib", without the quotes of course. Now we're ready to use OpenCV.

With that done, we'll dive straight into the code... starting with the headers. Add these lines: 
    
    :::c++
    #include <cv.h>
    #include <highgui.h>

And then add these lines to the main function: 
    
    :::c++
    int main()
    {
       IplImage* img = cvLoadImage("C:\\\\thresholded.jpg");
       IplImage* contourDrawn = 0;
       cvNamedWindow("original");
       cvShowImage("original", img);

We load a thresholded image from disk into img. Note the 0... that indicates that the image we're loading is already grayscale. Then we create a pointer to an image, called countourDrawn. And then we create a new window titled "original" and display the original image in it.

Then add these line: 
    
    :::c++
        contourDrawn = DetectAndDrawQuads(img);
        cvNamedWindow("contours");
    
        cvShowImage("contours", contourDrawn);
    
        cvWaitKey(0);
        return 0;
    
    }

We'll work on the DetectAndDrawQuads function in a few moments. It just takes an image... and finds all possible quads in it, and returns a new image (which as all the contours drawn in it). This image is stored in contourDrawn. And then it is displayed in a window called "contours". And then you wait till eternity for a key press :)

Now lets get to the juice of the tutorial... actually detecting the presence of quads. Once you're through this, you'll be able to detect the presence of complex shapes as well... like circles, squares, even something as complex as a star.

Go above the main function and add these lines: 
    
    :::c++
    IplImage* DetectAndDrawQuads(IplImage* img)
    {
        CvSeq* contours;
        CvSeq* result;
        CvMemStorage *storage = cvCreateMemStorage(0);

This function returns an image... also takes an image as a parameter. Inside it, we first create some sequences (a sequence is roughly equal to a linked list): one for holding the various contours we'll get. The other is for temporarily holding the points of a contour as we go through each contour. Then we create some actual storage area... for storing the contours.

Then, add these lines: 
    
    :::c++
        IplImage* ret = cvCreateImage(cvGetSize(img), 8, 3);
        IplImage* temp = cvCreateImage(cvGetSize(img), 8, 1);

Then we create a blank image (of the same size as img) with 3 channels (rgb). We'll be drawing on this image. We also create a single channeled temporary image. Finding contours works only on grayscale images (with one channel). So to preserve the original image passed to us, we create a new image which is grayscale. To actually convert the image into grayscale, we use the following command: 
    
    :::c++
        cvCvtColor(img, temp, CV_BGR2GRAY);

This convert img from a BGR format into a grayscale image and stores it into temp. Now, add this line: 
    
    :::c++
        cvFindContours(temp, storage, &contours, sizeof(CvContour), CV_RETR_LIST, CV_CHAIN_APPROX_SIMPLE, cvPoint(0,0));

This line actually detects all the contours on the grayscale image img and stores them in contours.

Next we loop through all the contours discovered.. and try to figure out which one is a quad: 
    
    
    :::c++
        while(contours)
        {
            result = cvApproxPoly(contours, sizeof(CvContour), storage, CV_POLY_APPROX_DP, cvContourPerimeter(contours)*0.02, 0);

result now stores actual points from the image that lie on the contour. Now, the most simple logic for detecting a quad would be: if a contour has 4 points, it has a quad. As simple as that. And we implement that using the following code: 
    
    
    :::c++
            if(result->total==4)
            {
                CvPoint *pt[4];
                for(int i=0;i<4;i++)
    
                    pt[i] = (CvPoint*)cvGetSeqElem(result, i);
    
                cvLine(ret, *pt[0], *pt[1], cvScalar(255));
                cvLine(ret, *pt[1], *pt[2], cvScalar(255));
                cvLine(ret, *pt[2], *pt[3], cvScalar(255));
                cvLine(ret, *pt[3], *pt[0], cvScalar(255));
            }

If the number of points on a contour is 4... we take it to be a quadrilateral. Then, we get each point from result and store them into an array of points (pt[]). And then we draw the quadrilateral (joining each of the points... from 0 to 1, from 1 to 2, and so on).

To finish off this function, add these line: 
    
    
    :::c++
            contours = contours->h_next;
    
        }
    
        cvReleaseImage(&temp);
    
        cvReleaseMemStorage(&storage);
    
        return ret;
    }

We go on to the next contour. And the loop continues until all contours are checked. Once that is done, the temporary image is released.. and also the storage for contours. Note that we don't release img... it was given to us... so we assume that the function which passed it, will manage release it... we don't need to bother about that.

Finally, we return the image we've drawn. 

At this point, try executing the program. You'll get some output like this:

![Detection!](/static/img/tut/detect_nosize.jpg)
: Detection

Satisfactory results. Our program is somewhat able to recognize the presense of squares, and then draw an image. Notice the small quads? They aren't really quads...but the "jaggy" edges turn into quads. To eliminate some of this "noise", we can set a minimum limit on a contour to be considered a quad... say 20 pixels... so if a contour has more than 20 pixels inside it, it would be considered a quad... otherwise it would be taken as noise and would be ignored (no drawn).

To do this, you'd need to modify the if... change it to this line: 
    
    
    :::c++
    if(result->total==4 && fabs(cvContourArea(result, CV_WHOLE_SEQ)) > 20)

and you're done. The cvContourArea calculates the area of a contour, and returns it. If it is less than 20, we simply skip this contour. Note that we did a fabs... a floating number absolute. The area can be negative (this depends on the orientation of the points). So we simply take the magnitude and ignore the sign.

Run this code and you should get better results: 

![Detection with size constraints](/static/img/tut/detect_withsize.jpg)
: Detection with size constraints

Another condition used to reduce noise is checking convexity. You can do that using the cvCheckContourConvexity(result) function. If it returns a non zero value, the given contour is convex. Otherwise, it is concave.

![Convex vs Concave polygons](/static/img/tut/detect_convexity.jpg)Convex / concave
: Convex vs concave polygons

## Wrap up

Thats it for now. The program we've made isn't flawless: it doesn't detect the two small quads. I'll leave it up to you to find out why and figure out a way to "detect" them (hint: maybe they're not 4 points).

I hope you learned something from this. And if you have any suggestions or criticisms, do leave a comment!

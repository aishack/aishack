---
title: "Hough circles in OpenCV"
date: "2010-04-14 05:56:55"
excerpt: ""
category: "OpenCV"
author: "sinha.utkarsh1990@gmail.com"
post_image: "/static/img/tut/post-hough-transform-circle.jpg"
---
OpenCV comes along with an already made function that detects circles using [the hough transform](/tutorials/the-hough-transform-basics/). The [Circle Hough Transform](/tutorials/circle-hough-transform/) is a little inefficient at detecting circles, so it uses the gradient method of detecting circles using the hough transform. Anyway, you don't need to know the details about the internals if you just want to get the command to work. 

## The command

The command has the following syntax: 
    
    :::c++
    CvSeq* cvHoughCircles(CvArr* image, void* circle_storage, int method, double dp, double min_dist, double param1=100, double param2=100, int min_radius=0, int max_radius=0);
    

The parameters are similar to that of cvHoughLines2 ([Hough transform for lines in OpenCV](/tutorials/hough-transform-in-opencv/)). I'll go through each parameter in detail:

_image_ is the 8-bit single channel image you want to search for circles in. Because this function uses the gradient method, it automaticall calls cvSobel internally. So, even if you pass a grayscale image, it will automatically generate a binary using cvSobel (internally). 

_circle_storage_ is where the function puts its results. You can pass a matrix or a CvMemoryStorage structure here.

_method_ is always `CV_HOUGH_GRADIENT`

_dp_ lets you set the resolution of the accumulator. _dp_ is a kind of scaling down factor. The greater its value, the lower the resolution of the accumulator. _dp_ must always be more than or equal to 1.

_min_dist_ is the minimum distance between circle to be considered different circles.

_param1_ is used for the (internally called) canny edge detector. The first parameter of the canny is set to _param1_, and the second is set to _param1/2_.

_param2_ sets the minimum number of "votes" that an accumulator cell needs to qualify as a possible circle.

_min_radius_ and _max_radius_ do exactly what to mean. They set the minimum and maximum radii the function searches for. 

## Extracting results

To get results, you need to supply a _circle_storage_. It can be either a matrix of a `CvMemoryStorage` structure. 

### CvMat matrix

This is straightforward. You give it a matrix with N rows and 1 column, and in `CV_32FC3` format. It's three channeled to hold the three parameters (x, y and r). In this case, the function returns a NULL.

### CvMemoryStorage memory storage

Here you supply a `CvMemoryStorage` structure, and the function returns a `CvSeq` sequence. You can extract data from thsi sequence like this:

    :::c++
    float* circle = (float*) cvGetSeqElem(circles , index);

Then, _circle[0]_ is the x coordinate, _circle[1]_ is the y coordinate and _circle[2]_ is the radius of the circle. 

## Done!

This should be enough to get you started with using this function and identifying circles in your images!

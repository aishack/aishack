---
title: "Subpixel corners in OpenCV"
date: "2010-05-11 11:58:40"
excerpt: ""
category: "OpenCV"
author: "sinha.utkarsh1990@gmail.com"
post_image: "/static/img/tut/post-subpixel-corners.jpg"
---
OpenCV comes with a function to help you find subpixel corners. It uses [the dot product technique](/tutorials/subpixel-corners-increasing-accuracy/) to refine corners detected by other techniques, like [the Shi-Tomasi corner detector](/tutorials/the-shi-tomasi-corner-detector/). The function works iteratively, refining the corners till a termination criteria is reached. 

## Refining corners to subpixel level

The function that lets you calculate better corner positions is `cvFindCornerSubPix`: 
    
    :::c++
    void cvFindCornerSubPix(const CvArr* image,
                            CvPoint2D32f* corners,
                            int count,
                            CvSize win,
                            CvSize zero_zone,
                            CvTermCriteria criteria);
    

Before calling this function, you must use [cvGoodFeaturesToTrack](/tutorials/corner-detection-in-opencv/) to find the approximate location of corners in an image. This function will then refine those estimates.

With that in mind, I'll go through each one here. 

**image** - Quite basic, you pass the image you want to work on. This should be the same image you used in cvGoodFeaturesToTrack (or you'll end up with weird results)

**corners** - This is the array that holds the approximate corners initially. The function modifies this array with the refined corner positions.

**count ** - Quite basic, the number of points in the above array. Same as cvGoodFeaturesToTrack

**win_** - The technique used by this function requires several equations. This is done by using several pixels around the corner. _win_ lets you set the size of the window from which these pixels are taken. Example: cvSize(5, 5) 

**zero_zone** - Again, the technique used by this function solves several equations. The "solving" part is done using a matrix. This matrix is inverted to get a solution. However, some matrices are non-invertible. To prevent this, some pixels around the corner are ignored. zero_zone is that area.

![](/static/img/tut/subpixel-opencv-demo.jpg)

In the above picture, the red pixel is the (integer based) corner. _win_ has been set to 7x7. _zero_zone_ has been set to 3x3. So, only the green pixels are used to generating new equations. The grey pixels are ignored.

**criteria** - This is used in several iterative algorithms of OpenCV. It lets you specify the type (`CV_TERMCRIT_ITER` or `CV_TERMCRIT_EPS` or both), the number of iterations and the desired accuracy. 

## Summary

OpenCV lets you easily refine integer based corners. A simple to use function that does all the heavy duty work of iteratively increasing the accuracy of the supplied corners.

Also, I've attached a sample project to demonstrate the function.

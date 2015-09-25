---
title: "Timing macros in C/C++"
date: "2010-08-19 16:18:20"
excerpt: "Some quick macros to help profile your OpenCV code."
category: "General"
author: "shervin.emami@gmail.com"
post_image: "/static/img/tut/post-timing-macros.jpg"
---
Often you need to calculate the time it takes to execute a certain set of operations. And if you're trying to optimize your code, you'll need this even more. So here's a set of useful  macros that can help you do that (without any plumbing). 

## The Timing Macros

These macros use the OpenCV functions cvGetTickCount() and cvGetTickFrequency(). So they'll work only for your computer vision projects. These macros should work on all platforms. 
    
    :::c++
    // Record the execution time of some code, in milliseconds.
    #define DECLARE_TIMING(s)  int64 timeStart_##s; double timeDiff_##s; double timeTally_##s = 0; int countTally_##s = 0
    #define START_TIMING(s)    timeStart_##s = cvGetTickCount()
    #define STOP_TIMING(s) 	   timeDiff_##s = (double)(cvGetTickCount() - timeStart_##s); timeTally_##s += timeDiff_##s; countTally_##s++
    #define GET_TIMING(s) 	   (double)(timeDiff_##s / (cvGetTickFrequency()*1000.0))
    #define GET_AVERAGE_TIMING(s)   (double)(countTally_##s ? timeTally_##s/ ((double)countTally_##s * cvGetTickFrequency()*1000.0) : 0)
    #define CLEAR_AVERAGE_TIMING(s) timeTally_##s = 0; countTally_##s = 0

## Using the macros

Using these timing macros is really easy! Before doing anything, you must declare a timer. You must supply a name for the timer. Based on the name, new variables are created (that hold timing information). Then you can start and stop the timer. If you're using the timer for multiple operations done in an iteration, you can check the average time.

Here's some code to get your started: 
    
    :::c++
    // Example:
    DECLARE_TIMING(myTimer);
    while (something)
    {
        START_TIMING(myTimer);
        printf("Hello!\
    ");
        STOP_TIMING(myTimer);
    }
    printf("Execution time: %f ms.\
    ", GET_TIMING(myTimer) );
    printf("Average time: %f ms per iteration.\
    ", GET_AVERAGE_TIMING(myTimer) );

Pretty simple. 

## Summary

You now have some really great macros for timing your programs.

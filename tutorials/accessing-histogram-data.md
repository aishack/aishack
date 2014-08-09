---
title: "Accessing Histogram Data"
date: "2010-07-05 23:26:03"
excerpt: ""
category: "OpenCV"
author: "sinha.utkarsh1990@gmail.com"
post_image: "/static/img/tut/post-accessing-histogram-data.jpg"
---
If you couldn't check what value is stored in each bin, a histogram would be useless >.< So here are two methods to access those bins, one easy and one a little hard. 

## The easy way

This one is super simple. 
    
    :::c++
    double cvQueryHistValue_1D(CvHistogram* hist,
                               int idx0
    
                              );
    
    double cvQueryHistValue_2D(CvHistogram* hist,
                               int idx0,
                               int idx1
    
                              );
    
    double cvQueryHistValue_3D(CvHistogram* hist,
                               int idx0,
                               int idx1,
                               int idx2
    
                              );
    
    double cvQueryHistValue_nD(CvHistogram* hist,
                                int* idxN
    
                               );

Very straightforward. You supply the histogram and the index of the bin. The function returns the floating point value stored in that particular bin.

If you're using a 1D, 2D or 3D histogram, you have predefined functions for it. If you're using higher dimensional histograms (God help you :P) you must use the cvQueryHistValue_nD function. You must pass an array of integers containing the indices.

These fucntions are simple, but come with an extra overhead (they're functions, not direct machine code). If you're accessing the histogram a lot, you might want to try it the hard way: using pointers. 

## Using pointers

If you're accessing several bins sequentially, the pointer method would be a lot faster. The address won't need to be calculated again and again.

To get a pointer to a bin, you use one of these: 
    
    
    :::c++
    float* cvGetHistValue_1D(CvHistogram* hist,
                             int idx0
                            );
    float* cvGetHistValue_2D(CvHistogram* hist,
                             int idx0,
                             int idx1
                            );
    float* cvGetHistValue_3D(CvHistogram* hist,
                             int idx0,
                             int idx1,
                             int idx2
                            );
    float* cvGetHistValue_nD(CvHistogram* hist,
                             int* idxN
                            );

Note that this is a pointer to the bin, _not_ the bin's value. You can do pointer math on these and move around the different bins. 

## Sparse vs Dense Histograms

Dense histograms are the more intuitive one.You have bins for every possible value. Generally, you use this for images.

Sparse Histograms don't have a bin for every single value. Say the possible values are 0 to 2,147,483,648. But only 0.001% of these values actually exist in the data/image (and they are random). We can't store every single bin in this case. The range of values is ENORMOUS! One histogram could eat your entire RAM!

So it wold be a good idea to just store those 0.001% bins. That is exactly what sparse histograms do. They keep an internal data structure that tracks which bins exist and which ones don't.

**Note**: In sparse histograms, the `cvGetHistValue*` functions creates a new bin (with value 0) if it does not exist. So for sparse histgorams, you wouldn't want to just blatantly go through values using cvGetHistValue.

**Another Note**: `cvQueryHist*` does not create bins like that. 

## Summary

The CvHistogram datastructure and the functions of OpenCV make it a breeze to get access (either to the value or to the pointer) of each of the bins! And if a histogram is sparse, cvGetHistValue* would create a bin if it doesn't exist.

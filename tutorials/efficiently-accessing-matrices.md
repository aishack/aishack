---
title: "Efficiently accessing matrices"
date: "2010-04-20 04:38:25"
excerpt: ""
category: "OpenCV"
author: "sinha.utkarsh1990@gmail.com"
post_image: "/static/img/tut/post-opencv.jpg"
---
I've talked previous about matrices in [2D matrices with CvMat in OpenCV](/tutorials/2d-matrices-cvmat-opencv/). I talked about accessing using the cvGet* and cvSet* functions. But in computer vision, you need to do things as efficiently as possible. And those functions increase the overhead. So here's a super fast method of accessing data, using pointers. Don't worry, it's going to be easy! 

## Pointer math

The only thing you need to know is that the matrix elements are stored sequentially. And usually, you'd have two loops: the outer loop for the row, and a loop inside it for the column. And for each row and column, you can access the channel data.

Some code will clear up the idea: 
    
    :::c++
    for(int row=0;row<mat->rows;row++)
    {
        const float* ptr = (const float*)(mat->data.ptr + row*mat->step);
        for(int col=0;col<mat->cols;col++)
        {
            float c1 = *ptr++;
            float c2 = *ptr++;
            float c3 = *ptr++;
            float c4 = *ptr++;
        }
    }
    

You can see the outer _row_ loop. Inside it is the column loop, _col_. And inside both, you access the channel data for a particular pixel (I assumed a 4 channel matrix, _CV_32FC4_).

Simple eh? And its efficient too! 

!!tut-warn|Note that I calculate `ptr` for every row. That's because you can setup a "region of interest" in images. And this matrix might be a part of that. So you can't say that rows are continuous in memory. However, individual elements of a particular row will always be continuous in memory.!!

Oh! You might want to check [Memory layout of matrices of multi-dimensional objects](/tutorials/memory-layout-matrices-multidimensional-objects/). I've gone into detail about how matrices are stored in memory. And for one particular case, it's drastically different. Make sure you check that article as well. 

## Done!

With that, I think you should be able to access your matrices much more efficiently! Got questions? Suggestions or criticism? Let me know! Leave a comment!

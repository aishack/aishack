---
title: "OpenCV vs VXL vs LTI: Performance Test"
date: "2010-07-10 00:05:22"
excerpt: ""
category: "OpenCV"
author: "sinha.utkarsh1990@gmail.com"
post_image: "/static/img/tut/post-opencv-comparison.jpg"
---
I recently read this comparison of four vision libraries: OpenCV, VXL, LTI and OpenCV with IPP. It was in the book Learning [Learning OpenCV: Computer Vision with the OpenCV Library](http://www.amazon.com/gp/product/0596516134?ie=UTF8&tag=aish04-20&linkCode=as2&camp=1789&creative=9325&creativeASIN=0596516134)![](http://www.assoc-amazon.com/e/ir?t=aish04-20&l=as2&o=1&a=0596516134), authored by the creators of OpenCV themselves. For those who aren't familiar with these libraries, here's a brief introduction. 

## VXL

VXL stands for Vision something Library. It is a C++ library that implements several common computer vision algorithms and related functionality. The idea is to replace the 'X' with one of the several letters: 

  * VGL = Vision Geometry Library
  * VIL = Vision Image processing Library
  * VNL = Vision Numerics Library
  * VSL = Vision Streaming Library
  * There are several other libraries as well

## LTI

LTI-Lib is another object oriented library for computer vision. It has also been implemented in C++. It also includes classes that encapsulate multithreading, synchronization, serial port access, etc. And it ensures you don't have to deal with changing operating systems or hardware. 

## OpenCV

Yet another computer vision library. It includes over 500 functions for various commonly used algorithms. It also comes with a machine learning library and a portable window creation library. With version 2.0, OpenCV comes with a C++ interface as well. Before 2.0, it was only the C interface. 

## OpenCV + IPP

OpenCV developers were friendly with the Intel Performance Primitives team. So, OpenCV makes use of IPP code (which is hand tuned and extremely optimized code) to speed up execution. And this, as you'll see, gives a substantial boost to its execution speed. 

## The comparison

The machine used was a Pentium M 1.7GHz. Four tests were done: 

  1. 2D DFT: Forward fourier transform of a 512x512 image
  2. Resize: 512x512 to a 384x384 image, bilinear interpolation. An 8-bit, 3 channeled image was used
  3. Optical flow: 520 points were tracked with a 41x41 window and 4 pyramid levels
  4. Neural net: the mushroom benchmark of FANN

The results were like this (I've tried my best to replicate the chart as best as possible):

![The OpenCV vs VXL vs LTI comparison chart](/static/img/tut/VXL_LTI_VC_comparison.jpg)
: The opencv vs VXL vs LTI comparison chart

Hmm. It can't get simpler. If you want to do your computer vision thing super fast, you _must_ use OpenCV. If possible, Go for OpenCV+IPP. If something doesn't work fast enough, there are only two possibilities: 

  1. You don't know how to use it (doing template matching on a 3000x3000 image)
  2. The algorithm itself is slow and current technology can't make it go faster (like SIFT)

If you can think of other possibilities, please leave a comment and let me know :P Anyway, in either case, the algorithm will work even slower on other vision libraries.

!!tut-success|Whatever vision task you have, choose OpenCV :D This (probably) only applies to desktops/laptops. If you're using it on mobile, you can probably reconsider :)!!

**Note:** OpenCV does NOT depend on IPP in any way. But, if it detects IPP on a particular system, it will automatically make use of it.

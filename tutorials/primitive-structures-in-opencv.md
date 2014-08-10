---
title: "Primitive structures in OpenCV"
date: "2010-03-24 16:30:22"
excerpt: ""
category: "OpenCV"
author: "sinha.utkarsh1990@gmail.com"
post_image: "/static/img/tut/post-opencv.jpg"
---
OpenCV comes with several predefined structures, including `CvScalar`, `CvPoint`, etc. But the three most important structures are `CvArr`, `CvMat` and `IplImage`. You can call them the primitive data types for OpenCV. From the C point of view, these are not exactly 'primitive' data types. But they are the fundamental data types on which OpenCV manipulates (resize, threshold, etc). 

## Inheritance

The three structures are "related" to each other by "inheritance". No, its not the C++ or Java inheritance. OpenCV was made using C, so there's no such concept. But, their relation mimics inheritance.

![](/static/img/tut/opencv-inheritance.jpg)
: Inheritence in OpenCV

`CvArr` is the "base" class. Think of it like an abstract class. It is merely used as parameters for various functions. You never actually create an "object" of `CvArr`.

`CvMat` is "derived" from `CvArr`. Logically, a matrix is nothing but an extension of an array. So it makes sense. These matrices aren't the ones you had studied in school. Its a generalization. Matrices can be N dimensional. And each "element" of this matrix can hold more than one values (technically, every element is a tuple). 

`IplImage` is the structure that actually holds images that have to be manipulated. You'll use this a LOT in OpenCV. With this structure, you can store images in multiple formats: single, three, or four channels, and each channel holding integers (in various formats) or floating point decimals.

This is your "normal" image is a 3 channel 8-bit image. While manipulating, you'll come across several operators that return "images" in other formats as well. 

Another important point to note: If you see `CvArr` as a parameter to some function, you can pass a `CvMat` or an `IplImage`. Both are acceptable. Similarly, if you see `CvMat` as a parameter, you can pass a `CvMat` (obviously) or an `IplImage`. But If you see `IplImage`, you can only pass `IplImage`.

It works just like inheritance, where you can pass derived classes in place to parent classes.

---
title: "Mathematical Morphology in OpenCV"
date: "2010-07-14 23:18:15"
excerpt: ""
category: "OpenCV"
author: "sinha.utkarsh1990@gmail.com"
post_image: "/static/img/tut/post-morphology-opencv.jpg"
---


## Introduction

All the operations I talked about in the post [Mathematical Morphology](/tutorials/mathematical-morphology/) can be easily implemented in OpenCV. It even supports [several advanced morphological operations](/tutorials/mathematical-morphology-composite-operations/), right out of the box! So lets begin with, creating a custom structuring element. 

## Creating a structuring element

There's a dedicated function that creates structuring elements. It lets you create standard structuring elements very easily. Creating custom elements is also easy. 
    
    :::c++
    IplConvKernel* cvCreateStructuringElementEx(int cols,
                                                int rows,
                                                int anchor_x,
                                                int anchor_y,
                                                int shape,
                                                int* values=NULL);
    

Most of the parameters are quite self explanatory.

_cols_ and _rows_ is the number of columns and rows in the structuring element 

_anchor_x_ and _anchor_y_ point to the anchor pixel. The pixel that is checked for when the transformation should be made or not.

_shape_ lets you choose from three standard structuring elements. Or, if you want, you can set it to use a custom structuring element: 

  * CV_SHAPE_RECT
  * CV_SHAPE_CROSS
  * CV_SHAPE_ELLIPSE
  * CV_SHAPE_CUSTOM

![A 3x3 cross structuring element](/static/img/tut/morphology-cross-3x3.jpg)

If you set _shape_ to _CV_SHAPE_CUSTOM_, you must somehow supply the custom element. This is done using _values_. This parameter is used only if _shape_ is set to custom. 

_values_ should be a 2D matrix, corresponding to the structuring element itself.

If values is NULL (and _shape_ is custom), then all points in the structuring element will be considered nonzero (a rows*cols sized rectangle). 

## Dilation

This operation is the basic building block of morphology. So there's a function dedicated for this. 
    
    :::c++
    void cvDilate(const CvArr* src,
                  CvArr* dst,
                  IplConvKernel* element=NULL,
                  int iterations=1);
    

The function takes four parameters: 

  * _src_: The image you want to dilate
  * _dst_: This is where the dilated image is stored
  * _element_: (optional) The structuring element (use cvCreateStructuringElementEx to create one). If not specified, a 3x3 square is used.
  * _iterations_: (optional) Number of times you want to dilate _src_. If not specified, this is set to 1.

This operation is in-place. You can use the same image as _src_ and _dst_. 

## Erosion

Erosion is also a basic function of morphology. There's a function dedicated for this as well: 
    
    :::c++
    void cvErode(const CvArr* src,
                 CvArr* dst,
                 IplConvKernel* element=NULL,
                 int iterations=1);
    

The parameters are the same as dilation. Just that you perform an erosion instead of dilation. 

  * _src_: The image you want to erode
  * _dst_: This is where the eroded image is stored
  * _element_: (optional) The structuring element (use cvCreateStructuringElementEx to create one). If not specified, a 3x3 square is used.
  * _iterations_: (optional) Number of times you want to erode _src_. If not specified, this is set to 1.

This is also an in-place operation. _src_ and _dst_ can point to the same image. 

## Composite Operations

OpenCV has a function that lets you do composite morphological operations as well. These operations include: 

  1. Opening
  2. Closing
  3. Morphological Gradient
  4. Top Hat
  5. Black Hat

The one function that lets you do all this is: 
    
    :::c++
    void cvMorphologyEx(const CvArr* src,
                        CvArr* dst,
                        CvArr* temp,
                        IplConvKernel* element,
                        int operation,
                        int iterations=1);
    

Again, the parameters are very similar to cvDilate and cvErode (_*sigh*_, morphology is so monotonous :P) 

  * _src_: The image you want to work on
  * _dst_: This is where the final result is stored
  * _element_: (optional) The structuring element (use cvCreateStructuringElementEx to create one). If not specified, a 3x3 square is used.
  * operation: This is the only parameter that differs from the previous functions. Its possible values are: 
    * CV_MOP_OPEN
    * CV_MOP_CLOSE
    * CV_MOP_GRADIENT
    * CV_MOP_TOPHAT
    * CV_MOP_BLACKHAT
If you're not sure what each of these means, have a look at these articles. 
  * _iterations_: (optional) Number of iterations. If not specified, this is set to 1.

## Other operations

If you want to do other operations, you must write your own code. Mostly you'll have to do the following tasks in some order: 

  * Subtract/add images
  * Multiply an image by a scalar
  * Erode/dilate
  * Create a custom structuring element

You already know how these are done! So you're ready to take on any composite operation in mathematical morphology that you can think of! 

## Summary

OpenCV lets you perform several morphological operations very easily. You can even write your own morphological functions through OpenCV without any problems!

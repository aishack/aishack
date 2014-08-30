---
title: "Image convolution examples"
date: "2010-08-16 19:53:17"
excerpt: ""
category: "Computer Vision"
author: "sinha.utkarsh1990@gmail.com"
post_image: "/static/img/tut/post-convolutions.jpg"
series: "Convolutions"
part: 2
---
A convolution is very useful for signal processing in general. There is a lot of complex mathematical theory available for convolutions. For digital image processing, you don't have to understand all of that. You can use a [simple matrix as an image convolution kernel](/tutorials/convolutions/) and do some interesting things! 

## Simple box blur

Here's a first and simplest. This convolution kernel has an averaging effect. So you end up with a slight blur. The image convolution kernel is:

![The convolution kernel for a simple blur](/static/img/tut/conv-simple-blur.jpg)

Note that the sum of all elements of this matrix is 1.0. This is important. If the sum is not exactly one, the resultant image will be brighter or darker.

Here's a blur that I got on an image:

  
  
![After a simple blur done with a convolution](/static/img/tut/conv-simple-blur-result1.jpg)  
: A simple blur done with convolutions  
  

## Gaussian blur

Gaussian blur has certain mathematical properties that makes it important for computer vision. And you can approximate it with an image convolution. The image convolution kernel for a Gaussian blur is:

![](/static/img/tut/conv-gaussian-blur.jpg)

Here's a result that I got:

![Result of gaussian blur with a convolution](/static/img/tut/conv-gaussian-blur-result.jpg)

## Line detection with image convolutions

With image convolutions, you can easily detect lines. Here are four convolutions to detect horizontal, vertical and lines at 45 degrees:

![Convolution kernels for line detection](/static/img/tut/conv-line-detection.jpg)I looked for horizontal lines on the house image. The result I got for this image convolution was:

![Detecting horizontal lines with a convolution](/static/img/tut/conv-line-detection-horizontal-result.jpg)

## Edge detection

The above kernels are in a way edge detectors. Only thing is that they have separate components for horizontal and vertical lines. A way to "combine" the results is to merge the convolution kernels. The new image convolution kernel looks like this:

![The edge detection convolution kernel](/static/img/tut/conv-edge-detection.jpg)

Below result I got with edge detection:

![Edge detection with convolutions](/static/img/tut/conv-edge-detection-result.jpg)

## The Sobel Edge Operator

The above operators are very prone to noise. The Sobel edge operators have a smoothing effect, so they're less affected to noise. Again, there's a horizontal component and a vertical component.

![The sobel operator's convolution kernel](/static/img/tut/conv-sobel.jpg)

On applying this image convolution, the result was:

![Result of the horizontal sobel operator](/static/img/tut/conv-sobel-result.png)

## The laplacian operator

The laplacian is the second derivative of the image. It is extremely sensitive to noise, so it isn't used as much as other operators. Unless, of course you have specific requirements.

![The kernel for the laplacian operator](/static/img/tut/conv-laplacian.jpg)

Here's the result with the convolution kernel without diagonals:

![The result of convolution with with the laplacian operator](/static/img/tut/conv-laplacian-result.png)

## The Laplacian of Gaussian

The laplacian alone has the disadvantage of being extremely sensitive to noise. So, smoothing the image before a laplacian improves the results we get. This is done with a 5x5 image convolution kernel.

![The kernel for the laplacial of gaussian operation](/static/img/tut/conv-laplacian-of-gaussian.jpg)

The result on applying this image convolution was:

![The result of applying the laplacian of gaussian operator](/static/img/tut/conv-laplacian-of-gaussian-result.jpg)

## Summary

You got to know about some important operations that can be approximated using an image convolution. You learned the exact convolution kernels used and also saw an example of how each operator modifies an image. I hope this helped!

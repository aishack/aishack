---
title: "Image Moments"
date: "2011-06-21 12:04:56"
excerpt: "Image moments help identify certain key characteristics in images - like the center, area of white pixels, etc. We'll look at how these are calculated mathematically."
category: "OpenCV"
author: "sinha.utkarsh1990@gmail.com"
post_image: "/static/img/tut/post-image-moments.png"
track: "Image processing algorithms (level 2)"
track_part: 3
---
An Image moment is a number calculated using a certain formula. Understand what that formula means might be hard at first. In fact, I got a lot of questions about moments from [the tracking tutorial](/tutorials/tracking-colored-objects-in-opencv/) I did long back. So, here it is - an explanation of what moments area! 

## The math of moments

In pure math, the n^th^ order moment about the point c is defined as:

![](http://s0.wp.com/latex.php?latex=%5Cmu_%7Bn%7D%20%3D%20%5Cint_%7B-%5Cinfty%7D%5E%7B%2B%5Cinfty%7D%20%28x-c%29%5E%7Bn%7Df%28x%29%20%5C%2Cdx&bg=ffffff&fg=000&s=0)

This definition holds for a function that has just one independent variable. We're interested in images - they have two dimensions. So we need two independent variables. So the formula becomes:

![](http://s0.wp.com/latex.php?latex=%5Cmu_%7Bm%2Cn%7D%20%3D%20%5Cint%5Cint%28x-c_x%29%5E%7Bm%7D%28y-c_y%29%5E%7Bn%7Df%28x%2C%20y%29%5C%2Cdy%5C%2Cdx&bg=ffffff&fg=000&s=0)

Here, the f(x, y) is the actual image and is assumed to be continuous. For our purposes, we need a discrete way (think pixels) to describe moments:

![](http://s0.wp.com/latex.php?latex=%5Cmu_%7Bm%2Cn%7D%20%3D%20%5Csum_%7Bx%3D0%7D%5E%7B%5Cinfty%7D%5Csum_%7By%3D0%7D%5E%7B%5Cinfty%7D%28x-c_x%29%5E%7Bm%7D%28y-c_y%29%5E%7Bn%7Df%28x%2C%20y%29&bg=ffffff&fg=000&s=0)

The intergrals has been replaced by summations. The order of the moment is m + n. Usually, we calculate the moments about (0, 0). So you can simply ignore the constants c~x~ and c~y~.

Now with the math part out of the way, let's have a look at what you can calculate with this thing. 

![A binary image with white and black pixels](/static/img/tut/zeroth-order.png)
: A binary image with white and black pixels

## Calculating area

To calculate the area of a binary image, you need to calculate its zeroth moment:

![](http://s0.wp.com/latex.php?latex=%5Cmu_%7B0%2C0%7D%20%3D%20%5Csum_%7Bx%3D0%7D%5E%7Bw%7D%5Csum_%7By%3D0%7D%5E%7Bh%7Dx%5E%7B0%7Dy%5E%7B0%7Df%28x%2C%20y%29&bg=ffffff&fg=000&s=0)

The x^0^ and y^0^ don't have any effect and can be removed.

![](http://s0.wp.com/latex.php?latex=%5Cmu_%7B0%2C0%7D%20%3D%20%5Csum_%7Bx%3D0%7D%5E%7Bw%7D%5Csum_%7By%3D0%7D%5E%7Bh%7Df%28x%2C%20y%29&bg=ffffff&fg=000&s=0)

Now, in a binary image, a pixel is either 0 or 1. So for every white pixel, a '1' is added to the moment - effectively calculating the area of the binary image! Another thing to note is that there is only one zeroth order moment. 

## Centroid

To calculate the centroid of a binary image you need to calculate two coordinates -

![](http://s0.wp.com/latex.php?latex=centroid%20%3D%20%28%5Cfrac%7B%5Cmu_%7B1%2C0%7D%7D%7B%5Cmu_%7B0%2C0%7D%7D%2C%20%5Cfrac%7B%5Cmu_%7B0%2C1%7D%7D%7B%5Cmu_%7B0%2C0%7D%7D%29&bg=ffffff&fg=000&s=0)

How did I get that? Here's a quick explanation. Consider the first moment:

![](http://s0.wp.com/latex.php?latex=sum_x%20%3D%20%5Csum%5Csum%20x%20f%28x%2C%20y%29&bg=ffffff&fg=000&s=0)

The two summations are like a _for_ loop. The x coordinate of all white pixels (where f(x, y) = 1) is added up.

Similarly, we can calculate the sum of y coordinates of all white pixels: 

![](http://s0.wp.com/latex.php?latex=sum_y%20%3D%20%5Csum%5Csum%20y%20f%28x%2C%20y%29&bg=ffffff&fg=000&s=0)

Now we have the sum of several pixels' x and y coordinates. To get the average, you need to divide each by the number of pixels. The number of pixels is the area of the image - the zeroth moment. So you get:

![](http://s0.wp.com/latex.php?latex=%5Cmu_%7B1%2C0%7D%20%3D%20%5Cfrac%7Bsum_x%7D%7B%5Cmu_%7B0%2C0%7D%7D&bg=ffffff&fg=000&s=0) and ![](http://s0.wp.com/latex.php?latex=%5Cmu_%7B0%2C1%7D%20%3D%20%5Cfrac%7Bsum_y%7D%7B%5Cmu_%7B0%2C0%7D%7D&bg=ffffff&fg=000&s=0)

One interesting thing about this technique is that it is not very sensitive to noise. The centroid might move a little bit but not much.

Also, from the math it's clear this technique holds only for single blobs. If you have two white blobs in your image, the centroid will be somewhere in between. You'll have to extract each blob separately to get their centroids. 

![Calculating the centroid](/static/img/tut/first-order.png)
: Calculating the centroid of this blob


## Central moments

In fact, this kind of division is very common - dividing a moment by the zeroth order moment. It's so common that it has a name of its own - central moments.

So to calculate the centroid, you need to calculate the first order central moments. 

## Higher order moments

Going onto higher order moments, things get complicated really fast. You have  three 2^nd^ order moments, four 3^rd^ order moments, etc. You can combine several of these  moments so that they are translation invariant, scale invariant and even rotation invariant.

While reading about moments, I found an entire book dedicated to [pattern recognition with moments](http://www.amazon.com/gp/product/0470699876/ref=as_li_ss_tl?ie=UTF8&tag=aish04-20&linkCode=as2&camp=217145&creative=399373&creativeASIN=0470699876)![](http://www.assoc-amazon.com/e/ir?t=&l=as2&o=1&a=0470699876&camp=217145&creative=399373). In fact, there are terms called _skewness_ and _kurtosis_. These refer to third and fourth order moments. They measure how skewed an image is and whether an image is tall and thin or short and fat. Clearly, there's a LOT that can be learned about these mathematical tools.

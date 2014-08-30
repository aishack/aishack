---
title: "Histograms: From simplest to the most complex"
date: "2010-07-03 23:37:40"
excerpt: ""
category: "Computer Vision"
author: "sinha.utkarsh1990@gmail.com"
post_image: "/static/img/tut/post-histogram-simple-complex.jpg"
---
If you've used photoshop, you probably know what a histogram is. Even digital cameras have it these days. But a histogram isn't just about the chart you see there. Histograms have several uses in various fields. In this post, we'll have a look at histograms from a general perspective. 

## The General Histogram

A histogram is a series of bins. You can store one value in each bin. That's it. Each bin "belongs" to range of values, say 0 to 10, 10 to 40, etc. So if some value X belongs to this range, something is added to this bin. The bins can be non-uniform if required. But usually people go for uniform width bins.

## The 1-D Histogram

This is the one you're most familiar with. Bins are usually like this: 0.00-0.99, 1.00-1.99 and so on. This way you effectively get a "discrete" histogram (1 goes into a bin, 45 goes into another, etc).

![A one dimensional histogram](/static/img/tut/hist-1d.jpg)
: A one dimensional histogram

If you want, you can have wider bins too. The SIFT algorithm makes extensive use such histograms. It divides 360 degrees into 8 bins. So angles from 0-44.99 degrees go into one bin, 45-89.99 into the next, etc.

## The 2-D Histogram

Again, relatively easy to understand. You can imagine this to be a 3D bar chart in Word. The range of bins now becomes two dimensional. For example: (0, 0)-(44.99, 44.99), etc

![A 2D histogram](/static/img/tut/hist-2d.jpg)
: A 2D histogram

Something similar to this is used in the Hough transform. It is referred to as the accumulator cells, but ultimately they act like bins of a histogram.

## The 3-D Histogram

Things start getting weird from this point on. Visualizing a 3D histogram is a bit harder. The bins are now distributed in 3D space. And because each bin itself has stores value, the 3D histogram is a 4D object (x,y,z,value of bin). And you probably already know humans aren't that good at imagining 4D.

One way of visualizing it is to take a plane and pass it through the 3D space. That way, you fix one particular dimension and you can visualize the three that remain.

![Visualizing a 3D histogram](/static/img/tut/hist-3d.jpg)
: Visualizing a 3D histogram

## The N-D Histogram

Don't even try visualizing this. Just think of it as an N dimensional array. That's it. You supply an index (say (2,45,6,89,5,7,63,10,3745,125,10,88,55) ) and you get a value. 

## Summary

All this was pretty simple. But histograms can be immensely useful. All the way from correcting the "look" of an image to figuring out the gesture of a hand ;)

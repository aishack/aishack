---
title: "Implementing SIFT in OpenCV"
date: "2010-07-02 23:50:35"
excerpt: ""
category: "OpenCV"
author: "sinha.utkarsh1990@gmail.com"
post_image: "/static/img/tut/post-sift.jpg"
---
Okay, now for the coding. I'm assuming you know how SIFT works (if not, check [SIFT: Scale Invariant Feature Transform](/tutorials/sift-scale-invariant-feature-transform-introduction/). It's a series of posts on the SIFT algorithm). I'll be using C++ and classes to keep things neat and object oriented. OpenCV doesn't come with inbuilt functions for SIFT, so we'll be creating our own functions. My code here is based on code by Jun Liu. He implemented SIFT with VXL (another vision library like OpenCV). 

## The Code

You can download the code at the bottom. Download and have a look at it before going through this post..

In the code, I've added a lot of comments throughout. With those comments and knowledge of the algorithm, you should be able to understand what the code does pretty easily. 

**SIFT.h and SIFT.cpp**

These two files implement a class: SIFT. Through this class you do everything. Load the image to work on, get descriptors, etc. 

The class has a simple interface. You create a new object and call DoSift(). Every step will be done for you! Everything is well explained in the code with comments, so have a look there. It would take another week of posts to explain each line of code, so I'm not doing that. The comments should be enough.

**Descriptor.h**

This class just holds a keypoint's fingerprint. It can store the location of the keypoint and the feature vector.

**KeyPoint.h**

This class holds the keypoint information: location (x, y), scale, magnitude and orientation.

**MySIFT.cpp**

The small main function in the file uses the SIFT class. It's just a little demo of how things work. 

## A learning aid

At several key locations in code, you'll notice commented code. Something like this:

![](/static/img/tut/sift-code-commented.jpg) 

Uncomment there lines. You'll get physical files that you can use to examine the scale space, difference of gaussians, extrema, etc. That way you'll actually get a sense of what's going on (Again, I'm not going into the details of what there are. I've already covered these in the series [SIFT: Scale Invariant Feature Transform](/tutorials/sift-scale-invariant-feature-transform-introduction/)) I'll leave it up to you to find these commented blocks (assignment worth 10%?). 

## Fin

Over the last week I've talked about how the algorithm works. And finally, implemented the code. So I guess this marks an end for the series! Sometime in the future, we'll pick up the topic of matching SIFT features in different images.

Anyway, if you've got any questions or suggestions about the code, let me know - **leave a comment below**! 

## The theory series

  1. [SIFT: Scale Invariant Feature Transform](/tutorials/sift-scale-invariant-feature-transform-introduction/)
  2. [Step 1: Constructing a scale space](/tutorials/sift-scale-invariant-feature-transform-scale-space/)
  3. [Step 2: Laplacian of Gaussian approximation](/tutorials/sift-scale-invariant-feature-transform-log-approximation/)
  4. [Step 3: Finding Keypoints](/tutorials/sift-scale-invariant-feature-transform-keypoints/)
  5. [Step 4: Eliminate edges and low contrast regions](/tutorials/sift-scale-invariant-feature-transform-eliminate-low-contrast/)
  6. [Step 5: Assign an orientation to the keypoints](/tutorials/sift-scale-invariant-feature-transform-keypoint-orientation/)
  7. [Step 6: Generate SIFT features](/tutorials/sift-scale-invariant-feature-transform-features/)
  8. **Implementing SIFT in OpenCV**

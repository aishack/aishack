---
title: "Interesting windows in the Harris Corner Detector"
date: "2010-04-29 13:21:27"
excerpt: "The \"score\" calculated for each pixel in the Harris Corner Detector is based on the two eigenvalues of a matrix. The expression to calculate it is not arbitrary, but based on observations of how the expression varies with different eigenvalues. Here's a graphical explanation of how its done."
category: "Computer vision"
author: "sinha.utkarsh1990@gmail.com"
post_image: "/static/img/tut/post-interesting-features.jpg"
---
The "score" calculated for each pixel in the [Harris Corner Detector](/tutorials/harris-corner-detector/) is based on the two eigenvalues of a matrix. The expression to calculate it is not arbitrary, but based on observations of how the expression varies with different eigenvalues. Here's a graphical explanation of how its done. 

## The key idea

The main idea is to implement the "selection" of corner pixels. This is done using the following score expression:

![](/static/img/tut/harris-equation8.jpg)
: The equations

We need to decide which values of R qualify a pixel as a corner. Here's another figure:

![](/static/img/tut/score-isoresponse-contours.jpg)
: Visualization of the equations

I've taken this figure directly from the original paper that describes the Harris Corner Detector (A combined corner and edge detector, Harris and Stephens, 1988). Here, _alpha _and _beta_ are the two eigenvalues. 

  * Both eigenvalues are small, then the pixel is "flat" (the white region)
  * One eigenvalue is large, and the other is small, then the pixel is an edge (the gray region)
  * Both eigenvalues are large, then the pixel is a corner (the crossed region)

The figure also show contours for the score function. On selecting a proper value, you get positive values in the corner region, and negative values everywhere else.

And thus, the expression for calculating score for each pixel was created! 

## Improvements!

Later on, in 1994, Shi and Tomasi came up with a better corner detection scheme. Their work involved only minor changes in the Harris Corner Detector, but were able to produce better results in corner detection.

In fact, OpenCV implements the Shi and Tomasi corner detector.

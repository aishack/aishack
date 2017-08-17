---
title: "The Shi-Tomasi Corner Detector"
date: "2010-05-02 21:52:01"
excerpt: "A lot of computer vision algorithms use features as their backbone. But what exactly is a feature?"
category: "Computer Vision"
author: "sinha.utkarsh1990@gmail.com"
post_image: "/static/img/tut/post-interesting-features.jpg"
series: "Fundamentals of Features and Corners"
part: 4
---
The Shi-Tomasi corner detector is based entirely on the [Harris corner detector](/tutorials/harris-corner-detector/). However, one slight variation in a "selection criteria" made this detector much better than the original. It works quite well where even the Harris corner detector fails. So here's the minor change that Shi and Tomasi did to the original Harris corner detector. 

## The change

The Harris corner detector has a corner selection criteria. A score is calculated for each pixel, and if the score is above a certain value, the pixel is marked as a corner. The score is calculated using two eigenvalues. That is, you gave the two eigenvalues to a function. The function manipulates them, and gave back a score.

You can read more about how [interesting windows in the Harris corner detector](/tutorials/windows-harris-corner-detector/) are selected.

Shi and Tomasi suggested that the function should be done away with. Only the eigenvalues should be used to check if the pixel was a corner or not.

The score for **Harris **corner detector was calculated like this (R is the score):

![](/static/img/tut/harris-equation8.jpg)

For **Shi-Tomasi**, it's calculated like this: 
![](/static/img/tut/shi-tomasi-score.jpg)

In their paper, Shi and Tomasi demonstrated experimentally that this score criteria was much better. If R is greater than a certain predefined value, it can be marked as a corner. Thus, the effect region for a point to be a corner is something like this:

![](/static/img/tut/shi-tomasi-region1.jpg)

  * Green: both λ~1~ and λ~2~ are greater than a certain value. Thus, this region is for pixels "accepted" as corners.
  * In the blue and gray regions, either λ~1~ or λ~2~ is less than he required minimum.
  * In the red region, both λ~1~ and λ~2~ are less than the required minimum.
Compare the above with [a similar graph for Harris corner detector](/tutorials/windows-harris-corner-detector/)... You'll see the blue and gray areas are equivalent to the "edge" areas. The red region is for "flat" areas. The green is for corners. 

## Summary

The Shi-Tomasi corner detector is a complete ripoff of the Harris corner detector, except for a minor change they did :P However, it is much better than the original corner detector, so people use it a lot more. Also, OpenCV implements the Shi-Tomasi corner detection algorithm.

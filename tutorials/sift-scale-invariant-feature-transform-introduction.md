---
title: "SIFT: Introduction"
date: "2010-05-14 22:22:09"
excerpt: "Learn how the famous SIFT keypoint detector works in the background. This paper led a mini revolution in the world of computer vision!"
category: "Computer Vision"
author: "sinha.utkarsh1990@gmail.com"
post_image: "/static/img/tut/post-sift.jpg"
featured: true
series: "SIFT: Theory and Practice"
part: 1
---
Matching features across different images in a common problem in computer vision. When all images are similar in nature (same scale, orientation, etc) [simple corner detectors](/tutorials/harris-corner-detector/) can work. But when you have images of different scales and rotations, you need to use the Scale Invariant Feature Transform. 

## Why care about SIFT

SIFT isn't just scale invariant. You can change the following, and still get good results: 

  * Scale (duh)
  * Rotation
  * Illumination
  * Viewpoint

Here's an example. We're looking for these:

![](/static/img/tut/sift-objects.jpg)

And we want to find these objects in this scene: 

![](/static/img/tut/sift-scene.jpg)

Here's the result: 

![](/static/img/tut/sift-result.jpg)

Now that's some real robust image matching going on. The big rectangles mark matched images. The smaller squares are for individual features in those regions. Note how the big rectangles are skewed. They follow the orientation and perspective of the object in the scene. 

## The algorithm

SIFT is quite an involved algorithm. It has a lot going on and can become confusing, So I've split up the entire algorithm into multiple parts. Here's an outline of what happens in SIFT. 

  1. **[Constructing a scale space](/tutorials/sift-scale-invariant-feature-transform-scale-space/)** This is the initial preparation. You create internal representations of the original image to ensure scale invariance. This is done by generating a "scale space".
  2. **[LoG Approximation](/tutorials/sift-scale-invariant-feature-transform-log-approximation/)** The Laplacian of Gaussian is great for finding interesting points (or key points) in an image. But it's computationally expensive. So we cheat and approximate it using the representation created earlier.
  3. **[Finding keypoints](/tutorials/sift-scale-invariant-feature-transform-keypoints/)** With the super fast approximation, we now try to find key points. These are maxima and minima in the Difference of Gaussian image we calculate in step 2
  4. **[Get rid of bad key points](/tutorials/sift-scale-invariant-feature-transform-eliminate-low-contrast/)** Edges and low contrast regions are bad keypoints. Eliminating these makes the algorithm efficient and robust. A technique similar to [the Harris Corner Detector](/tutorials/interesting-windows-in-the-harris-corner-detector/) is used here.
  5. **[Assigning an orientation to the keypoints](/tutorials/sift-scale-invariant-feature-transform-keypoint-orientation/)** An orientation is calculated for each key point. Any further calculations are done relative to this orientation. This effectively cancels out the effect of orientation, making it rotation invariant.
  6. **[Generate SIFT features](/tutorials/sift-scale-invariant-feature-transform-features/)** Finally, with scale and rotation invariance in place, one more representation is generated. This helps uniquely identify features. Lets say you have 50,000 features. With this representation, you can easily identify the feature you're looking for (say, a particular eye, or a sign board).
That was an overview of the entire algorithm. Over the next few days, I'll go through each step in detail. Finally, I'll show you how to **[implement SIFT in OpenCV](/tutorials/implementing-sift-in-opencv/)**! 

## What do I do with SIFT features?

After you run through the algorithm, you'll have SIFT features for your image. Once you have these, you can do whatever you want.

Track images, detect and identify objects (which can be partly hidden as well), or whatever you can think of. We'll get into this later as well.

But the catch is, this algorithm is patented.

>.<

So, it's good enough for academic purposes. But if you're looking to make something commercial, look for something else! [Thanks to aLu for pointing out SURF is patented too]

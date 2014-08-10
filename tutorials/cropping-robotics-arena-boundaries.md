---
title: "Cropping robotics arena boundaries"
date: "2010-04-05 18:55:18"
excerpt: ""
category: "OpenCV"
author: "sinha.utkarsh1990@gmail.com"
post_image: "/static/img/tut/post-cropping-robotics-arena.jpg"
---
Most image processing or computer vision based robotics competitions have a visually distinct arena boundary. You might want to exclude whatever is outside this boundary. Maybe to avoid detecting colors in that area. Or, maybe to prevent motion detection in those regions. Here's a simple technique that should work perfectly in any image processing based competition! 

## The idea

The main assumption is you can detect the arena boundary. Obviously. If you cannot detect the boundary, you just cannot crop it. Anyway, here's what I plan on doing. We'll remove the area outside the thick white boundary in the image below:

![The G.O.A.L. Arena](/static/img/tut/goal_arena.jpg)
: The robot football arena

We take this image, and discard any information outside the boundary. After all processing, it would look like this:

![](/static/img/tut/arena-cropped.jpg)
: The cropped arena, near perfect!

## How its done

The technique might need to be modified slightly, based on how you get your boundary on the arena. However, the key ideas will remain the same. 

### Step 1: Extract the whites

We need the white boundaries. So we extract everything that is white. This is done by ANDing all three channels of the image. What you get is something like this:

![](/static/img/tut/arena-whtes.jpg)

## Step 2: Clean up

There's a lot of stray unwanted white in the result we get. So filters need to be applied to get rid of these stray white pixels. In this case, the opening morphological operation (erosion followed by a dilation) does the trick. Here's the output after opening the image:

![](/static/img/tut/arena-whites-opened.jpg)

### Step 3: Thresholding

This is yet another step for cleaning up the image. We'll keep pixels only above a certain value. This value depends on the histogram you have for you image (based on lighting conditions, surface material, etc). After thresholding, the output looks something like this:

![](/static/img/tut/arena-whites-threshold.jpg)

### Step 4: The hough transform

Now we do the hough transform and find lines in the thresholded image. Here's a peek of all the lines that are detected: 

![](/static/img/tut/arena-detected-lines.jpg)

### Step 5: Generating single boundaries

Using all those lines, we generate a single boundary for each side of the arena. This is done by "averaging" these lines together. Here's what you get then:

![](/static/img/tut/arena-lines-averaged.jpg)

### Step 6: Calculating intersections

These are lines, not line segments. So we calculate the four corners of the arena (marked green) by solving for their intersection. And get ready for the final step.

![](/static/img/tut/arena-corners.jpg)

### Step 7: Generate a mask

With the four points in hand, we can easily generate a mask that covers the entire arena. Something like this:

![](/static/img/tut/arena-mask.jpg)

## Done!

The above series of steps needs to be done only once (ie if the camera remains still). So, to get the cropped image, all you need to do is AND the mask with the original image! It's super efficient and gets the job done pretty decently! The output you get looks like this: 

![](/static/img/tut/arena-cropped.jpg)

In the next article, we'll get into how to implement this with OpenCV.

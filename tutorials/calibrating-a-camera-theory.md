---
title: "Calibrating a camera: Theory"
date: "2010-07-26 23:43:04"
excerpt: ""
category: "Computer vision"
author: "sinha.utkarsh1990@gmail.com"
post_image: "/static/img/tut/post-camera-calibration.jpg"
---


## Calibration

Why calibrate your camera? After calibration, you can use your camera to do real world measurements. It establishes a relation between pixels and real world dimensions. Also, you can remove [distortions caused by a camera's physical flaws](/tutorials/two-major-physical-defects-in-cameras/). The goal of calibration is to estimate the following: 

  1. Focal length of lens along X axis
  2. Focal length of lens along Y axis
  3. Lens displacement along X axis
  4. Lens displacement along Y axis
  5. 3 numbers that describe radial distortion
  6. 2 numbers that describe tangential distortion
  7. The position of the camera in the real world (x, y and z)
  8. The orientation of the camera in the real world (around the x, y and z axis)

That's a lot of things that calibration establishes. Variables 1-4 constitute _intrinsic parameters_. Variables 5 and 6 are the _distortion parameters_. And variables 7 and 8 are the _extrinsic parameters_.

## Calibrating with chessboards

One standard procedure to calculate all the unknowns above, or simply calibrating a camera, is to use a chessboard pattern. It looks like this:

![A chessboard pattern](/static/img/tut/calib-chessboard-1.jpg)

Remember that this is just an algorithm. They designed it using a chessboard. They could have done it using something else too.. a box or even a rubber duck. But a chessboard certain properties that makes it good for calibrating purposes: 

  * It is a plane. You don't need to deal with "depth".
  * There exist points on this plane that you can identify uniquely.
  * You can extract these points very easily.
  * These points physically lie in straight lines, no matter how they appear on camera.

## Posing the chessboard

You take several pictures of the chessboard. Each picture in a different orientation. These orientations should vary a lot. Or you might get a bad estimate of the various parameters. A possible chessboard orientation could be like this:

![Multiple views of the chessboard](/static/img/tut/calib-chessboards-many.jpg)

From all those images, you solve several equations. The result is the best estimate for all the unknowns we were looking for. This solving produces what is known as a homography. A homography is a matrix that connects the image-coordinates (pixels) and the real world coordinates (meters, centimeters, etc).

I won't go into its math right now, but just know that multiplying the homography with the position of a point in actual plane (chessboard) produces its image coordinates. And multiplying the image coordinates by the matrix inverse produces actual plane coordinates. 

## After calibration

Once you're done with solving all the equations and you have a result, you can fix distortions in the image and make actual measurements. Calibration is also needed for stereo vision. 

## Summary

You got an overview of how one particular method of camera calibration works. OpenCV comes with several functions that help you implement this. But there are minor points that need to be taken care of. We'll implement it next.

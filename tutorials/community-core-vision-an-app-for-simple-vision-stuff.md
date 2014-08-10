---
title: "Community Core Vision: An app for simple vision stuff"
date: "2010-08-13 23:55:45"
excerpt: ""
category: "Reviews"
author: "sinha.utkarsh1990@gmail.com"
post_image: "/static/img/tut/post-review-community-core-vision.jpg"
---
Community Core Vision (or CCV) is a computer vision application developed for multi-touch tables (like [Microsoft Surface](http://www.youtube.com/watch?v=Zxk_WywMTzc)). It uses OpenFrameworks as the "creative" framework and OpenGL for rendering the GUI. And, of course, OpenCV for the vision part. 

## The intended use

The application is intended for use with touch tables. How? Well, touch tables have lasers the produce infrared light on the surface of the table. You you put your finger on the table, you block this light. In fact, you reflect this light to the bottom side of the table. This is captured by a high speed infrared camera. The application is supposed to receive this reflected-infrared-image.

![Fingers from an infrared camera](/static/img/tut/ccv-fingers1.jpg)
: Fingers from an infrared camera

You have a few filters that you can tweak to track fingers accurately. You can subtract backgrounds, blur the image, do a high pass filter and amplify the result. The results look something like this:

![Fingers being tracked in CCV](/static/img/tut/ccv-fingers-tracked.jpg)
: Fingers being tracked in CCV

Once you have an accurate track, you can transfer the position of each finger through TUIO, Flash XML or Binary TCP. You can connect to this application and receive information about each finger (ID, position, displacement and acceleration).

Your application can then take intelligent decisions based on this data.

## A possible use

Instead of touch tables, we can use this to track objects. But the background subtraction makes this application very versatile. You can detect pretty much anything. Here's a sample track I did on myself:

![Tracking a human in CCV](/static/img/tut/ccv-human-tracking.jpg)
: Tracking a human in CCV

See how useful the application can be? Here's a list of problems that this application just might solve: 

  * Car detection on a road (an empty road as the background)
  * Pedestrian detection
  * Detecting coloured objects (you'll probably need to change the source a bit)

## Summary

Try out Community Core Vision. It might help you solve the problem you're working on. Try it out. And leave a comment or let me know if you come up with an interesting use of this app!

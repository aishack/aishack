---
title: "Why OpenCV?"
date: "2010-02-01 15:07:24"
excerpt: "If you come from the land of Matlab, you might need some convincing to switch to the much harder programming language - C++. This article tries to do just that!"
category: "OpenCV"
author: "sinha.utkarsh1990@gmail.com"
post_image: "/static/img/tut/post-why-opencv.jpg"
featured: true
track: "OpenCV Basics"
track_part: 1
---

Okay. You've landed on this page means you're interested in image processing. You probably have some ideas about image processing and probably even some experience. If you've used Matlab, you might hate this sudden change from the relatively easy Matlab to the tough C/C++. There are a couple of why to prefer OpenCV over Matlab. 

![](/static/img/tut/matlab_logo.jpg)
: Matlab

## Specific

OpenCV was made for image processing. Each function and data structure was designed with the Image Processing coder in mind. Matlab, on the other hand, is quite generic. You get almost anything in the world in the form of toolboxes. All the way from financial toolboxes to highly specialized DNA toolboxes.

## Speedy

Matlab is just way too slow. Matlab itself is built upon Java. And Java is built upon C. So when you run a Matlab program, your computer is busy trying to interpret all that Matlab code. Then it turns it into Java, and then finally executes the code.

If you use C/C++ you don't waste all that time. You directly provide machine language code to the computer, and it gets executed. So ultimately you get more image processing, and not more interpreting.

I've tried doing some real time image processing with both Matlab and OpenCV. I usually got very low speeds, a maximum of about 4-5 frames being processed per second. With OpenCV, I get actual real time processing at around 30 frames being processed per second. 

Sure you pay the price for speed - a more cryptic language to deal with, but its definitely worth it... You can do a lot more... you could do some really complex mathematics on images with C and still get away with good enough speeds for your application.

![](/static/img/tut/opencv_logo.gif)
: OpenCV

## Efficient

Matlab uses just way too much system resources. With OpenCV, you can get away with as little as 10mb RAM for a realtime application. But with today's computers, the RAM factor isn't a big thing to be worried about. You do need to take care about memory leaks, but it isn't that difficult. You can read this article about [Memory Management in OpenCV](/tutorials/opencv-memory-management/) if you want.

But if you can get your application to run on a 10 year old computer too, you're a genius! 

## Next Parts

This post is a part of an article series on OpenCV for Beginners 

  1. [Why OpenCV?](/tutorials/why-opencv/)
  2. [Installing and getting OpenCV running](/tutorials/installing-and-getting-opencv-running/)
  3. [Hello, World! With Images!](/tutorials/hello-world-with-images/)
  4. [Filtering Images](/tutorials/filtering-images/)
  5. [Capturing Images](/tutorials/capturing-images/)
  6. [HighGUI: Creating Interfaces](/tutorials/highgui-creating-interfaces/)

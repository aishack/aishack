---
title: "The OpenCV 2 Computer Vision Application Programming Cookbook"
date: "2011-06-16 12:04:20"
excerpt: ""
category: "Reviews"
author: "sinha.utkarsh1990@gmail.com"
post_image: "/static/img/tut/post-review-opencv-cookbook.jpg"
---
The good people at Packt Publishing sent me a copy of [OpenCV 2 Computer Vision Application Programming Cookbook](http://www.amazon.com/gp/product/1849513244/ref=as_li_ss_tl?ie=UTF8&tag=aish04-20&linkCode=as2&camp=217145&creative=399373&creativeASIN=1849513244)![](http://www.assoc-amazon.com/e/ir?t=&l=as2&o=1&a=1849513244&camp=217145&creative=399373)![](https://www.assoc-amazon.com/e/ir?t=aish04-20&l=ur2&o=1), by [Robert](http://www.site.uottawa.ca/~laganier) [Laganiere](http://www.laganiere.name/). I've been reading it for a few days now, and here's my take on the book - this book covers a lot of practical problems coders face when writing a computer vision application! 

The first chapter deals with installing and using OpenCV with Microsoft Visual C++ and Qt. The Qt part is in-depth - a step by step guide to making an OpenCV + Qt GUI app (right down to signals and slots).

![](http://ws.assoc-amazon.com/widgets/q?_encoding=UTF8&Format=_SL160_&ASIN=1849513244&MarketPlace=US&ID=AsinImage&WS=1&tag=aish04-20&ServiceVersion=20070822)![](http://www.assoc-amazon.com/e/ir?t=&l=as2&o=1&a=1849513244&camp=217145&creative=399373)

The book makes extensive use of the new C++ interface of OpenCV. You'll learn quite a bit of it. For example, you'll learn how to use iterators to go through each pixel (instead of having two loops - one for 'y' another for 'x'). You'll find lots of code snippets that use some neat C++ interface tricks.

The book also talks about a few coding patterns relevant to vision based applications. Patterns are solutions to certain problems faced by a lot of software developers. An example might be the Undo-redo problem. How would you implement that? Well, lots of people have worked on this problem (think Apple, Microsoft, OpenOffice, etc). And the pattern used to write undo/redo engines is the Memento pattern.

Then it goes through image filters, extracting lines, contours and [morphological transforms](http://www.packtpub.com/sites/default/files/3241-chpater-5-transforming-images-with-morphological-operations.pdf?utm_source=packtpub&utm_medium=free&utm_campaign=pdf) (yes, that's a free chapter from the book). The last three chapters are cover interest points (Harris, FAST and SURF features), camera calibration stuff (homography matrix, fundamental matrix, etc) and video processing (optical flow, mixture of Gaussians).

They have some theory included as well, but it can be a little unsatisfying at certain points. They have references to relevant papers or articles though. You can get a rigorous mathematical description there.

Overall, you'll learn some new things from the book. You'll get acquiainted to using object oriented mechanisms to make your computer vision life easier and modular. Robert's background with object oriented programming really comse out in the book! And if you write code, FAST (no puns), then, [this cookbook](http://www.amazon.com/gp/product/1849513244/ref=as_li_ss_tl?ie=UTF8&tag=aish04-20&linkCode=as2&camp=217145&creative=399373&creativeASIN=1849513244)![](http://www.assoc-amazon.com/e/ir?t=&l=as2&o=1&a=1849513244&camp=217145&creative=399373) might just be for you!

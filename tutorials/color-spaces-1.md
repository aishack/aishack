---
title: "Color spaces"
date: "2010-01-03 19:53:34"
excerpt: ""
category: "Computer Vision"
author: "sinha.utkarsh1990@gmail.com"
post_image: ""
series: "Color spaces"
part: 1
---


## Introduction

Images are stored in memory in various different colour spaces. You might have heard of one, the RGB colour space. That is the one Windows uses a lot. For image processing purposes, one often needs other colour spaces that better suit the purpose of the application.

In this article, I'll go through the RGB and HSI colour spaces in detail, and briefly touch the Y'CbCr colour space too.

## Exactly how is an image stored?

Before we get to the colour spaces, you need to know exactly how OpenCV (or any other program/API) stores images in the RAM.

### Grayscale images

We'll start simple... with a grayscale image. A grayscale picture just needs intensity information - how bright is a particular pixel. The higher the value, the greater the intensity. Current displays support 256 distinct shades of gray. Each one just a little bit lighter than the previous one!

![The grayscale palette](/static/img/tut/grayscale.jpg)  
: The grayscale palette

So for a grayscale image, all you need is one single byte for each pixel. One byte (or 8-bits) can store a value from 0 to 255, and thus you'd cover all possible shades of gray.

So in the memory, a grayscale image is represented by a two dimensional array of bytes. The size of the array being equal to the height and width of the image. Technically, this array is a "channel". So, a grayscale image has only one channel. And this channel represents the intensity of whites. An example grayscale image:

![A grayscale image](/static/img/tut/grayscale_example.jpg)
: A grayscale image

### Coloured images

When colour is added, things get trickier. More information needs to be stored. Its no more just about what shade. Its about what shade of which "colour".

Non transparent image support 16,581,375 (that is around 16million) distinct colours. To be able to distinguish these different shades, you need 3 bytes for each pixel (3 bytes, or 24-bits, can store a value upto 255*255*255... which is equal to 16,581,375).

![A color image](/static/img/tut/colour_example.jpg)
: A colour image

Now think about this: You have 16 million numbers to assign to different shades of colours. If you just randomly assigned colours to each number, things would get wierd. (say, 1=brightest red, 2=brightest green, 45780=dullest yellow, etc).

So people figured out different "colour spaces" to systematically assign numbers to the HUGE number of colours.

## Colour spaces

### The RGB colour space

We'll start off simple, with the most common colour space: RGB. The 3 bytes of data for each pixel is split into 3 different parts: one byte for the amount of red, another for the amount of green and the third for the amount of blue.

Red, green and blue being primary colours can be mixed and different proportions to form any colour.

You have 256 different shades of red, green and blue (1 byte can store a value from 0 to 255). So you mix these colours in different proportions, and you get your desired colour. This colour space is quite intuitive. You've probably used it all the time without realizing what all was going on behind the scenes.

And since you've "dedicated" one byte of each pixel to red, the second byte to green and the last byte to blue... it makes sense to club these bytes together.

That is, all the "dedicated red" bytes together... the "dedicated green" bytes together at another place... and the blue ones at another location. And, behold, you get the red channel, the green channel and the blue channel!!

Here are some visuals that will explain this better:

![Color Spaces](/static/img/tut/colorspace_example.png)
: The Original image

![The RGB Channels](/static/img/tut/rgb_channels.jpg)
: Individual Channels

See the red, green and blue channels? The red regions have 0 "blue content". They're pure red. And, the channels is a grayscale image (because each channel has 1-byte for each pixel).

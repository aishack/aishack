---
title: "Pixel neighbourhoods and connectedness"
date: "2010-03-15 15:57:01"
excerpt: ""
category: "Computer Vision"
author: "sinha.utkarsh1990@gmail.com"
post_image: "/static/img/tut/post-pixel-neighbor.jpg"
track: "Image processing algorithms (level 2)"
track_order: 4
---
The idea of neighbourhoods of pixels and their connectedness is quite intuitive. But formalizing it's definition and knowing what it means "exactly" has its advantages. So here are the things you need to know about neighbourhoods and connectedness of pixels in an image. 

## What is a neighbourhood?

The neighbourhood of a pixel is the set of pixels that touch it. Simple as that. Thus, the neighbourhood of a pixel can have a maximum of 8 pixels (images are always considered 2D).

![](/static/img/tut/neighbourhood.jpg)
: The orange pixels form the neighbourhood of the pixel 'p'.

Neighbourhoods of more specific nature exist for various applications. Here's a list of them: 

## 4-neighbourhood

The neighbourhood consisting of only the pixels directly touching. That is, the pixel above, below, to the left and right for the 4-neighbourhood of a particular pixel.

![](/static/img/tut/neighbourhood-4.jpg)
: Here, the orange pixels for the 4-neighbourhood of the pixel 'p'. 

## d-neighbourhood

This neighbourhood consists of those pixels that do not touch it, or they touch the corners. That is, the diagonal pixels.

![](/static/img/tut/neighbourhood-d.jpg)
: The diagonal neighbourhood of the pixel 'p' is shown in orange. 

## 8-neighbourhood

This is the union of the 4-neighbourhood and the d-neighbourhood. It is the maximuim possible neighbourhood that a pixel can have.

![](/static/img/tut/neighbourhood.jpg)
: The 8 neighborhood

## Connectivity

Two pixels are said to be "connected" if they belong to the neighbourhood of each other.

![](/static/img/tut/connectivity.jpg)
: Connectivity of pixels

All the coloured pixels are "connected" to 'p'... or, they are 8-connected to p. However, only the green ones are '4-connected to p. And the orange ones are d-connected to p.

Now, if you have several pixels, they are said to be connected if there is some "chain-of-connection" between any two pixels.

![](/static/img/tut/connectivity-multiple.jpg)
: Multiple connectivity

Here, lets say you're "bunch" or set of pixels is the white ones. Then, the pixels p1 and p2 are connected. There exists a chain of pixels which are connected to each other. However, the pixels p1 and p3 are not connected. The black pixels (which are not in your set) block the connectivity. 

## Connected components

Taking the idea of connectivity to the next level, we get to the idea of connected components. A graphic best serves to explain this idea:

![](/static/img/tut/connected-components.jpg)
: Connected components

This image has two connected components. And these exist efficient algorithms that let you figure out the different connected components in an image easily.

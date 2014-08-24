---
title: "Mathematical Morphology - Composite Operations"
date: "2010-07-13 23:36:10"
excerpt: ""
category: "Computer vision"
author: "sinha.utkarsh1990@gmail.com"
post_image: "/static/img/tut/post-morphology-composite.jpg"
track: "Image processing algorithms (level 1)"
track_order: 7
---


Mathematical morphology isn't only about [erosion and dilation](/tutorials/mathematical-morphology/). Those are just the fundamentals which you use to build more complex operations.

These composite operations are made up of two or more basic operations, like dilation, erosion and image arithmetic. And these operations produce characteristic outputs that can help you out during image analysis.

 

## Morphological Opening

Opening an image is achieved by first eroding an image and then dilating it. Opening removes any narrow "connections" between two regions. Here's an example:

![Morphological Opening: See the narrow white paths vanish?](/static/img/tut/morphology-opening.jpg)

## Morphological Closing

Closing an image is done by first dilating the image and then eroding it. The order is the reverse of opening. Closing fills up any narrow black regions in the image. Here's an example:

![Closing an image: See how the narrow blacks fill up?](/static/img/tut/morphology-closing.jpg)

## Morphological Gradient

The morphological gradient is the difference between the dilation and the erosion of the image. Thus, you have three basic operations being used.

This gradient is used to find boundaries or edges in an image. You should apply some filtering before calculating the gradient because it is very sensitive to noise.

Here's an example of the gradient in action:

![Morphological Gradient: Note that this highlights all the edges](/static/img/tut/morphology-gradient.jpg)

## Top hat

The top hat is the difference of the source image and the opening of the source image. It highlights the narrow pathways between different regions.

Here's an example:

![Top Hat: Highlights the narrow paths between the "islands"](/static/img/tut/morphology-tophat.jpg)

## Black hat

The black hat is the difference between the closing of an image and the image itself. This highlights the narrow black regions in the image.

Here's an example:

![Black Hat: Highlights the narrow black regions in the image](/static/img/tut/morphology-blackhat.jpg)

## The structuring element

In each of the above examples, I've used a standard 3x3 square as the structuring element (with an anchor point at the center). You can choose whatever structuring element you want. You'll get different results based on whatever structuring element you choose.

## Summary

You learned about some interesting composite operations that can be done with just the basic erosion and dilation. With these, you can improve your segmented images (get rid of that pesky noise).

These operations form the basis for even more complex operations. Things like generating a skeleton of the object. We'll look at those in a later post.

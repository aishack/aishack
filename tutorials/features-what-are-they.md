---
title: "Features: What are they?"
date: "2010-04-23 05:23:04"
excerpt: ""
category: "Computer Vision"
author: "sinha.utkarsh1990@gmail.com"
post_image: "/static/img/tut/post-interesting-features.jpg"
---
Several computer vision tasks require finding matching points across several frames or views. With that info, you could really do a lot of stuff. An example. When doing stereo imaging, you want to know a few corresponding points between the two views. Once you do, you can triangulate almost all points on the image (just like the brain does!). 

## The first approach: Patches

Intuitively, you'd be tempted to match small "patches" between the two images. Something like this:

![](/static/img/tut/feature-patches-1.jpg)

You want to find the left image's green path in the right. And you can do that quite easily. The white thingy makes the patch quite unique. Even something as trivial as [template matching](/tutorials/template-matching/) would be able to find it.

But, not all patches are so uniquely recognizable. Check the patches below: 

![](/static/img/tut/feature-patches-2.jpg)

There are no unique "features" to identify on the wall. So you'll have problem finding corresponding points. So the patches approach isn't that great.

## Corners

Corners in an image seem to be perfect for such tracking tasks. Here's an example image:

![](/static/img/tut/feature-corners-1.jpg)

These corners are perfect! Why?

### Uniquely identifiable

These points are uniquely identifiable. What do I mean by that? Here's what. Lets say you're trying to find the green corner in the right image (in the image below). You know that it'll be somewhere around the same location. So you can narrow down the "search region". And within this search region, there would be only one point that resembles the corner.

Of course, the assumption here is that there isn't a massive difference between the two images. And this is usually a reasonable assumption.

![](/static/img/tut/features-corners-identifiable.jpg)

### Stable

These points usually don't keep moving around in the image. This helps tracking. And any motion of this point, even a little one, produces a large variation. You can clearly see the point moving around.

## A bad feature

I'll try to make the idea of a "corner" more concrete. We'll use some math to do this. How do you identify a bad feature? Something that doesn't have a lot of variation... like the example of the wall above.

There are no edges or corners in the feature. So, the first derivative is flat, in both directions, x and y. Or, the first derivative is flat in all directions (all directions are a certain combination of the x and y component).

So, the second derivative also does not change in any direction. 

## An edge

An edge is a bad feature as well. If you move in the direction of the edge, you won't even know you're moving. For example, if you move along the edge at the top of the building and the sky, you won't even realize it. 

![](/static/img/tut/features-edges-motion-inline.jpg)

But if you move from the building to the sky (perpendicular to the edge) you'll "see" motion. This is the only direction where you can accurately tell how fast the object is moving.

![](/static/img/tut/features-edges-motion-perp.jpg)

So edges aren't that useful as features.

The first derivative changes in only the one direction (perpendicular to the edge). Some progress, but not that good. So, the second derivative also changes in only one direction. 

## A corner

A corner is an awesome feature! There's variation all around a corner. So, the derivative changes in all directions. So the second derivative also changes in all directions! Great! And you can write pretty efficient programs to calculate that at all points.

So there you have it! Identifying good features: If the first derivative keeps changing around a point, you know you have a corner. And you also know you have a good feature to track! 

## So what exactly is a feature?

By now, you've hopefully have an idea of what a feature is. At least intuitively. If not, go read the post again... because there are no formal definitions of a feature till now. :P

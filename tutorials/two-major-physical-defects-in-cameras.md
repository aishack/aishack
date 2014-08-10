---
title: "Two major physical defects in cameras"
date: "2010-07-23 23:51:44"
excerpt: ""
category: "Computer vision"
author: "sinha.utkarsh1990@gmail.com"
post_image: "/static/img/tut/post-camera-defects.jpg"
---


## Distortions!

The lens distortions in cameras are because of manufacturing. It is easy to manufacture a spherical lens. The more mathematically accurate parabolic lens is tough to manufacture. Also, positioning a lens accurately is difficult. So, two major distortions are caused because of this: 1) Radial distortion 2) Tangential distortion 

## Radial distortion

This distortion is caused by the spherical shape of the lens. Light passing through the center of the lens undergoes almost no refraction. So it has almost no radial distortion. Light going through the edges goes through severe bending. So the periphery of the lens causes the most radial distortion.

![Radial distorion or fish eye distortion](/static/img/tut/lens-radial-distortion-example.jpg)
: Radial distortion

## Tangential distortion

When the lens is not parallel to the imaging plane (the CCD, etc) a tangential distortion is produced.

![Tangential distortion in a camera](/static/img/tut/lens-tangential-distortion.jpg)
: Tangential distortion

Because of this, you get a weird image. In the image below, I'm not sure if you see the distortion. But the CCD plane's top seems to be towards the viewer:

![An example of tangential distortion](/static/img/tut/lens-tangential-distortion-example.jpg)
: Sample tangential distortion

## Other distortions

Yes, these aren't the only distortions that occur. You can have discolouring distortions. You can have colour splitting distortions. You can have blurring.

But usually, lens and camera manufacturers have been able to remove those to a large extent. Even on cheap camras. Thus they don't cause a lot of problem. So we won't be talking about those.

## Why bother about distortions?

You might think, why even worry about these distortions? The camera is still able to detect colour and take action accordingly.

But suppose you have two objects in your scene. And you want to calculate the distance between them. If you use the distorted image, you'll get a wrong distance. And so you'll take wrong actions (maybe moving the robot too little or too much). Not good.

So fixing these distortions is important. 

## Fixing these distortions

Like I said earlier, these distortions are produced due to physical flaws in the lens. So to correct them, you have two options: 

  * Buy a more expensive lens/camera
  * Do something in software

I don't know about you, but I prefer the second one. :P It is possible to correct these distortions in software. We'll take a look at that next.

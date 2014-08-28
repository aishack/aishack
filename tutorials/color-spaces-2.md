---
title: "Color spaces 2"
date: "2010-01-03 19:53:34"
excerpt: ""
category: "Computer vision"
author: "sinha.utkarsh1990@gmail.com"
post_image: ""
series: "Color spaces"
part: 2
---

Like I said on the [previous article](/tutorials/color-spaces-1/), some colour spaces are good for some purposes. Other are good for other purposes.

RGB is good for humans. We can intuitively use it, and generate any colour we want. 

But lets say you're taking part in some image processing robotics competition (maybe, robocup). And you want your program to detect the position of your robots... you've probably put identity tags on top of them... something like this:

![The G.O.A.L. Arena](/static/img/tut/goal_arena.jpg)
: A robotics arena

You can see the bots (red and blue, with white circles). And you want your program to identify their locations.

Your first idea would be something like: Take the red channel... and find out the regions with high intensity of red. Then, take the blue channel... and find out the regions with a high intensity of blue.

There are a few flaws in what you think: 

  * The "high intensity" regions won't be uniform. They'll vary because of factors you can't control... like lighting, texture, etc
  * And what exactly does "high intensity" mean? Does it mean a value of red greater than 128? or 64?
You might have guess by now, using the RGB colour space for image processing is often tough. So the HSV colourspace was invented! 

## The HSV colour space

The HSV colour space also has 3 channels: the Hue, the Saturation and the Value, or intensity.

The Hue channel represents the "colour". For example, "red" would be a colour. Light red/dark red would not be a colour.

The saturation channel is the "amount" of colour (this differentiates between a pale green and pure green). And intensity is the brightness of the colour (light green or dark green).

The visual below might help clarify what each channel represents:

![Color Spaces](/static/img/tut/colorspace_example.png)
: The Original Image

![The Hue, Saturation and Value channels](/static/img/tut/hsv_channels.gif)
: The 3 channels

As you can see in the Hue channel, each colour has its own "value"... the entire "red" is a single value, and also the green and blue. The lightness or darkness of the colour does not affect the hue channel. This channel is of immense use in image processing competitions where the quality of blue or green is quite bad (which is usually the case).

In the saturation channel, each pixel has a high intensity... meaning that each of the colours is completely saturated (and that is the case... the picture was generated using a software. If you used a real photograph, you'd get varied saturations throughout the image).

The intensity channel shows the brightness of the colour. From this channel, it appears that somehow the red colour's intensity is a bit lower than the rest of the two colours. 

### Using HSV in Matlab

Matlab's image processing toolbox comes with a function that converts a given RGB image into an HSV image: 
    
    :::matlab
    H = rgb2hsv(img);

Its as simple as that. 

### Using HSV in OpenCV

OpenCV also comes with a function that converts images between colour spaces: 
    
    :::c++
    cvCvtColor(source, destination, conversion_code);

Here, source is the image to be transformed. destination is where the transformed image will be stored and conversion_code specifies the type of conversion to be done (like CV_<srctype>2<desttype>) . In our case, it is CV_BGR2HSV. (I used a BGR because thats how OpenCV loads most images, yes BGR... not RGB). 

## The Y'CrCb colour space

I won't go into the details of this colour space... But i'll describe it briefly as an example of how different colour spaces are useful in different situations.

The Y'CrCb is quite useful considering the phosphor emission characteristics of newer CRT screens. And is hence used in televisions, HDTV, etc. Plus, two of the three channels can be highly compressed without much loss in detail in the final image. This helps save bandwidth. 

The Y' channel (luma) is basically the grayscale version of the original image. Human eye is more receptive to black and white images... so this channel isn't compressed much. This preserves a lot of details. The Cr and Cb channels contain the colour information. They can be highly compressed.

Many variants of this colour space exist... each works great for some particular application. 

## Conclusion

In this two page article you learned about the RGB and HSV colour spaces in detail. You also got to know about how to convert images into other colour spaces in Matlab and OpenCV. And you also got a glimpse of the Y'CrCb colour space.

Hope you learned through this tutorial. If you have any ideas, suggestions or criticism, do leave comments below!

---
title: "Introduction"
date: "2012-02-03 11:42:48"
excerpt: "Recognize QR Codes in images from scratch. We'll do all the bit math to figure out the location markers and then read data from the black/white array."
category: "Projects"
author: "sinha.utkarsh1990@gmail.com"
post_image: "/static/img/tut/post-qr-code.jpg"
series: "Scanning QR Codes"
part: 1
featured: true
---
These days, you can see QR codes almost everywhere. You see them at stores, on products, on screens. So one day, I was curious how the gears are put together to read QR codes. I ended up reading the ISO/IEC 18004 standard. It's a very robust and detailed documentation on how QR codes are supposed to work. I've put up a link in the downloads section below if you're interested. This is a multipart series - we'll be creating a QR code reader from scratch in OpenCV. Sure, there are a lot of libraries that do this - but making your own is so awesome. Don't you agree? 

## Anatomy of a QR code

A QR code is made up of four main parts: 

  1. Finder patterns: These are the big black/white/black squares on the three corners on the QR code. These help identify the presence of a QR code in an image and it's orientation. These are made such that they can be detected really fast.
  2. Alignment patterns: These are smaller than finder patterns and help straighten out a QR codes drawn on a curved surface. The larger a code, the more alignment patterns it'll have.
  3. Timing pattern: These are alternating black/white modules on the QR code. The idea is to help figure out the data grid accurately.
  4. The actual data: The blacks/whites form bits. Groups of 8 such modules makes one byte. You could combine 16 modules to get unicode data.

![The key elements of a QR code](/static/img/tut/qr-intro.jpg)
: The key elements of a QR code

!!tut-success|A 'module' is one square on the QR code. So an alignment pattern is 5 modules wide - one module is black, one is white, next is black, then white and finally black.!!

## How to detect a QR code

Detecting a QR code revolves around identifying finder patterns. The key idea is that there's a ratio in the number of black/white/black/white/black. And this ratio remains the same no matter what angle you look at it.

![Anatomy of a QR code finder pattern](/static/img/tut/qr-finder-pattern.jpg)
: Anatomy of a QR code finder pattern

In the above picture, you'll see that each of the red lines has roughly the same ratio. It does not depend on the angle. Once you've 'identified' such a ratio, you need to confirm what you see is a finder pattern or not. You do this by checking along the horizontal and vertical axes. If it's the same ratio, you know you've found a finder pattern.

Once you have 3 finder patterns, everything is relatively simple. You extract the QR code and fix the perspective. Then you can extract each bit and figure out what the data means. 

## Error correction

QR codes can be really [artistic](http://www.qrcartist.com/qr-code-art-gallery/). They can 'sacrifice' a few bits of data to make it look a lot better. They store redundant copies of bits to compensate for the sacrificed bits. Of course, this reduces the total capacity - but it makes the code look a nice and still be readable by all scanners.

QR uses the Reed-Solomon error correction code to do this. It supports multiple 'levels' of error correction (7%, 15%, 25%, 30%). If 30% of the bits are damaged (soiled, washed out, faded, replaced by art) you can still 'read' the QR. 

## What we'll make

We'll make a basic QR code reader. We won't cover identifying curved QR codes (with the alignment markers). Nor would we really go into a lot of detail with the various formats/versions of QR. Once you have a code where you've recognized the orientation, the timing, you can make it work with all versions/formats really easily. So I'll leave that part to you. We won't cover error correction either. That wasn't quite the point of this series.

Or as authors often write, "this is beyond the scope of this text book". So get the latest version of OpenCV and make sure you've got everything setup just right!

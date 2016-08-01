---
title: "Labelling connected components - Example"
date: "2010-03-21 18:44:53"
excerpt: ""
category: "Computer Vision"
author: "sinha.utkarsh1990@gmail.com"
post_image: "/static/img/tut/post-connected-components.jpg"
track: "Image processing algorithms (level 2)"
track_part: 6
series: "Connected Component Labelling"
part: 3
---
We'll go through an example for [Labelling connected components](/tutorials/connected-component-labelling/) algorithm. I assume you know how the algorithm works (if not, check [Labelling connected components](/tutorials/connected-component-labelling/)) and also how the union-find data structure works. We'll work on a binary image to keep things simple. Suppose the binary image is the following: 

![](/static/img/tut/label-example-binary.jpg)

The "blocks" represent a pixel. White means its a '1' and black means its a '0'. We're interested in labeling the non-zero pixels. Ideally, you can just loop at the image and come up with a possible labeling scheme:

![](/static/img/tut/label-binary-final.jpg)

The actual labels are just 1, 2, 3, 4, etc. Here, the colors are just a visual representation of the actual labels.

Now that you know what's about to happen,, lets get started. 

## The first pass

Here is the same image, represented as a matrix. We start off at the top left corner.

![](/static/img/tut/label-binary-matrix1.jpg)

We check the top and left pixels. They do not exist... so we need to create a new label. Thus, we set the label for the top left pixel as 1 (shown as yellow).

![](/static/img/tut/label-step1.jpg)

Next we check the pixel in row 1, column 2, or simply pixel (1, 2). It does has a pixel to its left. So we copy its label. The next pixel, (1, 3) is a background pixel. We're not interested in it. So we simply skip it and let it be black (a label of 0).

Next comes the pixel (1, 4). There are no pixels above it. But the pixel to its left is a background pixel. So we create a new label. So, we mark (1, 4) with label 2 (shown as dark yellow). 

![](/static/img/tut/label-step2.jpg)

Now the next two pixels, (1, 5) and(1, 6) will have pixel to their left. So, they get the label 2 as well. (1, 7) is background so we ignore it. At (1,8) we'll have to create a new label again (pixel above does not exist, and pixel to left is a background pixel). 

So, after completing row 1, we have a result that looks like this:

  
  
![](/static/img/tut/label-step3.jpg)  
: After row 1 is complete  
  

Now the pixel (2, 1) does not have anything to its left. But it does have a pixel just above it. Its label is '1', so we copy that. Similarly for (2, 2). Infact, the same thing holds for the entire row. All pixels in the second row have a pixel just above them. So the result looks like this:

  
  
![](/static/img/tut/label-step4.jpg)  
: Completion of row 2  
  

In the third row, pixels (3, 1) (3,2 ) and (3, 3) are quite straight forward. They get the label '1'. But pixel (3, 4) is a tricky one. You have pixel both above and to the left. And both have different labels. Which one do you choose? How do you handle the sudden "realization" of the connectedness of labels 1 and 2.

Well, you take the smaller label (in this case '1') and put that on (3, 4). And, you also store that 2 (the numerically larger label) is a child of 1 (using the union-find data structure). 

  
  
![](/static/img/tut/label-step5.jpg)  
: Resolving the dilemma at (3, 4)  
  

Continuing on, you should face no difficulties. Here's a set of images to guide you along to the final result of pass 1. 

  
  
![](/static/img/tut/label-step6.jpg)  
: After 4 rows  
  

  
  
![](/static/img/tut/label-step7.jpg)  
: Completing 5 rows  
  

  
  
![](/static/img/tut/label-step8.jpg)  
: Row 6, done  
  

  
  
![](/static/img/tut/label-step9.jpg)  
: Completing row 7, note the new label  
  

  
  
![](/static/img/tut/label-step101.jpg)  
: First pass complete. Note the new label.  
  

## The second pass

Now, you can see this labeling technique has made quite a mess. Multiple labels for connected regions. We need to rectify this.

To do this, we again go through every pixel one by one. It starts with pixel (1, 1). It checks the union-find data structure for the label '1'. On checking, it figures out that '1' is not a child of any other labels. It is a root itself. So it moves on. 

Similarly for (1, 2). For the pixel (1, 3) we're not concerned because it is a background pixel.

Now on pixel (1,4) it checks the data structure for '2'. It notices that '2' is a child of '1'. Then, it checks for '1'. It notices '1' is a root. So, it replaces the label of (1, 4) with '1': 

  
  
![](/static/img/tut/label-step11.jpg)  
: Converting a '2' into a '1'  
  

Similarly, the process goes on for the entire row. The result after completing 4 rows is: 

  
  
![](/static/img/tut/label-step12.jpg)  
: Completing till row 4  
  

We've made progress! The connected region on the top right is fully cleaned up. Great! Now, row 5 remains unchanged. '4' is a root label. So is '5'. And '3' as well. Row 6 also remains unchanged. 

Now, row 7 undergoes changes:

  
  
![](/static/img/tut/label-step13.jpg)  
: Completing row 7  
  

And after doing row 8, here's the final result:

  
  
![](/static/img/tut/label-step14.jpg)  
: The final result  
  

And thus you have the final result. And its the result we want. Every connected region has exactly one value. 

## Done!

Well that was a pretty in depth example. Hope you learned a bit from this!

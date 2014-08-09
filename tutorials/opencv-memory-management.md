---
title: "OpenCV Memory Management"
date: "2010-01-19 23:44:02"
excerpt: ""
category: "OpenCV"
author: "sinha.utkarsh1990@gmail.com"
post_image: "/static/img/tut/post-opencv.jpg"
---
If you're new to OpenCV, you need to know exactly how to manage all the huge amounts of memory you're using. C/C++ isn't a garbage collected language (like Java), so you need to manually release memory as soon as its use is over. If you don't, your program could use up hundreds of MBs of highly valuable RAM... and often even crash (out-of-memory errors?) It can be a daunting task to hunt exactly where memory needs to be released. So I've compiled this short list of places where you should look out for memory leaks. 

## Create it, then Release it

If you create something, make sure you release it before "returning". This is probably the very first thing you should check when fixing memory leak problems with OpenCV. For example, if you do a cvCreateImage, make sure you do a cvReleaseImage. There are many things you can create. Here are some functions that "create" and their corresponding "release" functions 

  * cvCreateImage - cvReleaseImage
  * cvCreateImageHeader - cvReleaseImageHeader
  * cvCreateMat - cvReleaseMat
  * cvCreateMatND - cvReleaseMatND
  * cvCreateData - cvReleaseData
  * cvCreateSparseMat - cvReleaseSparseMat
  * cvCreateMemStorage - cvReleaseMemStorage
  * cvCreateGraphScanner - cvReleaseGraphScanner
  * cvOpenFileStorage - cvReleaseFileStorage
  * cvAlloc - cvFree

One warning though: If you create something and want to return it, don't release it. Lets say a function that creates a checkerboard image and returns it. If you release the image before returning it, you're freeing all memory that stores the image data. And when you try accessing memory that isn't yours, you get a crash. 

## Release returned structures

This is the second thing you should check for. Often, once you return a structure (say, an image).. you forget about it. 

## Multiple Memory Allocations

This is the third thing you should check for: Allocating memory, and then changing the pointer itself. Here's some example code: 
    
    :::c++
    IplImage* image = cvCreateImage(whatever);
    image = CreateCheckerBoard(whatever);
    ...
    cvReleaseImage(&image);

This function creates a memory leak. First, you allocate some memory for image. Then, you call the function CreateCheckerBoard. This function itself creates new memory. And image now points to this new memory. The memory created in the first step is lost forever. No variable points to it. A memory leak. To fix this, you need to modify the code like this: 
    
    :::c++
    IplImage* image = NULL;
    image = CreateCheckerBoard(whatever);
    ...
    cvReleaseImage(&image);

## If you return a sequence, release its storage

There are many instances where you use the CvSeq data structure. And often you might want to return this structure for further use. If you release its storage (a CvMemStorage structure) within the function itself, you'd free the memory where the sequence is stored. And then you'd try and access it in the calling function. Again, crash.

A temporary fix would be to just erasing the cvReleaseMemStorage statement... but that would mean lots of memory.

To fix this, you don't release the memory in the function itself. You release it in the calling function like this: 
    
    :::c++
    cvReleaseMemStorage(&thesequence-;>storage);

storage is a member of the CvMemStorage structure that always points to the memory where its stored.

Again, this is just an example. There are more structures where a similar situation could arise. 

## Dependence on other structures

I quite recently discovered this memory leak. To explain this, I'll use an example: Lets say you find out the contours of an image. OpenCV would return a "linked list" type structure called CvSeq. You decide to access the third element of this linked list. OpenCV returns a pointer to the third element. All going great till this moment.

Now you decide to save all the points of this contour (the third element) in a data structure of your own. Since this is an array of points, you do something like: 
    
    :::c++
    mystructure->points = thirdcontour->points;

You set the pointer to equal to the thirdcontour. This is the bug.

If you release the storage of the sequence (which you should), mystructure has a bad pointer. To fix this, allocate new memory to mystructure->points and then copy contents of thirdcontour->points... something like this: 
    
    :::c++
    mystructure->points = (CvPoint*)malloc(sizeof(CvPoint) * thirdcontour->total);
    memcpy(mystructure->points,thirdcontour->points,sizeof(CvPoint)*thirdcontour->total);

This creates new memory for your structure and then copies each element there. Once you've done this, you can release the storage of the sequence without fear :) 

## Thats it for now

These are the few memory leak problems I've encountered till now. Hope this list helped you fix the problem with your program :)

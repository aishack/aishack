---
title: "K-Nearest Neighbors in OpenCV"
date: "2010-10-05 21:13:23"
excerpt: "Learn how to implement K-Nearest in OpenCV. We use the MNIST database of handwritten numbers."
category: "OpenCV"
author: "sinha.utkarsh1990@gmail.com"
post_image: "/static/img/tut/post-knearest-opencv.jpg"
---
K-Nearest Neighbors is a very simple machine learning algorithm. And OpenCV comes with it built in! In this post, we'll use a freely available dataset (of handwritten digits), train a K-Nearest algorithm, and then use it to recognize digits. We will be using a few file operations (fopen, fread, etc). If you're not familiar with those, just review them once.﻿ 

## Handwritten digits dataset

A massive dataset of handwritten digits is available on [Yann LeCun's website](http://yann.lecun.com/exdb/mnist/). Get all four files. The files contain the training images, training labels, testing images and actual labels for test images.

The files won't open with a standard image viewer (Picasa, etc). We'll have to write our own code to read images and labels from these files. 

## Training: Loading the dataset

We'll use standard file operations in C/C++ to load the dataset. Yann's website describes how data is stored in each file.

For files containing images, the first sixteen bytes contain information about the file. The first four bytes form a magic number (to ensure you're reading a correct file). The next four bytes contain the number of images (an integer has 4 bytes). The next four bytes have the number of rows. The next four have the number of columns. After this, individual pixels of each image are listed (row-wise). 

And for files containing labels, the first four bytes form the magic number. The next four bytes is the number of labels. And after that, each byte corresponds to one label. Each label is between 0 and 9.

With that in mind, **create a new project**. Include the OpenCV headers + standard header and link to syour OpenCV libraries. 
    
    :::c++
    #include <cv.h>
    #include <highgui.h>
    #include <ml.h>
    #include <time.h>
    
    #include <stdio.h>
    
    #include <stdlib.h>
    
    using namespace cv;
    
    int main()
    {
        return 0;
    }

I'll be using the C++ interface of OpenCV, so I've included the cv namespace too. Start off by creating two new file pointers: 
    
    
    :::c++
    int main()
    {
        FILE *fp = fopen("C:\\train-images.idx3-ubyte", "rb");
    
        FILE *fp2 = fopen("C:\\train-labels.idx1-ubyte", "rb");
    
        return 0;
    }

This opens both files in binary, read only mode. Then a little exception handling. It one of the files didn't open, we can't proceed. 
    
    
    :::c++
        if(!fp || !fp2)
            return 0;

Next, we read values from both files: 
    
    
    :::c++
        int magicNumber = readFlippedInteger(fp);
        int numImages = readFlippedInteger(fp);
    
        int numRows = readFlippedInteger(fp);
    
        int numCols = readFlippedInteger(fp);
    
        fseek(fp2, 0x08, SEEK_SET);

We'll get to the `readFlippedInteger` function a little later. If you're on an Intel machine (which is little endian), you need to use it. If you're on some other high-endian processor, you can simply read using fread.

Labels start at byte 8, so we also skip the first two integers (thus, 8 bytes) in fp2.

Now, we create memory to store all the images and labels: 
    
    
    :::c++
        int size = numRows*numCols;
        CvMat *trainingVectors = cvCreateMat(numImages, size, CV_32FC1);
        CvMat *trainingLabels = cvCreateMat(numImages, 1, CV_32FC1);

"vectors" refers to the images. Okay, so with memory in place, we read data from the files: 
    
    
    :::c++
        BYTE *temp = new BYTE[size];
        BYTE tempClass=0;
        for(int i=0;i<numImages;i++)
        {
    
            fread((void*)temp, size, 1, fp);
    
            fread((void*)(&tempClass), sizeof(BYTE), 1, fp2);
    
            trainingLabels->data.fl[i] = tempClass;
    
            for(int k=0;k<size;k++)
                trainingVectors->data.fl[i*size+k] = temp[k];
        }

This code loads the i'th image into temp and its label into tempClass. And then, it fills appropriate elements in the trainingVectors and traingLabels matrices. Why? Because the matrices are floating point matrices. And the files have just single bytes. 4 bytes vs 1 byte does not match. So all the mess. If you know a better way to do this, please do let me know!

With all images and labels in the RAM, we can load these into the K-Nearest Neighbors algorithm: 
    
    
    :::c++
        KNearest knn(trainingVectors, trainingLabels);

And then, we can print out the maximum value of k. And we close both files. 
    
    
    :::c++
        printf("Maximum k: %d", knn.get_max_k());  
    
        fclose(fp);
        fclose(fp2);

We can also release the matrices. KNearest keeps its own copy of training vectors and classes. 
    
    
    :::c++
        cvReleaseMat(&trainingVectors);
        cvReleaseMat(&trainingLabels);

## Recognition: Using K-Nearest Neighbors

We've trained the algorithm. Now its time to run it against test images and see how accurate it is.

We'll continue in the same project. Add these lines at the bottom: 
    
    
    :::c++
        fp = fopen("C:\\t10k-images.idx3-ubyte", "rb");
        fp2 = fopen("C:\\t10k-labels.idx1-ubyte", "rb");

Then we read initial information from these files and set the position of fp2 to the 8th byte: 
    
    
    :::c++
        magicNumber = readFlippedInteger(fp);
        numImages = readFlippedInteger(fp);
        numRows = readFlippedInteger(fp);
    
        numCols = readFlippedInteger(fp);  
    
        fseek(fp2, 0x08, SEEK_SET);

Next, we allocate memory for all the images and labels stored in those files: 
    
    
    :::c++
        CvMat *testVectors = cvCreateMat(numImages, size, CV_32FC1);
        CvMat *testLabels = cvCreateMat(numImages, 1, CV_32FC1);
        CvMat *actualLabels = cvCreateMat(numImages, 1, CV_32FC1);

testVectors store the actual image. testLabels store the label predicted by the algorithm. actualLabels stores the correct label (taken from the file fp2).

Then, we create some temporary variables: 
    
    
    :::c++
        temp = new BYTE[size];
        tempClass=1;
        CvMat *currentTest = cvCreateMat(1, size, CV_32FC1);
        CvMat *currentLabel = cvCreateMat(1, 1, CV_32FC1);
        int totalCorrect=0;

temp and tempClass hold  the current image and its actual label. totalCorrect keeps a track of correct predictions. Now, we iterate through all images in the file: 
    
    
    :::c++
        for(int i=0;i<numImages;i++)
        {
    
            fread((void*)temp, size, 1, fp);
    
            fread((void*)(&tempClass), sizeof(BYTE), 1, fp2);
    
            actualLabels->data.fl[i] = (float)tempClass;
    
            for(int k=0;k<size;k++)
            {
                testVectors->data.fl[i*size+k] = temp[k];
                currentTest->data.fl[k] = temp[k];
            }

This simply reads an image and its label from the files and stores them in the matrices. Then we try to predict the label for this image: 
    
    
    :::c++
            knn.find_nearest(currentTest, 5, currentLabel);
    
            testLabels->data.fl[i] = currentLabel->data.fl[0];
    
            if(currentLabel->data.fl[0]==actualLabels->data.fl[i])
                totalCorrect++;
        }

Finally, we print the number of correct predictions: 
    
    
    :::c++
        printf("Time: %d Accuracy: %f ", (int)time, (double)totalCorrect*100/(double)numImages);
    
        return 0;
    }

And this finishes our program.

## Flipped integers and Endian-ness

Different processors have different Endian-ness. Suppose you have a 32-bit integer. So it's stored over 4 bytes. Some processors read the most significant byte first. Others read the least significant byte first.

True, this just adds to confusion, but you can't really control Intel or AMD.

Probably, the creates of the MNIST dataset have a non-Intel machine. So they've designed the file format that way. Here's the code for reading a "flipped integer". 
    
    
    :::c++
    int readFlippedInteger(FILE *fp)
    {
        int ret = 0;
    
        BYTE *temp;
    
        temp = (BYTE*)(&ret);
        fread(&temp[3], sizeof(BYTE), 1, fp);
        fread(&temp[2], sizeof(BYTE), 1, fp);
        fread(&temp[1], sizeof(BYTE), 1, fp);
    
        fread(&temp[0], sizeof(BYTE), 1, fp);
    
        return ret;
    }

It creates a Byte pointer to an integer and then reads bytes accordingly. 

## Fin

And with that, you've just made a machine learn something! Of course, there are much better alternatives. See if you can find some algorithms. Or if you can improve this algorithm (hint: maybe not all pixels of an image are as important).

Enjoy!

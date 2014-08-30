---
title: "Calibrating & Undistorting with OpenCV in C++ (Oh yeah)"
date: "2010-07-28 23:59:36"
excerpt: ""
category: "Computer Vision"
author: "sinha.utkarsh1990@gmail.com"
post_image: "/static/img/tut/post-camera-calibration-undistort.jpg"
---
I've already talked about [camera distortions](/tutorials/two-major-physical-defects-in-cameras/) and [calibrating a camera](/tutorials/calibrating-a-camera-theory/). Now we'll actually implement it. And we'll do it in C++. Why? Because it's a lot more easier and make much more sense. No more stupid CV_MAT_ELEM macros. And things will just work. But, I won't talk about how the C++ is working. Figure it out yourself ;) 

## The setup

The first thing we need for this is the latest version of OpenCV. If you're using 1.0 or 1.1pre or any of those, you need to get the latest version. It has the C++ interface. Previous version simply do not have it. Go [download the most recent version at sourceforge](http://sourceforge.net/projects/opencvlibrary/).

Once you have it, [follow these instructions](/tutorials/installing-and-configuring-opencv-2-on-windows/) if you use Visual Studio. If not, check around the OpenCV wiki, and you should see where you can find instructions for your IDE. 

## Onto the project

Once you have your IDE or whatever environment setup, start by creating a new project. Include the standard OpenCV headers: 
    
    :::c++
    #include <cv.h>
    #include <highgui.h>

We'll include the OpenCV namespace so we can use its functions directly (without a cv:: everytime): 
    
    
    :::c++
    using namespace cv;

Now the main function. We create some variables. The number of boards you want to capture, the number of internal corners horizontally and the number of internal corners vertically (That's just how the algorithm works). 
    
    
    :::c++
    int main()
    {
        int numBoards = 0;
        int numCornersHor;
        int numCornersVer;

Then, we get these values from the user: 
    
    
    :::c++
        printf("Enter number of corners along width: ");
        scanf("%d", &numCornersHor);
    
        printf("Enter number of corners along height: ");
        scanf("%d", &numCornersVer);
    
        printf("Enter number of boards: ");
        scanf("%d", &numBoards);

We also create some additional variables that we'll be using later on. 
    
    
    :::c++
        int numSquares = numCornersHor * numCornersVer;
        Size board_sz = Size(numCornersHor, numCornersVer);

See the Size? That's OpenCV in C++. Next, we create a camera capture. We want live feed for out calibration! 
    
    
    :::c++
        VideoCapture capture = VideoCapture(0);

Next, we'll create a list of objectpoints and imagepoints. 
    
    
    :::c++
        vector<vector<Point3f>> object_points;
        vector<vector<Point2f>> image_points;

What do these mean? For those unfamiliar with C++, a "vector" is a list. This list contains items of the type mentioned within the angular brackets < > (it's called generic programming). So, we're creating a list of list of 3D points (Point3f) and a list of list of 2D points (Point2f).

_object_points_ is the physical position of the corners (in 3D space). This has to be measured by us. [write relationg between each list item and list's eh you get the point]

_image_points_ is the location of the corners on in the image (in 2 dimensions). Once the program has actual physical locations and locations on the image, it can calculate the relation between the two.

And because we'll use a chessboard, these points have a definite relations between them (they lie on straight lines and on squares). So the "expected" - "actual" relation can be used to correct the distortions in the image.

Next, we create a list of corners. This will temporarily hold the current snapshot's chessboard corners. We also declare a variable that will keep a track of successfully capturing a chessboard and saving it into the lists we declared above. 
    
    
    :::c++
        vector<Point2f> corners;
        int successes=0;

Then we create two images and get the first snapshot from the camera: 
    
    
    :::c++
        Mat image;
        Mat gray_image;
        capture >> image;

The >> is the C++ interface at work again!

Next, we do a little hack with _object_points_. Ideally, it should contain the physical position of each corner. The most intuitive way would be to measure distances "from" the camera lens. That is, the camera is the origin and the chessboard has been displaced. 

![Chessboards displaced around a camera in calibration](/static/img/tut/calib-camera-centered1.jpg)

Usually, it's done the other way round. The chessboard is considered the origin of the world. So, it is the camera that is moving around, taking different shots of the camera. So, you can set the chessboard on some place (like the XY plane, of ir you like, the XZ plane). 

![Camera being displaced around the chessboard](/static/img/tut/calib-chessboard-centered.jpg)

Mathematically, it makes no difference which convention you choose. But it's easier for us and computationally faster in the second case. We just assign a constant position to each vertex.

And we do that next: 
    
    
    :::c++
        vector<Point3f> obj;
        for(int j=0;j<numSquares;j++)
            obj.push_back(Point3f(j/numCornersHor, j%numCornersHor, 0.0f));

This creates a list of coordinates (0,0,0), (0,1,0), (0,2,0)...(1,4,0)... so on. Each corresponds to a particular vertex.

An important point here is that you're essentially setting up the units of calibration. Suppose the squares in your chessboards were 30mm in size, and you supplied these coordinates as (0,0,0), (0, 30, 0), etc, you'd get all unknowns in millimeters. 

We're not really concerned with the physical dimensions, so we used a random unit system.

Now, for the loop. As long as the number of successful entries has been less than the number required, we keep looping: 
    
    
    :::c++
        while(successes<numBoards)
        {

Next, we convert the image into a grayscale image: 
    
    
    :::c++
            cvtColor(image, gray_image, CV_BGR2GRAY);

And we're here. The key functions:
    
    
    :::c++
            bool found = findChessboardCorners(image, board_sz, corners, CV_CALIB_CB_ADAPTIVE_THRESH | CV_CALIB_CB_FILTER_QUADS);
    
            if(found)
            {
                cornerSubPix(gray_image, corners, Size(11, 11), Size(-1, -1), TermCriteria(CV_TERMCRIT_EPS | CV_TERMCRIT_ITER, 30, 0.1));
                drawChessboardCorners(gray_image, board_sz, corners, found);
            }

The `findChessboardCorners` does exactly what it says. It looks for _board_sz_ sized corners in image. If it detects such a pattern, their pixel locations are stored in _corners_ and _found_ becomes non-zero. The flags in the last parameter are used to improve the chances of detecting the corners. Check the OpenCV documentation for details about the three flags that can be used.

If corners are detected, they are further refined. [Subpixel corners](/tutorials/subpixel-corners-increasing-accuracy/) are calculated from the grayscale image. This is an iterative process, so you need to provide a termination criteria (number of iterations, amount of error allowed, etc). 

Also, if corners are detected, they're drawn onto the screen using the handy _drawChessboardCorners _function!

Next we update the display the images and grab another frame. We also try to capture a key:
    
    
    :::c++
            imshow("win1", image);
            imshow("win2", gray_image);
    
            capture >> image;
            int key = waitKey(1);

If escape is pressed, we quit. No questions asked. If corners were found and space bar was pressed, we store the results into the lists. And if we reach the required number of snaps, we break the while loop too: 
    
    
    :::c++
            if(key==27)
    
                return 0;
    
            if(key==' ' && found!=0)
            {
                image_points.push_back(corners);
                object_points.push_back(obj);
    
                printf("Snap stored!");
    
                successes++;
    
                if(successes>=numBoards)
                    break;
            }
        }

Next, we get ready to do the calibration. We declare variables that will hold the unknowns: 
    
    
    :::c++
        Mat intrinsic = Mat(3, 3, CV_32FC1);
        Mat distCoeffs;
        vector<Mat> rvecs;
        vector<Mat> tvecs;

We modify the intrinsic matrix with whatever we do know. The camera's aspect ratio is 1 (that's usually the case... If not, change it as required). 
    
    
    :::c++
        intrinsic.ptr<float>(0)[0] = 1;
        intrinsic.ptr<float>(1)[1] = 1;

Elements (0,0) and (1,1) are the focal lengths along the X and Y axis.

And finally, the calibration:
    
    
    :::c++
        calibrateCamera(object_points, image_points, image.size(), intrinsic, distCoeffs, rvecs, tvecs);

After this statement, you'll have the intrinsic matrix, distortion coefficients and the rotation+translation vectors. The intrinsic matrix and distortion coefficients are a property of the camera and lens. So as long as you use the same lens (ie you don't change it, or change its focal length, like in zoom lenses etc) you can reuse them. In fact, you can save them to a file if you want and skip the entire chessboard circus!

Note: The calibrateCamera function converts all matrices into 64F format even if you initialize it to 32F. Thanks to Michael Koval!

Now that we have the distortion coefficients, we can undistort the images. Here's a small loop that will do this: 
    
    
    :::c++
        Mat imageUndistorted;
        while(1)
        {
            capture >> image;
            undistort(image, imageUndistorted, intrinsic, distCoeffs);
    
            imshow("win1", image);
            imshow("win2", imageUndistorted);
            waitKey(1);
        }

And finally we'll release the camera and quit!
    
    
    :::c++
        capture.release();
    
        return 0;
    }

## My results

I ran this program on a low quality webcam. I used a hand-made chessboard pattern and used 20 chessboard positions to calibrate. Here's an undistort I did:

![A result I got from undistortion](/static/img/tut/calib-my-results.jpg)

## Make your own chessboard!

If you're not working at some university, its very likely you don't have a chessboard pattern that will work perfectly. You need an asymmetric chessboard: 5x6 or a 7x8 or27x3.

So make one yourself. Take a piece of paper and draw on it with a marker. Paste it on some cardboard. I made mine from a small notebook page. It's a 5x4 chessboard. Not very big, but it works. Here's what it looks like: 

![My chessboard pattern](/static/img/tut/calib-myboard.jpg)

You can even see the lines from the notebook. :| But the inner corners are detected pretty well. You'll definitely want a better one if you work with higher resolutions.

If you're looking for precision, get it printed. Here's a picture that you can print on an A4 size paper at 300dpi (its PNG and around 35kb in size). 

![](/static/img/tut/calib-checkerboard-320px.png)

_(click for a full size version: A4 at 300dpi)_

## Bad calibration

A bad calibration is very much possible. Here's what I got in one of my attempts: 

![Bad calibration example](/static/img/tut/calib-bad-calibration.jpg)

Yes the image on the left is the original, and the one on the right is "undistorted".

Hopefully you won't get such results. The key is calibrate with the chessboard everywhere on the screen. It should not be "biased" toward some corner or region. 

## Summary

Hope you've learned how to calibrate your cameras with OpenCV and how to undistort images taken from them. With OpenCV, you don't need to know what goes on underneath while being able to fully utilize the calibration and undistortion.

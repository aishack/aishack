---
title: "Installing and configuring OpenCV 2.0 on Windows"
date: "2010-03-03 14:30:31"
excerpt: ""
category: "OpenCV"
author: "sinha.utkarsh1990@gmail.com"
post_image: "/static/img/tut/post-opencv-2-windows.jpg"
---
Installing the latest OpenCV might seem intimidating to you. After all, you need to compile all that source code and generate libraries and executables yourself. So here's a little guide to take you through. 

## Step 1: Install OpenCV 2.0

Go to the [SourceForge page of OpenCV](http://opencv.sourceforge.net) and install OpenCV 2.0. If you check the directory you installed the things in, you see that there a folder called src. We need to use that compile OpenCV. 

## ![](/static/img/tut/cv2_srcfolder.jpg)

## Step 2: Install CMake

CMake is a cross platform "make" (the linux make). You can [download it for free](http://www.cmake.org/cmake/resources/software.html) here. With CMake, you can use the command line interface. Or, if you want, a GUI that makes life easier. 

## Step 3: Compile everything

Once you install, start up the command line prompt. (Win+R, type cmd and press enter). Type cmake and you should be able to see something on screen.

Next, type in this line: 
    
    
    cd C:\\OpenCV2.0
    mkdir build
    cd build
    cmake -D:CMAKE_BUILD_TYPE=RELEASE C:\\OpenCV2.0

You'll see a lot of things happening. And after a while, the process would complete, and you'd have a Visual Studio Project for OpenCV.

## Step 4: Compile the project

This one is simple. Double click the OpenCV project, and compile it. It'll take a lot of time. Compiling the samples and the entire library itself takes a real long time.

![](/static/img/tut/cv2_made.jpg)

Now, the following folders contain what we want 

  * C:\OpenCV2.0\src\lib\Debug
  * C:\OpenCV2.0\src\bin\Debug

All the .lib and .dll files have been generated in those folders. 

## Step 5: Configuring OpenCV in VisualStudio

Now we need to tell Visual Studio where these newly generated files .lib are. So open up the Options dialog box (Tools > Options) and select the VC++ Directories tab as shown below:

![](/static/img/tut/vc2k8_directories.jpg)

Now we'll add to the Executable Files, Include Files, and Library Files.

Add _C:\OpenCV2.0\src\bin\Debug_ to the **Executable Files**. 

Add _C:\OpenCV2.0\include\opencv_ to the **Include Files**.

Add C:\OpenCV2.0\src\lib\Debug to the **Library Files**. 

## Step 6: Testing the installation

Just to test that OpenCV is working, we'll create a simple "Hello World!" program. You can have a look at that program here: [Hello World! with Images](/tutorials/hello-world-images/).

Just get the entire code done, and return back to this article. 

[get the code now :P]

Now that you have the code, we need to tell Visual Studio that we need to use the OpenCV libraries. So open up the Project properties (_Project > _[project name]_ Properties_). Then go to Configuration _Properties > Linker > Input_ and add the following into _Additional dependencies_: 
    
    
    cv200d.lib cxcore200d.lib highgui200d.lib cvaux200d.lib ml200d.lib
    

Next, take all the .dll files in C:\OpenCV2.0\src\bin\Debug directory and copy them into _C:\Windows\System32_. On most systems, this will work. If not, try copying them into _C:\Windows_ as well.

(Thanks for **Shaurya **for pointing out ml200d.lib library) 

## Done!

If everything worked, you just got a working OpenCV 2.0 installation :) Enjoy!

If you were following the **Beginner's guide to OpenCV**, go to the next part: [Hello World! with Images](/tutorials/hello-world-images/)!

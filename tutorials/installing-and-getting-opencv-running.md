---
title: "Installing and Getting OpenCV running"
date: "2010-02-04 15:26:03"
excerpt: ""
category: "OpenCV"
author: "sinha.utkarsh1990@gmail.com"
post_image: "/static/img/tut/post-installing.jpg"
---


## Download OpenCV

The first thing to do is get OpenCV. You can download it from its [sourceforge.net page](http://sourceforge.net/project/showfiles.php?group_id=22870). Make sure you download the latest version and the correct one for your platform.

**Update**: OpenCV 2.0 is now available. This post works for OpenCV 1.0. Check [how to install OpenCV 2.0](/tutorials/installing-and-configuring-opencv-2-0-on-windows/). 

## Telling your IDE about OpenCV

Once you're done installing, you need to change some settings in your IDE so that it knows where to find the header files and the library files for OpenCV.

I'll demonstrate the process with these IDEs: Microsoft Visual Studio 2008 and Microsoft Visual Studio 6. 

Other websites mention how to use OpenCV with other environments:

[OpenCV and Eclipse IDE](http://opencv.willowgarage.com/wiki/Eclipse) [OpenCV and Ch](http://www.softintegration.com/products/thirdparty/opencv/demos/) [OpenCV and C++ Builder](http://opencv.willowgarage.com/wiki/C++Builder) [OpenCV and DevCpp](http://opencv.willowgarage.com/wiki/DevCpp)

## OpenCV and Microsoft Visual Studio 2008

Start Visual Studio 2008 and goto Tools > Options.

![](/static/img/tut/vc2k8_options.jpg)

In the Options, goto Projects and Solutions > VC++ Directories.

![](/static/img/tut/vc2k8_directories.jpg)

On this page, there is a drop down list called Show directories for. It has six options: Executable files, Include files, Reference files, Library files, Source files and Exclude directories. We're interested in the Include files and Library files.

Select the Include files option, and setup the options as **shown below**: 

![](/static/img/tut/vc2k8_include.jpg)

Note: On my computer, I installed OpenCV in the D:\\\Program Files\\\OpenCV directory. You might have installed it at some different location, so make sure you change the paths appropriately. 

Now change the _Show directories _for to _Library files_. All the library files of OpenCV are located in just one directory, so simply add that directory:

![](/static/img/tut/vc2k8_library.jpg)

Note: Again, make sure you use the appropriate the directory path.

You're done! Now your Visual Studio 6 knows where to find OpenCV! 

## OpenCV and Microsoft Visual Studio 6

Start Visual Studio 6.0 and goto Tools > Options.

![](/static/img/tut/vc6_options.jpg)

In the Options dialog box, go to the _Directories _tab.

![](/static/img/tut/vc6_directories.jpg)

On this tab, there is a drop down list called Show directories for. It has four options: Executable files, Include files, Library files and Source files. We're interested in the Include files and Library files.

Select the Include files option, and setup the options as **shown below**: 

![](/static/img/tut/vc6_includes.jpg)

Note: On my computer, I installed OpenCV in the D:\\\Program Files\\\OpenCV directory. You might have installed it at some different location, so make sure you change the paths appropriately. 

Now change the Show directories for to Library files. All the library files of OpenCV are located in just one directory, so simply add that directory:

![](/static/img/tut/vc6_library.jpg)

Note: Again, make sure you use the appropriate the directory path.

You're done! Now your Visual Studio 6 knows where to find OpenCV! 

## What next?

Now that your IDE knows exactly where OpenCV is, you can make OpenCV applications. To use OpenCV, you need to specify that you want to use OpenCV libraries.

You need to modify your project's settings in order to do that. I'll demonstrate how to do that in the next tutorial. 

## Next Parts

This post is a part of an article series on OpenCV for Beginners 

  1. [Why OpenCV?](/tutorials/why-opencv/)
  2. [Installing and getting OpenCV running](/tutorials/installing-and-getting-opencv-running/)
  3. [Hello, World! With Images!](/tutorials/hello-world-with-images/)
  4. [Filtering Images](/tutorials/filtering-images/)
  5. [Capturing Images](/tutorials/capturing-images/)
  6. [HighGUI: Creating Interfaces](/tutorials/highgui-creating-interfaces/)

---
title: "Identification tags in competitions"
date: "2010-07-15 23:14:28"
excerpt: ""
category: "Robotics"
author: "sinha.utkarsh1990@gmail.com"
post_image: "/static/img/tut/post-identification-tags.jpg"
---
Vision based competitions require that you track robots and objects in real time. Whether its a ball or block that you need to place in the correct position, you need to identify the robot's exact position and orientation to decide the timeline of events in the near future. Here are a few ways to efficiently identify robots with the minimal overhead in vision. That is, with the least number of colors, track the maximum number of robots 

## Two markers

This is probably the most basic orientation tag. It looks like this:

![A two marker identification tag](/static/img/tut/robot-id-1.jpg)

Remember that this is a **top down view** of the robot. 

You assume one color to be the "front" and the other to be the "back". This way, you know exactly where the robot is and also the vector where it is pointing.

With this configuration, you need two colours to identify one robot. One for the front and one for the back. So if you're going to track multiple robots, you should go for some other technique. It works best only if you have exactly one robot to track.

## Three markers

With three markers, you get a little more tracking capability. Here's one possible arrangement:

![A three colour configuration](/static/img/tut/robot-id-2.jpg)

To track this robot, you need to find the centroid of the triangle (the location of the robot). For the orientation, create a line on the two blue markers. Then drop a perpendicular from the red marker. This perpendicular will tell you the direction of the robot.

With this configuration, you can track some more robots. For example, with just two colours you can track atleast two robots. The first robot has two blue markers and the second robot has two red markers.

## Four markers

This is probably the most robust of all tracking methods and is used by several RoboCup teams for their soccer teams. It looks somewhat like a butterfly:

![The butterflyish identification and orientation tag used in RoboCup](/static/img/tut/robot-id-3.jpg)

With this system, you can identify a single robot with just one color. If all markers were blue, you could calculate the position of the robot and also the orientation (because of the asymmetry of the placement of markers). This is super efficient!

And if you put in one color (say red and blue) you can track even more robots with just two colors! Neat! 

## Fancy systems

I've seen some more systems being used to track robots. Here I'll list a few of them to get your creative juices flowing!

![The databit based system](/static/img/tut/robot-id-4.jpg)

Here the lone marker points to the front end of the robot. The three markers at the rear end mark the robot's ID. With this system you can track upto 8 robots with just two colors. Think of the back side as a binary digit. 000 = robot#1, and so on.

![A weird looking one](/static/img/tut/robot-id-5.jpg)

Here's a weird one. The "front" is marked by "nothing". Its empty. The robot number is marked by the three quarter circles. The location of the robot is marked by the central circle. 

## Summary

You got to see a lot of different identification tags. Go implement some in your own robots!

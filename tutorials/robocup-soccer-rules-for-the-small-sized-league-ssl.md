---
title: "Robocup soccer rules for the Small Sized League (SSL)"
date: "2010-07-20 23:49:42"
excerpt: ""
category: "Robotics"
author: "sinha.utkarsh1990@gmail.com"
post_image: "/static/img/tut/post-identification-tags.jpg"
---

## What is robocup?

The RoboCup Small Sized League is a team based competition. You must create a team of robots that can play soccer/football/whatever you call it. Your team will compete against another team of robots. There must be no human intervention during the match. Everything is autonomous. Everything depends on artificial intelligence. You might want to go check YouTube for a few videos of matches! 

## The field

![The dimensions of the RoboCup arena](/static/img/tut/robocup-arena-300x219.jpg)
: The dimensions of the RoboCup arena

  * The entire field should be **flat**.
  * The playing surface is **green felt mat** or carpet.
  * All markings on the field are 10mm wide
  * The walls of the goal are 20mm thick and are anchored securely to the surface.
  * A **mounting bar** runs across the midline of the field, 4 meters above the surface.
  * A set of **shared cameras** are mounted on this bar.
  * Teams must access these cameras though **SSL-Vision**, a community maintained software.
  * Teams cannot mount their own cameras or any other equipment.
  * **No commercial advertising** can be put on any part of the field.

## The balls

![A standard orange golf ball](/static/img/tut/robocup-ball.jpg)
: A standard orange golf ball

  * The ball is a **standard orange golf ball**.
  * It is spherical.
  * It is orange in color.
  * It is approximately 46g in mass
  * It is approximately 43mm in diameter

## The robotic equipment

  * A single robot can be up to **180mm** in diameter and up to **150mm** in height.
  * A robot must use wireless communication only. **Bluetooth** is not allowed.
  * Each team can have **at most 5 robots** on the field.
  * Robots can be interchanged, but only when the game is not going on.
  * There are no limits to the number of interchanges.
  * The robot top must have a certain minimum area.
  * You must follow the **standard pattern** for recognizing robots.
  * **Kicking devices** are permitted

![The minimum top area of a robot](/static/img/tut/robocup-minimum-top.jpg)
: The minimum top area of a robot

![The standard pattern for Robocup SSL](/static/img/tut/robocup-butterfly.jpg)
: The standard pattern for RoboCup SSL

## Gameplay

  * A match consists of 2 equal periods of 10 minutes each.
  * The halftime cannot exceed 5 minutes.
  * Extra time me be allowed in the event of a draw.
  * Four timeouts for a total of 5 minutes are allowed for each team.
  * A referee controls the game.
  * The referee sends out signals are communicated through a computer. Ethernet and serial ports can be used to connect to this computer.

## Special kicks

Standard rules from the real games are followed on several occasions: 

  * Free kicks
  * Penalty Kicks
  * Throw ins
  * Goal kicks
  * Corner kicks

## Want a more detailed version?

I've just touched on the key rules. If you want to now all the little details (like when is a ball considered "out of play", or the 80/20 law for dribbling the ball, etc) you should download [the entire rules and regulations document](http://small-size.informatik.uni-bremen.de/_media/rules:ssl-rules-2010.pdf) from the official robocup website.

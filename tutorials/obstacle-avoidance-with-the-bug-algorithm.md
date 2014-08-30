---
title: "Obstacle avoidance with the Bug-1 algorithm"
date: "2010-08-24 17:46:14"
excerpt: ""
category: "Machine Learning"
author: "bhargav.abhimanyu@gmail.com"
post_image: "/static/img/tut/post-obstacle-avoidance.jpg"
---
Obstacle avoidance is an indispensable behavior in mobile robots. If a robot has no sensors, it’s a blind robot. If it has proximity sensors but still it keeps hitting whatever comes in its way, then it’s a ‘’brainless’’ robot. Imagine an ant or any insect walking on the ground. The insect is heading towards a particular direction and it encounters an obstacle in its way. What the insect does is, it circumnavigates the obstacle until motion in the initial direction is no more obstructed. The situation is very similar to a car at a cross road. To go straight from a traffic crossing, the car has to circumnavigate the cross-road circle and go straight. 

## Assumptions and initialization

Essentially, the Bug-1 algorithm formalizes the “common sense” idea of moving towards the goal and going around obstacles. Certain assumptions have to be made while implementing the Bug-1 algorithm, they are: 

  1. The robot is assumed to be a point with perfect positioning (no positioning error)
  2. The robot is equipped with a contact sensor that can detect an obstacle boundary if the robot “touches” it.
  3. The robot can also measure the distance d(p, q) between any two points p and q.
  4. Finally, assume that the workspace is bounded. That is, we're not working in infinite space.
We assume the following symbols: 
  * q~start~: start point
  * q~goal~: target point
Let q~L~^0^ =q~start~ m-line - line segment that connects q~L~^i^ to q~goal~. Initially i = 0 

## The Bug-1 Algorithm

The Bug1 algorithm exhibits two behaviors: 

  * Motion to goal
  * Boundary following

During motion-to-goal, the robot moves along the m-line toward q~goal~ until it either encounters the goal or an obstacle. If the robot encounters an obstacle, let q~H1~ be the point where the robot first encounters an obstacle and call this point a hit point. The robot then circumnavigates the obstacle until it returns to q~H1~.

![The obstacle avoidance algorithm in action](/static/img/tut/obstacle-avoid-possible-path.jpg)

Then, the robot determines the closest point to the goal on the perimeter of the obstacle and traverses to this point. This point is called a leave point and is labeled q~L1~. From q~L1~, the robot heads straight toward the goal again, i.e., it re-invokes the motion-to-goal behavior.

If the line that connects q~L1~ and the goal intersects the current obstacle, then there is no path to the goal; note that this intersection would occur immediately “after” leaving q~L1~ . 

![Obstacles make a goal impossible to reach!](/static/img/tut/obstacle-avoid-impossible-target.jpg)

Otherwise, the index i is incremented and this procedure is then repeated for q~Li~ and q~Hi~ until the goal is reached or the planner determines that the robot cannot reach the goal. Finally, if the line to the goal “grazes” an obstacle, the robot need not invoke a boundary following behavior, but rather continues onward towards the goal. 

Here's a pseudo code implementation of this algorithm:

_Input:_ A point robot with a tactile sensor 
_Output:_ A path to the qgoal or a conclusion no such path exists 
    
    
    while Forever do
        repeat
        From qLi−1, move toward qgoal.
        until qgoal is reached or an obstacle is encountered at qHi .
        if Goal is reached then
            Exit
        end if

        repeat
        Follow the obstacle boundary.
        until qgoal is reached or qHi is re-encountered.
            Determine the point qLi on the perimeter that has the shortest distance to the goal.
            Go to qLi .
            if the robot were to move toward the goal then
                Conclude qgoal is not reachable and exit.
            end if
    end while

_(adopted from: [Principles of Robot Motion: Theory, Algorithms, and Implementations (Intelligent Robotics and Autonomous Agents)](http://www.amazon.com/gp/product/0262033275?ie=UTF8&tag=aish04-20&linkCode=as2&camp=1789&creative=390957&creativeASIN=0262033275)![](http://www.assoc-amazon.com/e/ir?t=aish04-20&l=as2&o=1&a=0262033275))_

## Summary

You learned about a very basic obstacle avoidance algorithm. The idea is to navigate the entire circumference of the obstacle and figure out the best position to leave towards the goal. Then, the robot moves to this best leaving position and goes towards the object. It is easy to determine if an object is unreachable by this method or not. 

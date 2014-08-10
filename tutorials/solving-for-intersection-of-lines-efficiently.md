---
title: "Solving for intersection of lines efficiently"
date: "2010-04-02 16:08:11"
excerpt: ""
category: "Machine learning"
author: "sinha.utkarsh1990@gmail.com"
post_image: "/static/img/tut/post-solve-intersection.jpg"
---
One of the most common tasks done with lines is detecting their intersection. For some reason, not many people know how to do that on a computer. In this post, I assume you have some lines. You got them from some algorithm, or the user supplied them, or whatever. And you want to find the intersection of these lines. 

## Step 1: Converting lines to Ax + By = C

Ideally, the lines should be in the form Ax + By = C. But usually, that is not the case. But it is simple enough to convert it into this form. This is done using the two point form of the line.

![](/static/img/tut/two-point-line-form.jpg)

We can generate two points on the line using the given form, And then plug those points into the above equation. And thus you'll get the equation in the form we want.

Rearranging the two-point equation, we get: (just try and understand them... they're not as horrible as they seem :P) 

On opening the brackets on the right hand, we get:

![](/static/img/tut/two-point-expanded-1.jpg)

And multiplying by (x~1~-x~2~) and rearranging, we get:

![](/static/img/tut/two-point-fully-expanded.jpg)

Compare this to Ax + By = C... and you'll see that we have our equation! 

  * A = y~2~ - y~1~
  * B = x~1~ - x~2~
  * C = B*y~1~ + A*x~1~

So, convert all your lines into this form, and we're ready for step 2. Actually figuring out intersection points. 

## Step 2: Solving for intersection

Right now, we have several lines in the form Ax + By = C. So "solving for intersection" is just solving a set of equations: 

A~1~x + B~1~y = C~1~ A~2~x + B~2~y = C~2~

To solve, multiply the first equation with B~2~ and the second with B~1~. Then you end up with: 

A~1~B~2~x + B~1~B~2~y = B~2~C~1~ A~2~B~1~x + B~1~B~2~y = B~1~C~2~

Subtract the second equation from the first and you get: 

A~1~B~2~x - A~2~B~1~x = B~2~C~1 - ~B~1~C~2~

And thus, we get the x coordinate of intersection: 

x = (B~2~C~1 - ~B~1~C~2~) / det

Where det = A~1~B~2~ - A~2~B~1~

Similarly, you can derive an equation for y. And finally, we arrive at these results: 

  * x = (B~2~C~1~ - B~1~C~2~) / det
  * y = (A~1~C~2~ - A~2~C~1~) / det

If det = 0, then the lines are parallel (so you cannot calculate x and y) 

## Conclusion

Translate the equations in bullet lists into a program. And you have a program that solves for intersection of lines!

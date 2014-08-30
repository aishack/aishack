---
title: "Noise reduction by Averaging: Theory"
date: "2010-01-15 23:02:29"
excerpt: ""
category: "Computer Vision"
author: "sinha.utkarsh1990@gmail.com"
post_image: "/static/img/tut/post-noise-reduction-averaging.jpg"
track: "Image processing algorithms (level 1)"
track_order: 9
---


## Now for the theory

Pretty amazing results right? And this happened with just 25 images. Just imagine the quality of images you'd get if you just sit and take snapshots constantly (like the telescopes do). 

## Probability does it all

Noise is random in nature. Its also guassian in nature. What that means is, if you had a piece of noise like:

![Gaussian noise](/static/img/tut/noise_guassian.jpg)
: Gaussian noise

Now if you were to sum up the intensities of each pixel and then divide it by the total number of pixels, you'll end up with a zero (or a value very much near 0).

So, if you have multiple images with different noise patterns... its very likely that averaging corresponding pixels will cause the noise to vanish. 

## Mathematically...

Let g~i~ denote each of the 25 images. So, g~i~ is a sum of the original image (denoted by f) and some noise (denoted by n~i~).

![The image, mathematically](/static/img/tut/image_noise_sum.jpg)

The operation we're performing in this technique is:

![Averaging operation done](/static/img/tut/noise_average_operation_done.jpg)

We're summing up the k images (25 in our case) and dividing it by k. But we know that:

![The sum is zero!](/static/img/tut/sum_noise_zero.jpg)

So on expanding the expression for I(x,y) we end up with only f(x,y)... which is the original image! 

## More images mean better noise removal

The more images you have, the better the noise removal. This sounds plausible because ideally, if you have an infinite number of cases... only then will the sum of the noise be exactly zero.

I did a little experiment on how the quality of the image improves as the number of noisy images increases. See the results for yourself: 

![Noisy 1](/static/img/tut/1.jpg)
: No averaging (1.jpg)

![Result of averaging two images](/static/img/tut/averaging_two.jpg)
: Averaging with only 2 images

![Averaging five images](/static/img/tut/averaging_five.jpg)
: Averaging with 5 images (quality just improved greatly!)

![After fifteen images](/static/img/tut/averaging_fifteen.jpg)
: Averaging with fifteen images (the image looks clean!)

![The final result](/static/img/tut/averaging_result.jpg)
: Averaging with 25 images (no real visible improvement)

So apparently, after a few iterations of averaging, the quality of the image reaches a plateau. 

## Conclusion

So now you have a great new technique in your arsenal that you can use whenever required! If you have any doubts or criticism or suggestions, do let me know!

[Have a look at the actual C implementation](/tutorials/noise-reduction-by-averaging/)

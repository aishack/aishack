---
title: "Exponential, Rayleigh, Uniform and Impluse noise"
date: "2010-01-09 21:35:57"
excerpt: ""
category: "Computer Vision"
author: "sinha.utkarsh1990@gmail.com"
post_image: "/static/img/tut/post-noise.jpg"
series: "Noise Models"
part: 2
---

## The Exponential Noise Distribution

The exponential distribution distribution looks like this:

![The Exponential Distribution](/static/img/tut/exponential_distribution.gif)
: The exponential distribution

Here's a sample of what exponential noise looks like:

![No noise applied](/static/img/tut/noise_tester.jpg)
: No noise

![An image with exponential noise applied](/static/img/tut/noise_tester_exponential.jpg)
: Exponential noise!

The histograms for the above images are:

![The original image's histogram](/static/img/tut/noise_tester_no_hist.jpg)
: No noise

![The exponential noised image's histogram](/static/img/tut/noise_tester_exponential_hist.jpg)
: Exponential noise histogram

Again, you see something similar to the exponential distribution. This is also independent noise and is used to model noise in laser imaging. 

## The Rayleigh Noise Distribution

Here's the characteristic plot of the Rayleigh probability distribtion function:

![The Rayleigh distribution](/static/img/tut/rayleigh_distribution.gif) And here's what rayleigh noise looks like: 

![No noise applied](/static/img/tut/noise_tester.jpg)
: No noise!

![An image with rayleigh noise](/static/img/tut/noise_tester_rayleigh.jpg)
: Rayleigh noise

And here's the histograms for both of the images above: 

![The original image's histogram](/static/img/tut/noise_tester_no_hist.jpg)
: The original histogram

![The histogram of the "rayleighed" image](/static/img/tut/noise_tester_rayleigh_hist.jpg)
: Rayleigh noise

This too is independent noise and is used to characterize noise in range imaging.

## The Uniform Noise Distribution

Now for something new. Instead of all the curvy graphs till now, the uniform distribution has a flat line. It looks like this:

![The uniform distribution](/static/img/tut/uniform_distribution1.gif)
: The uniform distribution

Here, all the values between a and b have an equal probability of occuring. Hence the flat top. Here's what uniform noise looks like: 

![No noise applied](/static/img/tut/noise_tester.jpg)
: No noise

![An image with uniform noise applied](/static/img/tut/noise_tester_uniform.jpg)
: An image with uniform noise

And, as usual, here are the histograms for them: 

![The original image's histogram](/static/img/tut/noise_tester_no_hist.jpg)
: The original image

![The uniform noised image's histogram](/static/img/tut/noise_tester_uniform_hist.jpg)
: Uniform noise'd

Looks pretty "uniform" right? This, too, is independent noise. This noise model doesn't resemble any practical situation. Its there just because computers always generate uniform random numbers. So generating uniform noise isn't tough. 

## The Impulse Noise Distribution: Salt and Pepper Noise

Here's something completely new. No probability distribution function here. Have a look at the following images: 

![No noise applied](/static/img/tut/noise_tester.jpg)
: No salt/pepper

![Salt and pepper noise](/static/img/tut/noise_tester_salt_pepper_impulse.jpg)
: Salt/pepper

You'd have noticed that this noise looks very different from the ones we've seen earlier. You can simply visually distinguish between this noise and the others we've discussed so far. 

Its called salt and pepper because it looks like that: the white specks are the salt, the black ones are the pepper.

This noise is generally produced when transmitting an image. The value of the pixel just gets corrupted: all bits of the pixel turn into a 1, or into a 0... or the bits invert (1 turns into a 0, and vice versa). 

Representing this mathematically is a bit complicated. And generally, this is a Data dependent noise.

Here are the histograms for the two images just shown: 

![The original image's histogram](/static/img/tut/noise_tester_no_hist.jpg)
: Original histogram

![Salt and pepper's histogram](/static/img/tut/noise_tester_salt_pepper_impulse_hist.jpg)
: The peppered histogram

Notice how the original spikes remain preserved. Only little spikes are added at the very extremities of the histogram. The leftmost little spike being for the "pepper" and the right most being for the "salt". 

## Conclusion

So we discussed 6 unique noise distributions in this article. Now you're in direct competition with Photoshop... which just offers Gaussian and Uniform noise! Go defeat some photoshop with OpenCV!

And, I've created a little program that lets you generate all these noises in realtime. Feel free to download and experiment with it. You can choose between different noise types by pressing the keys 1-6. You can download it from the link below. 

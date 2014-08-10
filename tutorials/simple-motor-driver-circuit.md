---
title: "Simple motor driver circuit"
date: "2010-08-03 23:52:23"
excerpt: ""
category: "Electronics"
author: "sinha.utkarsh1990@gmail.com"
post_image: "/static/img/tut/post-motor-driver.jpg"
---


## Components used

For this project, we'll be using the following components: 

  * One L293D H Bridge
  * One 7805 voltage regulator
  * One 7812 voltage regulator
  * Four capacitors, around 10uF
  * Two DC motors
The H-Bridge is the key component. To power this chip, we use the two voltage regulators. The 7805 is used for generating logic voltages (5V = logical 1). The 7812 will actually power the motors. 

## The schematic

Okay, so lets begin with the circuit now. I'll assume that you have a soldering iron and a PCB... or you can get it done by someone. 

### Step 1: The power supply

We'll first work on the power supply for the motors and the chip. For that, we'll be using the two voltage regulator ICs. Ideally, you could connect a circuit like this:

![Power supply setup](/static/img/tut/l293d_power_supply.gif)
: Power supply setup

The two thick lines on the left are the main DC power supply (probably from some battery source or maybe a DC adapter). Once the power is routed through this circuit, you get a 5 volt potential difference across the ground and the line marked +5V. And you get 12 volts potential difference across the +12V line and ground.

However, there are always fluctuations in the input lines. To minimize these, we add capacitors across the input terminals and the output terminals. So the final power supply circuit for our project would be like this:

![Power supply with capacitors added](/static/img/tut/l293d_power_supply_caps.gif)
: Power supply with capacitors added

## Step 2: Connecting power to the L293D

There are a total of 8 pins on the L293D that relate to power. Four ground pins, three pins that need the +5V and one pin that needs the +12V supply.

Doing the 4 ground connections might be messy if you're making this circuit for the first time. Anyway, here's why we're doing all these connections: 

![Power supply connections into the L293D](/static/img/tut/l293d_power_connections.gif)
: Power supply connections into the L293D

The four grounds have to connected to ground. No questions asked. Without that, the chip won't function.

The Vs is connected to +12V because we'll be running our DC motors at this voltage.

We put a +5V into Vss because thats the standard voltage for a logical 1. Based on this voltage, the L293D will decide if a given voltage input is a logical 1 or a logical 0.

ENABLE1 and ENABLE2 are connected to +5V because we will be using both sides of the chip. We we put a logical 1 into these pins. 

### Step 3: Connecting the outputs

Our outputs are motors. So we simply connect the two terminals of the motors across OUTPU1/OUTPUT2 and OUTPUT3/OUTPUT4. As simple as that.

![Connecting motors to the L293D](/static/img/tut/l293d_motor_connections.gif)
: Connecting motors to the L293D

### Step 4: Connecting the input pins

The only thing that now remains is connecting the INPUTx pins. These pins connect to whatever "controller" you have. If you have a microcontroller or a microcontroller, these four wires go there. If you want to have it computer controller, they go into the parallel port of the computer, or probably even the serial port. Or if you want, you could go a step further and even use some wireless transmitter to wirelessly control the two motors.

![Connecting input pins](/static/img/tut/l293d_input_connections.gif)
: Connecting input pins

## You're done!

With these connections done, you've completed the motor driver. Now based on the input you give, the motors will turn in different directions. Based on the connections you made to the motor and how you mounted the motor on your project, you'll have to figure out on your own when the motors turn forward or when the motors turn backward. Simple hit and trial experiments will be enough for this. 

## Braking

Here's an interesting bit. Something that makes this circuit work great for making differential drive based robots.

Consider this: If INPUT1 is logical 1 and INPUT2 is logical 0, the motor on the left of the schematic will rotate. This is normal functioning of the chip.

If you suddnely set INPUT1 to logical 1 and INPUT2 to logical 1 too, you're short circuiting the internal connections (technically: a shoot through)! But because the motor was previously in motion, it will oppose this sudden change. And in doing so, the motors will BRAKE. They'll stop suddenly.

However, simply turning the power supply off would cause the motor to go on rolling for sometime before it stops.

!!tut-success|If you want to stop a motor, set both INPUTs to a 1. And the motor will stop immediately.!!

## Conclusion

Here you learned about creating a motor driver. Now that you can control two motors, you can build a lot of things: robots, face-any-direction-webcam, etc etc. See you next time!

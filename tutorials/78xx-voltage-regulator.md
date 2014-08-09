---
title: "78xx voltage regulator"
date: "2010-07-27 23:45:10"
excerpt: ""
category: "Electronics"
author: "sinha.utkarsh1990@gmail.com"
post_image: "/static/img/tut/post-78xx.jpg"
---

## Without the 78xx ICs

Different parts of a robot require different voltages. Motors usually run on high voltages, like 12V or 36V. Microcontrollers run on 3.3V or 5V. Electromagnets work on even greater voltages and currents.

If you didn't have the 78xx ICs, you'd have more batteries on your circuits. One for 5V, another for 36V, another one for 24V, etc. And that would increase weight and space occupied. These ICs save a lot of space and make your robot lighter, and let you conveniently step down to a specific voltage output.

## The 78xx IC

The 78xx ICs have 3 pins. Two pins with positive polarity and one with negative. The negative polarity pin is common between the input and output voltages. For input, one positive polarity pin is used and for the output, the other one is used.

![The 7805 voltage regulator](/static/img/tut/7805.gif)
: The 7805 voltage regulator

Shown above is a 7805 chip. Here, xx= 05... so the chip maintains a constant 5 volts across the output terminal and the com terminal. Had this been a 7812 chip, it would maintain 12 volts across the two pins. 

## Cautions

When using a voltage regulator, you need to make sure that the current through the IC does not go beyond the limit mentioned in the datasheet. You risk blowing up the regulator.

Also, you need to make sure you plug in the powersupply with the right polarity. Reverse the polarity and the chip heats up really quick. Notice how the IN and OUT pins in the schematic below are connected to positive voltages. 

You might also want to include a few capacitors in the circuit, as shown below:

![The complete 7805 circuit](/static/img/tut/7805_circuit.gif)
: The complete 7805 circuit

These capacitors decrease the amount of voltage fluctuations. If there's an increase... the capacitors store it. If there is a decrease, they release their energy... maintaining a constant voltage across the output and input terminals.

Another point, which is quite obvious, is that the input voltage must be greater than the output  voltage. So you cannot expect a 5V output from a 7805 if you give it 2V. 

## Summary

Well that it! You now know what this chip does! Go on and have fun with it! 

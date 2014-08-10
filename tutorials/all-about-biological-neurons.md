---
title: "All about biological neurons"
date: "2009-11-18 15:36:56"
excerpt: ""
category: "Machine learning"
author: "sinha.utkarsh1990@gmail.com"
post_image: "/static/img/tut/post-biological-neurons.jpg"
---
Artificial neural networks are inspired from biological ones. So it makes sense to know a bit about biological neural networks as well.

You brain is a neural network. One really really complex neural network. It has 10^11^ neurons. And each of these neurons is connected to approximately 10^4^ other neurons. These interconnected neurons use electrical pulses to "communicate" with each other.

![](/static/img/tut/biological-neuron.jpg)

Above is a highly simplified diagram of a neuron. In the **center**, is the cell body. This houses the actual organelles of the nerve cell. To the **left** of the diagram are incoming connections. The diagram shows only a few of them, but in physical neurons, the count is usually in thousands. And to the **right** of the diagram is _axon_, the output of the neuron. 

#### The Output

The output of the neuron is an electrical voltage. And this voltage is decided by the cell body, based on the inputs it receives. This output goes to several other nerve cells, where it acts as an input. Thus, this single neuron can "contribute" to controlling several other neurons. 

#### The Inputs

Now let's talk about the inputs into the nerve cell. The nerve cell has several _dendrites_. These dendrites gather information from the axon of other nerve cells. The way in which an electrical pulse is transferred from an axon to a dendrite is interesting.

The point of contact of the axon and the dendrite is called a _synapse_. It is at the synapse that the electrical pulse actually jumps from the axon to the dendrite. This happens by means of a complex chemical reaction.

The details of the chemical reaction are irrelevant to understanding neural networks, so I'll skip that part. But the consequences of the reaction are enormous. That is what makes neural networks flexible.

Okay, so here's the consequence: the reaction can occur at different "rates". Thus, the "amount" of signal that reaches the dendrite can be controlled. For example, if the signal coming from an axon is 5mV, and the synapse reaction doesn't happen quickly, the signal might get reduced to, say, 1mV. It might even happen the other way. The signal might get amplified to 15mV.

As you learn, you change the rates. And thus you change the outputs of your neurons. That is the reason why doing something for the first time is tough. You literally aren't wired to do that task.

#### The Cell Body

Up till now, we've talked about the outputs and the inputs. Now a bit about the cell body. The cell body is the thing that decides when to fire an electrical pulse (through the axon) or not. How does it do that?

By "summing up" the inputs. This happens because all the inputs are electrical voltages, and they all merge at a single point. So, if the total input (after passing and getting amplified/reduced through the synapse) is greater than some particular value, the cell fires an event. Again, this happens through a complex chemical reaction.

Once the cell fires, it must restore its chemical equilibrium (and prepare for future signals). So the neuron remains inactive for a small amount of time (called the _refractory period_). Thus several neurons may remain inactive at any given time while several others are active. 

#### Towards artificial neurons

The artificial neural networks we'll talk about will have highly simplified neurons. They obviously won't have the chemical reactions. But they will bear a lot of similarity to the neuron we just got to know. Including the "variable" input thingy (magnified/reduced signal strength).

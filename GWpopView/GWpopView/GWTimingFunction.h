
//
//  GWTimingFuntion.h
//  GWpopView
//  Created by cannaan on 13-11-8.
//  Copyright (c) 2013年 cannaan. All rights reserved.
//
//  these functions decide the time when item animation

#ifndef GWpopView_GWTimingFunction_h
#define GWpopView_GWTimingFunction_h

typedef float (*GWTimingFunction)(float,float);

float QuinticEaseIn(float p,float k);

// Modeled after the quintic y = (x - 1)^5 + 1
float QuinticEaseOut(float p,float k);

// Modeled after the piecewise quintic
// y = (1/2)((2x)^5)       ; [0, 0.5)
// y = (1/2)((2x-2)^5 + 2) ; [0.5, 1]
float QuinticEaseInOut(float p,float k);

// Modeled after the exponential function y = 2^(10(x - 1))
float ExponentialEaseIn(float p,float k);

// Modeled after the exponential function y = -2^(-10x) + 1
float ExponentialEaseOut(float p,float k);

// Modeled after the piecewise exponential
// y = (1/2)2^(10(2x - 1))         ; [0,0.5)
// y = -(1/2)*2^(-10(2x - 1))) + 1 ; [0.5,1]
float ExponentialEaseInOut(float p,float k);

float BackEaseIn(float p,float k);
#endif




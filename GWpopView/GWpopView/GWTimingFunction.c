//
//  GWTimingFuntion.c
//  GWpopView
//
//  Created by cannaan on 13-11-8.
//  Copyright (c) 2013年 cannaan. All rights reserved.
//

#include <stdio.h>
#include "GWTimingFunction.h"
#include <math.h>

// Modeled after the quintic y = x^5
float QuinticEaseIn(float p,float k)
{
	return p * p * p * p * p;
}

// Modeled after the quintic y = (x - 1)^5 + 1
float QuinticEaseOut(float p,float k)
{
	float f = (p - 1);
	return f * f * f * f * f + 1;
}

// Modeled after the piecewise quintic
// y = (1/2)((2x)^5)       ; [0, 0.5)
// y = (1/2)((2x-2)^5 + 2) ; [0.5, 1]
float QuinticEaseInOut(float p,float k)
{
	if(p < 0.5)
	{
		return 16 * p * p * p * p * p;
	}
	else
	{
		float f = ((2 * p) - 2);
		return  0.5 * f * f * f * f * f + 1;
	}
}

// Modeled after the exponential function y = 2^(10(x - 1))
float ExponentialEaseIn(float p,float k)
{
	return (p == 0.0) ? p : pow(2, 10 * (p - 1));
}

// Modeled after the exponential function y = -2^(-10x) + 1
float ExponentialEaseOut(float p,float k)
{
	return (p == 1.0) ? p : 1 - pow(2, -10 * p);
}

// Modeled after the piecewise exponential
// y = (1/2)2^(10(2x - 1))         ; [0,0.5)
// y = -(1/2)*2^(-10(2x - 1))) + 1 ; [0.5,1]
float ExponentialEaseInOut(float p,float k)
{
	if(p == 0.0 || p == 1.0) return p;
	
	if(p < 0.5)
	{
		return 0.5 * pow(2, (20 * p) - 10);
	}
	else
	{
		return -0.5 * pow(2, (-20 * p) + 10) + 1;
	}
}

float BackEaseIn(float p,float k)
{
    if (p < k) {
        return p * p;
    }
    else
    {
        return ( p - 2 * k ) * ( p - 2 * k );
    }
}


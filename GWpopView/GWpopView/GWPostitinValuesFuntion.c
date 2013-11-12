//
//  GWPostitinValuesFuntion.c
//  GWpopView
//  
//  Created by cannaan on 13-11-8.
//  Copyright (c) 2013年 cannaan. All rights reserved.
//

#include <stdio.h>
#include <math.h>
#include "GWPostitinValuesFuntion.h"


// y = x + k 
float increaseLine(float p,float k)
{
    float Y = (p + k);
    return Y;
}

// y = k no matter what is x
float AxisXConstant(float p,float k)
{
    return k;
}

// y = k no matter what is x
float AxisYConstant(float p,float k)
{
    return k;
}

float CircleX(float p, float k) {
    
    
    float x = sinf(k * M_PI/180);
    // ....
    return x;
}

float CircleY(float p, float k) {

    float y = cosf(k * M_PI/180);
    // ....
    return y;
}



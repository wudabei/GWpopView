//
//  GWPostitinValuesFuntion.h
//  GWpopView
//  Created by cannaan on 13-11-8.
//  Copyright (c) 2013年 cannaan. All rights reserved.
//
/******************************************************************
 *  these functions decide the path when item animation
 *  describe  how Y changes with X
 ******************************************************************/  

#import <QuartzCore/QuartzCore.h>
#ifndef GWpopView_GWPostitinValuesFuntion_h
#define GWpopView_GWPostitinValuesFuntion_h


typedef float (*GWPositingFunction)(float,float);

/* Y increase with X ,  bias: degree 45
 * Funtion :      Y = X + L
 * Parameter：    p :X; l :L
 * return Value   Y
 */
float increaseLine(float p,float l);

/* Y increase with X ,bias is 1
 * Funtion :       r * sin ( arc ) = Y; r * cos ( degree ) = X
 * Parameter：     r :radius; degree :angle
 * return Value :  one point of the circle 
 */
float CircleX(float p, float k);
float CircleY(float p, float k);

float AxisXConstant(float p,float k);
float AxisYConstant(float p,float k);

#endif

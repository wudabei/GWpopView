//
//  CONSTS.h
//  GWpopView
//
//  Created by cannaan on 13-11-9.
//  Copyright (c) 2013年 cannaan. All rights reserved.
//

#ifndef GWpopView_CONSTS_h
#define GWpopView_CONSTS_h


// part of ainimation keyPath

#define kAnchorPoint @"anchorPoint"
#define kBackgroundColor @"backgroundColor"
#define kBackgroundFilters @"backgroundFilters"
#define kBorderColor @"borderColor"
#define kBorderWidth @"borderWidth"
#define kBounds @"bounds"
#define kCompositingFilter @"compositingFilter"
#define kPosition @"position"
#define kTransform @"transform"
#define kZPosition @"zPosition"
#define kOpacity @"opacity"
#define kHidden @"hidden"


// CATransform3D  keyPath

/***********************
 *    Rotation
 ***********************/
#define kRrotation_x @"rotation.x"
#define kRotation_y @"rotation.y"
#define kRotation_z @"rotation.z"
#define kRotation @"rotation"//设置一个NSNumber类型的绕z方向旋转的弧度值。该设置和ratation.z是功能是一样的。


/***********************
 *    Scale
 ***********************/
#define kScale_x @"scale.x"
#define kScale_y @"scale.y"
#define kScale_z @"scale.z"
#define kScale @"scale"//设置一个NSNumber对象，它的值是三个缩放因子的平均值。

/***********************   
 *    Translation
 ***********************/
#define kTranslation_x @"translation.x"//设置一个NSNumber对象，它的值是x\y\z轴方向的平移因子。
#define kTranslation_y @"translation.y"
#define kTranslation_z @"translation.z"
#define kTranslation @"translation"//设置一个包含NSSize或CGSize数据类型的NSValue对象。该数据类型表明在x和y轴上的平移数量。



/********    other keyPath  *****************/

/*
contents

使用默认隐式的CABasicAnimation对象，描述于Table B-2（第页）。

contentsRect

使用默认隐式的CABasicAnimation对象，描述于Table B-2（第页）。

cornerRadius

使用默认隐式的CABasicAnimation对象，描述于Table B-2（第页）。

doubleSided

没有默认的隐式动画

filters

使用默认的CATransition对象，描述于Table B-3（第页）。滤镜的字属性被动画使用默认隐式CABasicAnimation对象，描述于Table B-2（第页）。

frame

该属性是不可动画的。你可以动画bounds和position属性达到相同的效果。

hidden

使用默认隐式的CABasicAnimation对象，描述于Table B-2（第页）。

mask

使用默认隐式的CABasicAnimation对象，描述于Table B-2（第页）。

masksToBounds

使用默认隐式的CABasicAnimation对象，描述于Table B-2（第页）。

opacity

使用默认隐式的CABasicAnimation对象，描述于Table B-2（第页）。

position

使用默认隐式的CABasicAnimation对象，描述于Table B-2（第页）。

shadowColor

使用默认隐式的CABasicAnimation对象，描述于Table B-2（第页）。

shadowOffset

使用默认隐式的CABasicAnimation对象，描述于Table B-2（第页）。

shadowOpacity

使用默认隐式的CABasicAnimation对象，描述于Table B-2（第页）。

shadowPath

使用默认隐式的CABasicAnimation对象，描述于Table B-2（第页）。

shadowRadius

使用默认隐式的CABasicAnimation对象，描述于Table B-2（第页）。

sublayers

使用默认隐式的CABasicAnimation对象，描述于Table B-2（第页）。

sublayerTransform

使用默认隐式的CABasicAnimation对象，描述于Table B-2（第页）。

transform

使用默认隐式的CABasicAnimation对象，描述于Table B-2（第页）。

zPosition
*/
#endif

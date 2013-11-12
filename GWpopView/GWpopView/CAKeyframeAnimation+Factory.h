//
//  CAKeyFrameAnimation+Factory.h
//  GWpopView
//
//  Created by cannaan on 13-11-8.
//  Copyright (c) 2013年 cannaan. All rights reserved.


#import <QuartzCore/QuartzCore.h>
#include "GWTimingFunction.h"


@interface CAKeyframeAnimation (Factory)

// Factory method to create a keyframe animation 
+ (id)animationWithKeyPath:(NSString *)path values:(NSArray *)values times:(NSArray *)times duration:(CFTimeInterval)duration beginTimes:(float)beginTime delegate:(id)delegate ;
@end


@interface CAAnimationGroup (GWFactory)

//  parameter nodes :  animation begintime and endtime which is form 0 to 1
+ (id)groupWithAnimations:(NSArray *)animations timeNodes:(NSArray *) nodes duration:(float)duration ;

@end


//
//  CAKeyFrameAnimation+Factory.m
//  GWpopView
//
//  Created by cannaan on 13-11-8.
//  Copyright (c) 2013年 cannaan. All rights reserved.
//

#import "CAKeyFrameAnimation+Factory.h"

#define kframeCount 60
@implementation CAKeyframeAnimation (Factory)


+ (id)animationWithKeyPath:(NSString *)path values:(NSArray *)values times:(NSArray *)times duration:(CFTimeInterval)duration beginTimes:(float)beginTime delegate:(id)delegate {

    CAKeyframeAnimation *animation = [CAKeyframeAnimation animationWithKeyPath:path];
	[animation setValues:values];
    [animation setKeyTimes:times];
    [animation setDuration:duration];
    animation.beginTime =  CACurrentMediaTime() + beginTime;
    animation.removedOnCompletion = NO;
    animation.delegate = delegate;
    animation.fillMode = kCAFillModeForwards;
	return animation;
}
@end

@implementation CAAnimationGroup (GWFactory)


+ (id)groupWithAnimations:(NSArray *)animations timeNodes:(NSArray *) nodes duration:(float)duration {

   
    for (int i = 0; i < animations.count; i++) {
        NSArray *array = [nodes objectAtIndex:i];
        float beginTime = [[array objectAtIndex:0] floatValue] * duration;
        float stopTime = [[array objectAtIndex:1] floatValue] * duration;
        
        CAAnimation *animation = [animations objectAtIndex:i];
        animation.beginTime = CACurrentMediaTime() + beginTime;
        animation.beginTime =  beginTime;

        animation.duration = stopTime - beginTime ;
        NSLog(@"begin time %f; duration %f",animation.beginTime,animation.duration);
    }
    
    
    CAAnimationGroup *group =  [CAAnimationGroup animation];
    group.animations = animations;
    group.duration = duration;

    return group;
}
@end


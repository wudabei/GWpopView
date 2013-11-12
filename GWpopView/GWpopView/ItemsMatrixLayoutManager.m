//
//  ItemsMatrixLayoutManager.m
//  GWpopView
//
//  Created by cannaan on 13-11-11.
//  Copyright (c) 2013年 cannaan. All rights reserved.
//
#import "ItemsMatrixLayoutManager.h"
#import "CAKeyframeAnimation+Factory.h"
#import "CONSTS.h"
#import "ItemsMatrixLayout.h"

#define kAxisXStartSpacing 100.0
#define kAxisYStartSpacing 100.0
#define kAxisZStartSpacing
#define kAnchorStartPoint CGPointMake(320.0,150.0)

#define kAxisXStopSpacing 100.0
#define kAxisYStopSpacing 100.0
#define kAxisZStopSpacing
#define kAnchorStopPoint  CGPointMake(60.0,150.0)

#define kDegreeSpacing 0.0
#define kKeyFrameCount 60.0
#define kNumberPerLine 3.0

#define kItemWidth 80.0
#define kItemHeight 80.0

#define kAnimationgroupdelay 0.1
#define kAnimationdelay
#define kAnimationgroupduration 1.5

@implementation ItemsMatrixLayoutManager


- (void)itemsWillAppear {
    [super itemsWillAppear];
    
    if (!self.layout) {
    self.layout = [[ItemsMatrixLayout alloc] init];
    self.layout.numOfItems = self.items.count;
    self.layout.KeyFrameCount = kKeyFrameCount;
    self.layout.numberPerLine = kNumberPerLine;
    
    self.layout.anchorStartPoint = kAnchorStartPoint;
    self.layout.AxisXStartSpacing = kAxisXStartSpacing;
    self.layout.AxisYStartSpacing = kAxisYStartSpacing;
    
    self.layout.anchorStopPoint = kAnchorStopPoint;
    self.layout.AxisXStopSpacing = kAxisXStopSpacing;
    self.layout.AxisYStopSpacing = kAxisYStopSpacing;
    
    [self.layout getBoundryPoint];
    [self.layout getLayoutPointBypositionFun:AxisYConstant timeFun:ExponentialEaseOut parameterX: 0 parameterY:0];
    }
    
    // set items startFrame
     [self setItemFrame:self.layout.startPositionArray itemSize:CGSizeMake(kItemWidth, kItemHeight)];
}

- (void)itemsAppear {
    
    [super itemsAppear];
    // items animations durations
    NSArray * ratioOfAnimationDur = [self.layout generateAnimationDuration:kAnimationgroupduration];
    // items animations begintimes
    NSArray * beginTimes = [self setBeginTimeArray:kAnimationgroupdelay direction:kGWbottom];
    
    
    NSLog(@"%@",self.layout.itemsAnimationValues);
    // 添加动画
    for (int i = 0; i < self.items.count; i++) {
        GWItemCell *item = self.items[i];
        CAKeyframeAnimation *animation =[CAKeyframeAnimation
                                         animationWithKeyPath:kPosition
                                         values:self.layout.itemsAnimationValues[i]
                                         times:nil
                                         duration:[ratioOfAnimationDur[i] floatValue]
                                         beginTimes:[beginTimes[i] floatValue]
                                         delegate:self];
        
        [item.layer addAnimation:animation forKey:@"slide"];
    }
}


- (void) animationDidStop:(CAAnimation *)anim finished:(BOOL)flag {
   
    self.animatingFlag++;
    if (self.animatingFlag == self.items.count) {
        
        for (int i  = 0; i < self.items.count; i++) {
            GWItemCell *cell = self.items[i];
            CGRect frame = cell.frame;
            NSLog(@"cell %f %f",frame.origin.x,frame.origin.y);
            
            CGPoint point = [self.layout.stopPositionArray[i]  CGPointValue];
            frame.origin = CGPointMake(point.x - cell.width/2, point.y - cell.height/2);
            cell.frame =  frame;
            [cell.layer removeAnimationForKey:@"slide"];
            NSLog(@"cell %f %f",frame.origin.x,frame.origin.y);
        }
        self.animatingFlag = 0;
    }
}

- (void)itemsDisappear {
    
    [self itemsWillAppear];
    
}

- (void)itemAppearance {
    
}


@end

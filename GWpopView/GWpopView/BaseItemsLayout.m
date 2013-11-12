//
//  BaseItemsLayout.m
//  GWpopView
//
//  Created by cannaan on 13-11-11.
//  Copyright (c) 2013年 cannaan. All rights reserved.
//

#import "BaseItemsLayout.h"

@implementation BaseItemsLayout


// get distanceRatio

- (NSArray *)generateAnimationDuration:(double)duration {

    if (!self.animationDurations) {
        _animationDurations = [NSMutableArray arrayWithCapacity:0];
    }
    float startAnchorX =  [(NSValue *)self.startPositionArray[0] CGPointValue].x  ;
    float stopAnchorX =  [(NSValue *)self.stopPositionArray[0] CGPointValue].x ;
    float distanceAnchor =  stopAnchorX - startAnchorX ;
    [_animationDurations addObject: [NSNumber numberWithFloat: duration ]];

    for ( int i = 1; i < self.startPositionArray.count; i++ ) {
        
        CGPoint startPoint = [self.startPositionArray[i] CGPointValue];
        CGPoint stopPoint  = [self.stopPositionArray[i] CGPointValue];
        float distance =  stopPoint.x - startPoint.x ;
        
        if ( startAnchorX - stopAnchorX != 0 ) {
            
            float ratio = distance / distanceAnchor;
            NSLog(@"%f",ratio);
            ratio = ratio > 0 ? ratio : -1 * ratio;
            NSLog(@"%f",ratio);

            [_animationDurations addObject: [NSNumber numberWithFloat:( ratio * duration) ]];
        }
    }
    return _animationDurations;
}

// calculate animation values changes with time
- (void)getLayoutPointBypositionFun:(GWPositingFunction)positionFun timeFun:(GWTimingFunction)timeFun parameterX:(float)k parameterY:(float) l {
    
    // if init not by the Method initWithDataDic itemsArrays may be nil
    if (!self.itemsAnimationValues) {
        self.itemsAnimationValues = [NSMutableArray arrayWithCapacity:0];
    }

    // set values for each Animation of item
    for (int j = 0; j < self.numOfItems; j++) {
        CGFloat t = 0.0;
        CGFloat dt = 1.0 / (self.KeyFrameCount - 2);
        
        NSMutableArray *keyframeValues = [NSMutableArray arrayWithCapacity:self.KeyFrameCount];
        
        // get  begin and end positions of a item
        CGPoint startPiont = [self.startPositionArray[j] CGPointValue];
        CGPoint stopPiont =  [self.stopPositionArray [j] CGPointValue];
        // set intermediate position   ; values for animation
        
        for(size_t frame = 0; frame < self.KeyFrameCount; ++frame, t += dt)
        {
            // X changes with time ( t )
            CGFloat x =  round(( startPiont.x + timeFun(t, k) * (stopPiont.x - startPiont.x)) * 100.0) / 100.0;            // Y changes with X,  we can define who Y changes with time (t) too
            
            float y = round(( startPiont.y + positionFun(x, l) *(stopPiont.y - startPiont.y) ) * 100.0) / 100.0;
            CGPoint point = CGPointMake(x, y);
            [keyframeValues addObject:[NSValue valueWithCGPoint:point]];
        }
        
        [self.itemsAnimationValues addObject:keyframeValues];
    }
    
    NSArray *ar =  self.itemsAnimationValues[1];
    int count = ar.count;
for (int i = 0; i < self.startPositionArray.count; i++) {
    [self.itemsAnimationValues[i] insertObject:self.stopPositionArray[i] atIndex:count   ];
    NSArray *ww = self.itemsAnimationValues[i];
    NSLog(@"arraycount%d ;keyframe positions : ff %@",ww.count,self.itemsAnimationValues[i]);
}
}
// calculate matrix of space
- (void)getBoundryPoint{
    
    CGPoint stopPoint;
    _stopPositionArray = [NSMutableArray arrayWithCapacity:0];
    CGPoint startPoint;
    _startPositionArray = [NSMutableArray arrayWithCapacity:0];
    
    for (int j = 0; j < self.numOfItems; j++) {
        
        stopPoint = CGPointMake(self.anchorStopPoint.x  +
                                self.AxisXStopSpacing   * (j % self.numberPerLine) ,
                                self.anchorStopPoint.y  +
                                self.AxisYStopSpacing   * ( j / self.numberPerLine ));
        
        startPoint = CGPointMake(self.anchorStartPoint.x   +
                                 self.AxisXStartSpacing    * (j % self.numberPerLine)
                                 , self.anchorStartPoint.y   +
                                 self.AxisYStartSpacing     * ( j / self.numberPerLine ));
        
        [_stopPositionArray  addObject:[NSValue valueWithCGPoint: stopPoint  ]];
        
        [_startPositionArray addObject:[NSValue valueWithCGPoint: startPoint ]];
        
    }
}

#pragma mark - init with dictionary
//- (void)customTiming: (GWTimingFunction) timeFunc timePara:(float)k andPath:(GWPositingFunction)pathFunc pathPara (float)l {
//
//    }

- (id) initWithDataDic:(NSDictionary*)data{
	if (self = [super init]) {
        
        self.itemsAnimationValues = [NSMutableArray arrayWithCapacity:0];
        [self setAttributes:data];
        [self getBoundryPoint];
        
	}
	return self;
}


-(void)setAttributes:(NSDictionary*)dataDic{
	NSDictionary *attrMapDic = [self attributeMapDictionary];
	if (attrMapDic == nil) {
        NSMutableDictionary *dic = [NSMutableDictionary dictionaryWithCapacity:[dataDic count]];
        for (NSString *key in dataDic) {
            [dic setValue:key forKey:key];
            attrMapDic = dic;
        }
	}
	NSEnumerator *keyEnum = [attrMapDic keyEnumerator];
	id attributeName;
	while ((attributeName = [keyEnum nextObject])) {
		SEL sel = [self getSetterSelWithAttibuteName:attributeName];
		if ([self respondsToSelector:sel]) {
			NSString *dataDicKey = [attrMapDic objectForKey:attributeName];
            id attributeValue = [dataDic objectForKey:dataDicKey];
            
			[self performSelectorOnMainThread:sel
                                   withObject:attributeValue
                                waitUntilDone:[NSThread isMainThread]];
		}
	}
}

-(SEL)getSetterSelWithAttibuteName:(NSString*)attributeName{
	NSString *capital = [[attributeName substringToIndex:1] uppercaseString];
	NSString *setterSelStr = [NSString stringWithFormat:@"set%@%@:",capital,[attributeName substringFromIndex:1]];
	return NSSelectorFromString(setterSelStr);
}

-(NSDictionary*)attributeMapDictionary{
	return nil;
}

#ifdef _FOR_DEBUG_
-(BOOL) respondsToSelector:(SEL)aSelector {
    printf("SELECTOR: %s\n", [NSStringFromSelector(aSelector) UTF8String]);
    return [super respondsToSelector:aSelector];
}
#endif

@end

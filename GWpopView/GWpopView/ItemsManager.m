//
//  ItemManager.m
//  GWpopView
//
//  Created by cannaan on 13-11-8.
//  Copyright (c) 2013年 cannaan. All rights reserved.
//
#import "ItemsManager.h"
@implementation ItemsManager

- (id)initItemsWithBackgroundColors:(NSArray *)colors normalImages: (NSArray *)images delegate:(id)delegate    {

    self = [super init];
    if (self ) {
        
        _items = [NSMutableArray arrayWithCapacity:0];

        for (int i = 0; i < colors.count; i++) {
                        
            GWItemCell *item = [[GWItemCell alloc] initWithBackgroundColor:colors[i] normalImage:images[i] frame:CGRectZero index:( i + 1 )];
            
            item.delegate = delegate;
            [self.items addObject:item];
        }
        
        
        [self itemAppearance];
        [self itemsWillAppear];
}
    return self;
}

- (void)setItemsAnimationWithDelayTimes:(NSArray *)delayTimes animation:(CAAnimation *)animation{
    
    CAKeyframeAnimation *aanimation = [CAKeyframeAnimation animationWithKeyPath:@"position"];
    
    for (int i = 0; i < self.items.count; i++) {

        //        animation.beginTime = CACurrentMediaTime() + [[delayTimes objectAtIndex:i] floatValue] ;
        GWItemCell *cell = self.items[i];

        NSArray *array = (NSArray *)self.layout.itemsAnimationValues[i];
        [aanimation setValues:self.layout.itemsAnimationValues[i]];
        NSLog(@"i = %d is %d", i,array.count);
        
        NSLog(@"item : %d ; 0 : %@;30 : %@ ; 59 : %@",i,array[0],array[30],array[59]);
        
//        [aanimation setKeyTimes:times];
//         aanimation.removedOnCompletion = NO;
        aanimation.duration = 1;
       [cell.layer addAnimation:aanimation forKey:nil];
    }
}
// set begintime of each item animationgroup
- (NSArray *)groupDelay:(float)delay {
    float delayAdd = 0;
    NSMutableArray *array = [NSMutableArray arrayWithCapacity:0];
    for (int i = 0; i < self.items.count; i++) {
        
        delayAdd += delay ;
        if ( ( i % self.layout.numberPerLine ) == 1 && i > self.layout.numberPerLine) {
            delayAdd -= (self.layout.numberPerLine - 1) * delay;
        }
        NSLog(@"groupDelay :%f",delayAdd);
        [array addObject:[NSNumber numberWithFloat:delayAdd]];
    }
    return array;
}


// set item begin frame 
- (void)setItemFrame:(NSArray *)stoPosition itemSize: (CGSize)itemSize {
    
    for (int i = 0; i < stoPosition.count ; i++) {
    
        NSValue *value = (NSValue *) stoPosition[i];
        CGPoint piont = [value CGPointValue];
        CGRect frame = CGRectMake(piont.x, piont.y, itemSize.width, itemSize.height);
        GWItemCell *item = self.items[i];
        item.frame = frame;
    }
}

- (NSArray *)setBeginTimeArray:(float)delayTime direction:(sideLine)sideLine  {

    NSMutableArray * durations = [NSMutableArray arrayWithCapacity:0];
    
    NSArray *array = [ArrayConverseMatrix sideLineWithNumber:self.items.count direction:kGWleft numberPerLine:self.layout.numberPerLine];
    
    
    for (int i = 0; i < array.count; i++) {
        
        float itemDelayTime = [array[i] intValue] * delayTime ;
        [durations addObject:[NSNumber numberWithFloat:itemDelayTime]];
    }
    return durations;
}


#pragma mark - subclass override
- (void)itemsAppear {
    
}

- (void)itemsDisappear {
    
}

- (void)itemsWillAppear {


}


- (void)itemAppearance {
    
}


#pragma mark printf struct -  for debug

- (void)CGRectPrintf:(CGRect)frame {

    NSLog(@"x:%f; y:%f; w:%f; h:%f;",frame.origin.x,frame.origin.y,frame.size.width,frame.size.height);
}


@end

//
//  BaseItemsLayout.h
//  GWpopView
//
//  Created by cannaan on 13-11-11.
//  Copyright (c) 2013年 cannaan. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "GWPostitinValuesFuntion.h"
#import "GWTimingFunction.h"
#import "GWItemCell.h"


@interface BaseItemsLayout : NSObject
/************************************************************************************
 *  ItemPositionsArray1 (itemPosition1, itemPosition2, ...,itemPositionM) ==> fromPosition
 *  ItemPositionsArray2 (itemPosition1, itemPosition2, ...,itemPositionM) ==> interposePosition
 *  ....
 *  ItemPositionsArrayN (itemPosition1, itemPosition2, ...,itemPositionM) ==> toPosition
 ************************************************************************************/

@property (nonatomic,strong) NSMutableArray *itemsAnimationValues;// itemKeyFrame position array 
@property (nonatomic,assign) int numOfItems; //  number of items
@property (nonatomic,assign) int numberPerLine; // line can be curve
@property (nonatomic,assign) int KeyFrameCount;
@property (nonatomic,strong) NSArray *items;// itemCells

// stop status
@property (nonatomic,assign) float AxisXStopSpacing;// default  0.
@property (nonatomic,assign) float AxisYStopSpacing;// default  0.
@property (nonatomic,assign) float AxisZStopSpacing;// default  0.
@property (nonatomic,assign) CGPoint anchorStopPoint; // items anchor piont  anchorPoint.x +
@property (nonatomic,assign) float degreeSpacing;// default  0
@property (nonatomic,strong) NSMutableArray *startPositionArray;// startPiont for each item

// start status
@property (nonatomic,assign) float AxisXStartSpacing;// default  0.
@property (nonatomic,assign) float AxisYStartSpacing;// default  0.
@property (nonatomic,assign) float AxisZStartSpacing;// default  0.
@property (nonatomic,assign) CGPoint anchorStartPoint; // items anchor piont  anchorPoint.x +
@property (nonatomic,strong) NSMutableArray *stopPositionArray;// stopPiont for each item

// time duration
@property (nonatomic,strong) NSMutableArray *animationDurations;


/*************************************************
 *
 * parameter: data contains value of  attributes
 *
 ************************************************ */
-(id)initWithDataDic:(NSDictionary*)data;

/*************************************************
 *
 * subclass can override  for custom layout
 *
 ************************************************ */
- (void)getLayoutPointBypositionFun:(GWPositingFunction)positionFun timeFun:(GWTimingFunction)timeFun parameterX:(float)k parameterY:(float) l ;

/*************************************************
 *
 * get start values  and stop values
 *
 ************************************************ */
- (void)getBoundryPoint;
- (NSArray *)generateAnimationDuration:(double)duration;

@end

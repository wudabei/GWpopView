//
//  ItemsLayoutModel.h
//  GWpopView
//   
//  Created by cannaan on 13-11-12.
//  Copyright (c) 2013年 cannaan. All rights reserved.
//


/*
 *   backUp Model
 */

#import <Foundation/Foundation.h>

@interface ItemsLayoutModel : NSObject

// space
@property (nonatomic,assign) float axisXStartSpacing;
@property (nonatomic,assign) float axisYStartSpacing;
@property (nonatomic,assign) float axisZStartSpacing;
@property (nonatomic,assign) float anchorStartPoint;

@property (nonatomic,assign) float axisXStopSpacing;
@property (nonatomic,assign) float axisYStopSpacing;
@property (nonatomic,assign) float axisZStopSpacing;
@property (nonatomic,assign) float anchorStopPoint;

// 
@property (nonatomic,assign) float degreeSpacing;
@property (nonatomic,assign) float degreeStart;
@property (nonatomic,assign) float degreeStop;

//  time
@property (nonatomic,assign) float animationgroupDelay;
@property (nonatomic,assign) float animationDelay;
@property (nonatomic,assign) float animationgDuration;
@property (nonatomic,assign) float animationgroupDuration;

@property (nonatomic,assign) float keyFrameCount;
@property (nonatomic,assign) float numberPerLine;
@property (nonatomic,assign) float itemWidth;
@property (nonatomic,assign) float itemHeight;

- (id)initWithDataDic:(NSDictionary *)dic;
- (NSDictionary*)attributeMapDictionary;
- (void)setAttributes:(NSDictionary*)dataDic;

@end

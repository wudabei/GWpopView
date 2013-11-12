//
//  ItemManager.h
//  GWpopView
//
//  Created by cannaan on 13-11-8.
//  Copyright (c) 2013年 cannaan. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "BaseItemsLayout.h"
#import "ArrayConverseMatrix.h"
#import "GWItemCell.h"
typedef enum {
    kAppearAnimation,
    kDisappearAnimation,
    kTouchedAnimation,
} animationStyle;


@interface ItemsManager : NSObject
{
}
@property (nonatomic,strong)BaseItemsLayout *layout;
@property (nonatomic,strong)CAAnimationGroup *itemAppearingAnimationgroup;
@property (nonatomic,strong)CAAnimationGroup *itemDisappearingAnimationgroup;
@property (nonatomic,strong)CAAnimationGroup *itemTouchedAnimationgroup;
@property (nonatomic,strong)NSMutableArray *items;// itemCells
@property (nonatomic,assign)int animatingFlag;

- (id)initItemsWithBackgroundColors:(NSArray *)colors normalImages: (NSArray *)images delegate:(id)delegate ;
// interface
- (void)itemsAppear;
- (void)itemsWillAppear;
- (void)itemsDisappear;










//  Method for subClass
/************************************************************
 *----- set beginTime of  animationgroup addTo each item ----
 *
 * parameter     1 delay : items animation one by one , waiting time
 *
 ************************************************************/
- (NSArray *)groupDelay:(float)delay ;


/************************************************************
 *        --------  set item begin frame   --------
 * 
 * parameter     1 startPosition :  item beginOrigins
 *               2 itemSize      :  item beginSizes
 *
 ************************************************************/
- (void)setItemFrame:(NSArray *)startPosition itemSize: (CGSize)itemSize;
// set beginTime for each CAAnimation
- (NSArray *)setBeginTimeArray:(float)delayTime direction:(sideLine)sideLine ;
- (void)setItemsAnimationWithDelayTimes:(NSArray *)delayTimes animation:(CAAnimation *)animation;
@end

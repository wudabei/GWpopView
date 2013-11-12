//
//  GWPopMenu.h
//  GWpopView
//
//  Created by cannaan on 13-11-10.
//  Copyright (c) 2013年 cannaan. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "GWItemCell.h"
#import "BlurBackgroundView.h"
#import "ItemsMatrixLayoutManager.h"
@protocol GWMenuDelegate;

@interface GWPopMenu : UIView<GWItemCellDelegate>

/*
@property (nonatomic, retain)  NSArray *images;
@property (nonatomic, retain) NSArray *borderColors;
@property (nonatomic,retain) NSMutableArray *popViewItems;
@property (nonatomic,retain)UIColor *tintColor;
@property (nonatomic, getter = isExpanding)     BOOL expanding;
 
 // The duration of the show and hide animations of the backgroundView;
 // Default 0.25
 @property (nonatomic, assign) CGFloat backgroundViewAnimationDuration;
 
 
 // The background color for each item view
 // NOTE: set using either colorWithWhite:alpha or colorWithRed:green:blue:alpha
 // Default white: 1, alpha 0.25
 @property (nonatomic, retain) UIColor *itemBackgroundColor;
 @property (nonatomic, assign) NSUInteger borderWidth;

 // The width of the colored border for selected item views
 // Default 2
 
*/

@property (nonatomic,strong)UIImageView *plusImage;
@property (nonatomic,strong)BlurBackgroundView *blurBackgroundView;

@property (nonatomic,strong)ItemsMatrixLayoutManager *itemsManager;
@property (nonatomic, assign) id<GWMenuDelegate> delegate;

- (id)initWithFrame:(CGRect)frame images:(NSArray *)aImageArray colors:(NSArray *)aColorArray;
- (void)dismissMenuAnimation:(GWItemCell *)item;

//- (void)backgroundViewremoveFromMenu:(GWItemCell *)item;



@end


@protocol GWMenuDelegate <NSObject>

@required
- (void)popMenu:(GWPopMenu *)  menu didTapItemAtIndex:(GWItemCell *)item;
@optional
- (void)popMenu:(GWPopMenu *)  menu willShowOnScreenAnimated:(BOOL)animatedYesOrNo;
- (void)popMenu:(GWPopMenu *)  menu didShowOnScreenAnimated:(BOOL)animatedYesOrNo;
- (void)popMenu:(GWPopMenu *)  menu willDismissFromScreenAnimated:(BOOL)animatedYesOrNo;
- (void)popMenu:(GWPopMenu *)  menu didDismissFromScreenAnimated:(BOOL)animatedYesOrNo;
- (void)popMenu:(GWPopMenu *)  menu didEnable:(BOOL)itemEnabled itemAtIndex:(NSUInteger)index;
@end


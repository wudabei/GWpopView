//
//  GWItemCell.h
//  GWpopView
//
//  Created by cannaan on 13-11-9.
//  Copyright (c) 2013年 cannaan. All rights reserved.
//

#import <UIKit/UIKit.h>


@protocol GWItemCellDelegate;
@interface GWItemCell : UIView <UIGestureRecognizerDelegate>

@property (nonatomic, strong) UIImageView *imageView;
@property (nonatomic, assign) NSInteger itemIndex;
@property (nonatomic, strong) UIColor *originalBackgroundColor;
@property (nonatomic, assign) id<GWItemCellDelegate> delegate;
@property (nonatomic, strong) UIColor *tinkColor;
@property (nonatomic,assign)BOOL isNotCornerRadius;
@property (nonatomic,assign)CGSize cellSize;
@property (nonatomic, strong) UITapGestureRecognizer *tapGR;

- (id)initWithBackgroundColor:(UIColor *)color normalImage: (UIImage *)image frame:(CGRect)frame index:(NSInteger) itemIndex ;

@end

@protocol GWItemCellDelegate <NSObject>

- (void)itemTouchesEnd:(GWItemCell *)item;

@end
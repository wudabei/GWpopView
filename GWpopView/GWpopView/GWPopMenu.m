//
//  GWPopMenu.m
//  GWpopView
//
//  Created by cannaan on 13-11-10.
//  Copyright (c) 2013年 cannaan. All rights reserved.
//

#import "GWPopMenu.h"
#define kBackgroundViewAnimationDuration 0.25f


@implementation GWPopMenu

- (id)initWithFrame:(CGRect)frame images:(NSArray *)aImageArray colors:(NSArray *)aColorArray {
    self = [super initWithFrame:frame];
    
    if (self) {
        
        self.layer.cornerRadius = self.size.width/2.0f;
        CGRect frame = self.frame;
        frame.origin.x = 2;
        frame.origin.y -= 2;
        self.frame = frame;
        
        // 生成按钮
        CGRect backgroudBtnFrame = self.bounds;
        UIButton *btn = [UIButton buttonWithType:UIButtonTypeCustom];
        btn.frame = backgroudBtnFrame;
        [btn setImage:[UIImage imageNamed:@"menubg.png"] forState:UIControlStateNormal];
        [btn setImage:[UIImage imageNamed:@"menubg.png"] forState:UIControlStateHighlighted];
        [btn addTarget:self action:@selector(popMenuAnimated:) forControlEvents:UIControlEventTouchUpInside];
        [self addSubview:btn];
        
        // 添加加号按钮
        _plusImage = [[UIImageView alloc]initWithImage:[UIImage imageNamed:@"plus.png"]] ;
        _plusImage.height = btn.height ;
        _plusImage.width = btn.width ;
        _plusImage.center = CGPointMake(btn.width / 3, btn.bottom - btn.height / 3);
//        _plusImage.bottom = btn.bottom;
//        _plusImage.left = btn.left;
        [self addSubview:_plusImage];
        
        self.itemsManager = [[ItemsMatrixLayoutManager alloc] initItemsWithBackgroundColors:aColorArray normalImages:aImageArray delegate:self ];
        
    }
    return self;
}


- (void)popMenuAnimated:(BOOL)animated  {
    
    if (!_blurBackgroundView) {
       _blurBackgroundView = [[BlurBackgroundView alloc]initWithFrame:self.superview.bounds view:self.superview];
    }
        [self.superview addSubview:self.blurBackgroundView];
    
        [self.itemsManager.items enumerateObjectsUsingBlock:^(GWItemCell *item, NSUInteger idx, BOOL *stop) {
            // init Item
            [self.blurBackgroundView addSubview:item];
        }];
    
    
    [UIView animateWithDuration:kBackgroundViewAnimationDuration animations:^{
    self.blurBackgroundView.alpha = 1;
    } completion:^(BOOL finished) {
    
    if (finished && [self.delegate respondsToSelector:@selector(sidebar:didShowOnScreenAnimated:)]) {
    [self.delegate popMenu:self didShowOnScreenAnimated:animated];
    }
    }];
    
    [self.itemsManager itemsAppear];
}

- (void)dismissMenuAnimation:(GWItemCell *)item {
    [UIView animateWithDuration:0.4 animations:^{
        
        self.blurBackgroundView.alpha = 0;
    } completion:^(BOOL finished) {
        [self.itemsManager itemsDisappear];
        [self.blurBackgroundView removeFromSuperview];
    }];
}

#pragma mark -  item delegate

- (void)itemTouchesEnd:(GWItemCell *)item {
    
    [self dismissMenuAnimation:item];
    if (self.delegate && [self.delegate respondsToSelector:@selector(popMenu:didTapItemAtIndex:)]) {
        [self.delegate popMenu:self didTapItemAtIndex:item];
    }
}
@end

//
//  BlurBackgroundView.h
//  GWpopView
//
//  Created by cannaan on 13-11-10.
//  Copyright (c) 2013年 cannaan. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface BlurBackgroundView : UIView

@property (nonatomic,retain)UIImageView *imageView;
@property (nonatomic,retain)UIView *sourceView;
- (id)initWithFrame:(CGRect)frame view:(UIView *)sourceView;

@end

//
//  GWItemCell.m
//  GWpopView
//
//  Created by cannaan on 13-11-9.
//  Copyright (c) 2013年 cannaan. All rights reserved.
//

#import "GWItemCell.h"

@implementation GWItemCell


- (id)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    if (self) {
    }
    return self;
}

- (id)initWithBackgroundColor:(UIColor *)color normalImage: (UIImage *)image frame:(CGRect)frame index:(NSInteger) itemIndex
{
    self = [super initWithFrame:frame];
    if (self) {
        
        _imageView = [[UIImageView alloc] initWithFrame:CGRectZero];
        _imageView.backgroundColor = [UIColor clearColor];
        _imageView.contentMode = UIViewContentModeScaleAspectFit;
        self.clipsToBounds = YES;
        [self addSubview:_imageView];
        self.cellSize = frame.size;
        self.imageView.image = image;
        self.backgroundColor = color;
        self.itemIndex = itemIndex;
    }
    return self;
}

- (void)setIsNotCornerRadius:(BOOL)isNotCornerRadius {
    
    self.isNotCornerRadius = isNotCornerRadius;
    if (isNotCornerRadius) {
        
        CGRect viewFrame = self.frame;
        
        self.layer.cornerRadius = viewFrame.size.width/2.f;
    }
}


- (void)layoutSubviews {
    [super layoutSubviews];
    
    CGFloat inset = self.bounds.size.height/2;
    self.imageView.frame = self.bounds;
    self.imageView.center = CGPointMake(inset, inset);
    
}

- (void)touchesEnded:(NSSet *)touches withEvent:(UIEvent *)event {
    [super touchesEnded:touches withEvent:event];
    
    if (self.delegate && [_delegate respondsToSelector:@selector(itemTouchesEnd:)])
    {
        [_delegate itemTouchesEnd:self];
    }
}

- (void)touchesCancelled:(NSSet *)touches withEvent:(UIEvent *)event {
    
    [super touchesCancelled:touches withEvent:event];
}


@end

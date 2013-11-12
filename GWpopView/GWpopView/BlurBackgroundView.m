//
//  BlurBackgroundView.m
//  GWpopView
//
//  Created by cannaan on 13-11-10.
//  Copyright (c) 2013年 cannaan. All rights reserved.
//

#import "BlurBackgroundView.h"
#import "UIImage+ImageEffects.h"

#pragma mark - UIView + Screenshot
@implementation UIView (Screenshot)

- (UIImage*)screenshot {
    
    UIGraphicsBeginImageContext(self.bounds.size);
    [self.layer renderInContext:UIGraphicsGetCurrentContext()];
    UIImage *image = UIGraphicsGetImageFromCurrentImageContext();
    UIGraphicsEndImageContext();
    
    // hack, helps w/ our colors when blurring
    NSData *imageData = UIImageJPEGRepresentation(image, 1); // convert to jpeg
    image = [UIImage imageWithData:imageData];
    
    return image;
}
@end



@implementation BlurBackgroundView

- (id)initWithFrame:(CGRect)frame view:(UIView *)sourceView
{
    self = [super initWithFrame:frame];
    if (self) {
        
        self.sourceView = sourceView;
        _imageView = [[UIImageView alloc] initWithFrame:self.bounds];
        [self addSubview:_imageView];
        self.userInteractionEnabled = YES;
        [self show];
        self.alpha =0;
    }
    return self;
}

- (void)show {
    
    UIImage *blurImage = [self.sourceView screenshot];
    self.imageView.image = [blurImage applyDarkEffect];
}

@end

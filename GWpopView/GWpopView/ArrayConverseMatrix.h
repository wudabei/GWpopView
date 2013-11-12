//
//  ArrayConverseMatrix.h
//  GWpopView
//
//  Created by cannaan on 13-11-11.
//  Copyright (c) 2013年 cannaan. All rights reserved.
//

#import <Foundation/Foundation.h>
enum sideLine {
    kGWtop = 1,
    kGWRight ,
    kGWbottom,
    kGWleft
} ;
typedef enum sideLine sideLine;

@interface ArrayConverseMatrix : NSObject


// compositored by side line 

+ (NSArray *)sideLineWithNumber:(int)count direction:(sideLine)sideLine  numberPerLine:(int) col;

// center object compositored first
//+ (NSArray *)sideLineArray:(NSArray *)needOrderArray numberPerLine:(int) col;

@end

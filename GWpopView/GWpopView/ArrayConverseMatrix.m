//
//  ArrayConverseMatrix.m
//  GWpopView
//
//  Created by cannaan on 13-11-11.
//  Copyright (c) 2013年 cannaan. All rights reserved.
//



#import "ArrayConverseMatrix.h"

@implementation ArrayConverseMatrix

+ (NSArray *)sideLineWithNumber:(int)count direction:(sideLine)sideLine  numberPerLine:(int) col {
    
    int row = count / col ;
    NSMutableArray *tmpArray = [NSMutableArray arrayWithCapacity:0];
    
    
    switch (sideLine) {
        case kGWtop:
            for (int i = 0; i < col; i++) {
                
                for (int j = 0; j < row; j++) {

                [tmpArray addObject:[NSNumber numberWithInt:i * col + j]];
                }
            }
            break;
               
        case kGWRight :
            for (int i = col - 1; i >= 0; i--) {
                
                for (int j = 0; j < row; j++) {
                    
                    [tmpArray addObject:[NSNumber numberWithInt:i * col + j]];
                }
            }
            break;

        case kGWbottom:
            for (int i = 0; i < row; i++) {
                
                for (int j = 0; j < col; j++) {
                    
                    [tmpArray addObject:[NSNumber numberWithInt:i * col + j]];
                }
            }
            break;

        case kGWleft:
            for (int i = row - 1; i >= 0; i--) {
                
                for (int j = 0; j < col; j++) {
                    
                    [tmpArray addObject:[NSNumber numberWithInt:i * col + j]];
                }
            }
            break;
    }
    NSMutableArray *array    = [NSMutableArray arrayWithCapacity:count];
    for (int k = 0; k <count; k++) {
        [array addObject:@"tmp"];
    }
    
    for (int i = 0; i < count; i++) {
        
        [array replaceObjectAtIndex:[tmpArray[i] intValue] withObject:[NSNumber numberWithInteger:i]];

    }
    
    return array;
}

- (NSArray *)pointWithCount:(int )count numberPerLine:(int) col
{
    
    NSMutableArray *array = [NSMutableArray arrayWithCapacity:0];
    return array;
}

- (NSArray *)sideLineArray:(NSArray *)orderedArray numberPerLine:(int) col {
    return nil;
}

@end

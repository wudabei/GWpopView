//
//  DemoControllerViewController.m
//  GWpopView
//
//  Created by cannaan on 13-11-10.
//  Copyright (c) 2013年 cannaan. All rights reserved.
//

#import "DemoControllerViewController.h"
#import "GWPopMenu.h"
#import "ArrayConverseMatrix.h"
#import "GWItemCell.h"
#import "GWViewController.h"
@interface DemoControllerViewController ()

@end

@implementation DemoControllerViewController

- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil
{
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self) {
        
        // Custom initialization
    }
    return self;
}

- (void)viewDidLoad
{
    [super viewDidLoad];
    NSArray *images = @[[UIImage imageNamed:@"1.png"],
                        [UIImage imageNamed:@"2.png"],
                        [UIImage imageNamed:@"1.png"],
                        
                        [UIImage imageNamed:@"1.png"],
                        [UIImage imageNamed:@"2.png"],
                        [UIImage imageNamed:@"1.png"],
                        
                        [UIImage imageNamed:@"1.png"],
                        [UIImage imageNamed:@"2.png"],
                                                [UIImage imageNamed:@"1.png"],

                       ];
    NSArray *colors = @[
                       [UIColor colorWithRed:240/255.f green:159/255.f blue:254/255.f alpha:1],
                       [UIColor colorWithRed:255/255.f green:137/255.f blue:167/255.f alpha:1],
                       [UIColor colorWithRed:126/255.f green:242/255.f blue:195/255.f alpha:1],
                       [UIColor colorWithRed:240/255.f green:159/255.f blue:254/255.f alpha:1],
                       [UIColor colorWithRed:126/255.f green:242/255.f blue:195/255.f alpha:1],
                       [UIColor colorWithRed:240/255.f green:159/255.f blue:254/255.f alpha:1],
                       
                       [UIColor colorWithRed:240/255.f green:159/255.f blue:254/255.f alpha:1],
                       [UIColor colorWithRed:126/255.f green:242/255.f blue:195/255.f alpha:1],
                       [UIColor colorWithRed:240/255.f green:159/255.f blue:254/255.f alpha:1],
                       

                      
                       ];
    NSLog(@"%d %d image",colors.count,images.count);
    CGFloat height = 60;
    GWPopMenu *popmenu = [[GWPopMenu alloc] initWithFrame:CGRectMake(0, self.view.bottom - height, height, height) images:images colors:colors];
    popmenu.delegate = self;
    [self.view addSubview:popmenu];
    
       
    
}


- (void)popMenu:(GWPopMenu *)  menu didTapItemAtIndex:(GWItemCell *)item {
    int index = item.itemIndex;
    NSLog(@"%d",index);
    if (index == 1 || index == 2 || index == 3 ){
        NSLog(@"TEST");
    
    }else{
        GWViewController *view = [[GWViewController alloc]init];
        [self.navigationController pushViewController:view animated:YES];
    }
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end

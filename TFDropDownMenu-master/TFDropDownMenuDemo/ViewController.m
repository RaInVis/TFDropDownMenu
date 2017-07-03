//
//  ViewController.m
//  TFDropDownMenuDemo
//
//  Created by RaInVis on 2017/7/3.
//  Copyright © 2017年 RaInVis. All rights reserved.
//

#import "ViewController.h"
#import "TFDropDownMenu.h"

#define UIColorFromRGB(rgbValue) [UIColor colorWithRed:((float)((rgbValue & 0xFF0000) >> 16))/255.0 green:((float)((rgbValue & 0xFF00) >> 8))/255.0 blue:((float)(rgbValue & 0xFF))/255.0 alpha:1.0]

@interface ViewController ()

@property (nonatomic, assign) NSUInteger count; //!< <#注释#>


@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    _count = 1;
    // Do any additional setup after loading the view, typically from a nib.
}


- (void)touchesBegan:(NSSet<UITouch *> *)touches withEvent:(UIEvent *)event
{
    _count ++;
    if (_count%2) {
        return;
    }
    
    NSSet *allTouches = [event allTouches];
    UITouch *touch = [allTouches anyObject];
    CGPoint point = [touch locationInView:[touch view]];
    
    TFDropDownMenu *menu = [[TFDropDownMenu alloc] initWithPoint:point arrowsRatio:0.8 direction:TFDropDownMenuArrowsDirectionTop alpha:0.4 delegate:self initialIndex:0 backgroundColor:[UIColor blackColor] itemColor:[UIColor whiteColor] itemWidth:124 itemHeight:50 unselectedColor:UIColorFromRGB(0x333333) selectedColor:UIColorFromRGB(0xfe611a) unselectedFont:[UIFont systemFontOfSize:15] selectedFont:[UIFont systemFontOfSize:15] separateLineColor:UIColorFromRGB(0xdcdcdc) title:@"全部", @"转发", @"评论", @"赞", nil];
    [menu showInView:self.view animate:YES];
    
    
}

- (void)TFDropDownMenu:(TFDropDownMenu *)TFDropDownMenu didSelectRowAtIndex:(NSUInteger)index
{
    _count ++;

    NSLog(@"点击的item标题为:%@", TFDropDownMenu.titleArray[index]);
}

- (void)TFDropDownMenuWillDisappear:(TFDropDownMenu *)TFDropDownMenu
{
    NSLog(@"TFDropDownMenu消失了");
}



- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


@end

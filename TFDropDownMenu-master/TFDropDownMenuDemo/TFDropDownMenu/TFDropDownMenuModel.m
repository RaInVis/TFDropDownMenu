//
//  TFDropDownMenuModel.m
//  TFDropDownMenuDemo
//
//  Created by RaInVis on 2017/7/3.
//  Copyright © 2017年 RaInVis. All rights reserved.
//

#import "TFDropDownMenuModel.h"

@implementation TFDropDownMenuModel

- (instancetype)initWithInitialIndex:(NSUInteger)index
                     unselectedColor:(UIColor *)unselectedColor
                       selectedColor:(UIColor *)selectedColor itemColor:(UIColor *)itemColor
                      unselectedFont:(UIFont *)unselectedFont
                        selectedFont:(UIFont *)selectedFont
                          itemHeight:(CGFloat)height
                   separateLineColor:(UIColor *)separateLineColor
                               title:(NSString *)title
{
    if (self = [super init]) {
        self.index = index;
        self.unselectedFont = unselectedFont;
        self.selectedFont = selectedFont;
        self.unselectedColor = unselectedColor;
        self.selectedColor = selectedColor;
        self.itemHeight = height;
        self.itemColor = itemColor;
        self.separateLineColor = separateLineColor;
        self.title = title;
    }
    return self;
}

- (instancetype)initWithTitle:(NSString *)title index:(NSUInteger)index
{
    if (self = [super init]) {
        self.index = index;
        self.title = title;
    }
    return self;
}


@end

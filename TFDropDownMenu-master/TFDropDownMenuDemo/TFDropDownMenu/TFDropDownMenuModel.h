//
//  TFDropDownMenuModel.h
//  TFDropDownMenuDemo
//
//  Created by RaInVis on 2017/7/3.
//  Copyright © 2017年 RaInVis. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface TFDropDownMenuModel : NSObject

@property (nonatomic, assign) NSUInteger index; //!< <#注释#>
@property (nonatomic, strong) UIColor *unselectedColor; //!< <#注释#>
@property (nonatomic, strong) UIColor *selectedColor; //!< <#注释#>
@property (nonatomic, strong) UIFont *unselectedFont; //!< <#注释#>
@property (nonatomic, strong) UIFont *selectedFont; //!< <#注释#>
@property (nonatomic, strong) UIColor *separateLineColor; //!< <#注释#>
@property (nonatomic, assign) CGFloat itemHeight; //!< <#注释#>
@property (nonatomic, copy) NSString *title; //!< <#注释#>
@property (nonatomic, assign) BOOL isSelected; //!< <#注释#>
@property (nonatomic, strong) UIColor *itemColor; //!< <#注释#>


- (instancetype)initWithInitialIndex:(NSUInteger)index
                     unselectedColor:(UIColor *)unselectedColor
                       selectedColor:(UIColor *)selectedColor itemColor:(UIColor *)itemColor
                      unselectedFont:(UIFont *)unselectedFont
                        selectedFont:(UIFont *)selectedFont
                          itemHeight:(CGFloat)height
                   separateLineColor:(UIColor *)separateLineColor
                               title:(NSString *)title;

- (instancetype)initWithTitle:(NSString *)title index:(NSUInteger)index;

@end

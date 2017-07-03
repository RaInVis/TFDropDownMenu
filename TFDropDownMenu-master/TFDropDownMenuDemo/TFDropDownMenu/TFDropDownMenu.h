//
//  TFDropDownMenu.h
//  TFDropDownMenuDemo
//
//  Created by RaInVis on 2017/7/3.
//  Copyright © 2017年 RaInVis. All rights reserved.
//
#import <UIKit/UIKit.h>

@class TFDropDownMenu;

@protocol TFDropDownMenuDelegate <NSObject>

@required

/**
 点击下拉菜单的回调

 @param TFDropDownMenu 点击的下拉菜单
 @param index index
 */
- (void)TFDropDownMenu:(TFDropDownMenu *)TFDropDownMenu didSelectRowAtIndex:(NSUInteger )index;

/**
 下拉菜单消失后的回调

 @param TFDropDownMenu 消失的下拉菜单
 */
- (void)TFDropDownMenuWillDisappear:(TFDropDownMenu *)TFDropDownMenu;

@end

// 下拉菜单箭头的方向
typedef NS_ENUM(NSInteger, TFDropDownMenuArrowsDirection) {
    TFDropDownMenuArrowsDirectionTop = 0, // 向上
    TFDropDownMenuArrowsDirectionBottom, // 向下
};

@interface TFDropDownMenu : UIView

@property (nonatomic, weak) id<TFDropDownMenuDelegate> delegate; //!< 代理
@property (nonatomic, strong, readonly) NSArray <NSString *>*titleArray; //!< 标题数组


/**
 初始化下拉菜单

 @param point 视图上的位置
 @param ratio 箭头的左边离菜单左边的比例
 @param direction 箭头的方向
 @param alpha 透明度
 @param delagte 代理
 @param index 默认选择的index
 @param color 背景颜色
 @param itemColor 单元格颜色
 @param width 单元格的宽度
 @param height 单元格的高度
 @param unselectedColor 未选中的字体颜色
 @param selectedColor 选中的字体颜色
 @param unselectedFont 未选中的字体
 @param selectedFont 选中的字体
 @param separateLineColor 分割线颜色
 @param title 单元格的名称,逗号隔开
 @return 下拉菜单
 */
- (instancetype)initWithPoint:(CGPoint)point
                  arrowsRatio:(CGFloat)ratio
                    direction:(TFDropDownMenuArrowsDirection)direction
                        alpha:(CGFloat)alpha
                     delegate:(id)delagte
                 initialIndex:(NSUInteger)index
              backgroundColor:(UIColor *)color
                    itemColor:(UIColor *)itemColor
                    itemWidth:(CGFloat)width
                   itemHeight:(CGFloat)height
              unselectedColor:(UIColor *)unselectedColor
                selectedColor:(UIColor *)selectedColor
               unselectedFont:(UIFont *)unselectedFont
                 selectedFont:(UIFont *)selectedFont
            separateLineColor:(UIColor *)separateLineColor
                        title:(NSString *)title, ...NS_REQUIRES_NIL_TERMINATION;
/**
 初始化下拉菜单
 
 @param point 视图上的位置
 @param ratio 箭头的左边离菜单左边的比例
 @param direction 箭头的方向
 @param alpha 透明度
 @param delagte 代理
 @param index 默认选择的index
 @param color 背景颜色
 @param itemColor 单元格颜色
 @param width 单元格的宽度
 @param height 单元格的高度
 @param unselectedColor 未选中的字体颜色
 @param selectedColor 选中的字体颜色
 @param unselectedFont 未选中的字体
 @param selectedFont 选中的字体
 @param separateLineColor 分割线颜色
 @param titleArray 单元格的名称数组
 @return 下拉菜单
 */
- (instancetype)initWithPoint:(CGPoint)point
                  arrowsRatio:(CGFloat)ratio
                    direction:(TFDropDownMenuArrowsDirection)direction
                        alpha:(CGFloat)alpha
                     delegate:(id)delagte
                 initialIndex:(NSUInteger)index
                    itemColor:(UIColor *)itemColor
              backgroundColor:(UIColor *)color
                    itemWidth:(CGFloat)width
                   itemHeight:(CGFloat)height
              unselectedColor:(UIColor *)unselectedColor
                selectedColor:(UIColor *)selectedColor
               unselectedFont:(UIFont *)unselectedFont
                 selectedFont:(UIFont *)selectedFont
            separateLineColor:(UIColor *)separateLineColor
                   titleArray:(NSArray <NSString *>*)titleArray;

/**
 重新设置单元格样式

 @param idx 需要重新设置的index
 @param itemColor 单元格颜色
 @param unselectedColor 未选中的字体颜色
 @param selectedColor 选中的字体颜色
 @param unselectedFont 未选中的字体
 @param selectedFont 选中的字体
 @param height 单元格的高度
 @param separateLineColor 分割线颜色
 @param title 单元格的名称,逗号隔开
 */

- (void)reSetForIndex:(NSUInteger)idx
            itemColor:(UIColor *)itemColor
      unselectedColor:(UIColor *)unselectedColor
        selectedColor:(UIColor *)selectedColor
       unselectedFont:(UIFont *)unselectedFont
         selectedFont:(UIFont *)selectedFont
           itemHeight:(CGFloat)height
    separateLineColor:(UIColor *)separateLineColor
                title:(NSString *)title;


/**
 添加已设置样式的单元格

 @param title 单元格名称
 */
- (void)addItemWithTitle:(NSString *)title;


/**
 添加自定义单元格

 @param title 单元格的名称,逗号隔开
 @param itemColor 单元格颜色
 @param unselectedColor 未选中的字体颜色
 @param selectedColor 选中的字体颜色
 @param unselectedFont 未选中的字体
 @param selectedFont 选中的字体
 @param height 单元格的高度
 @param separateLineColor 分割线颜色
 */
- (void)addItemWithTitle:(NSString *)title
               itemColor:(UIColor *)itemColor
         unselectedColor:(UIColor *)unselectedColor
           selectedColor:(UIColor *)selectedColor
          unselectedFont:(UIFont *)unselectedFont
            selectedFont:(UIFont *)selectedFont
              itemHeight:(CGFloat)height
       separateLineColor:(UIColor *)separateLineColor;

/**
 显示在视图中

 @param view 显示在的视图
 @param animate 是否有动画
 */
- (void)showInView:(UIView *)view animate:(BOOL)animate;

@end

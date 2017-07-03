# TFDropDownMenu
a highly customizable drop-down menu ,You can customize various properties of a cell, such as color, University, width, etc.
Provides several initialization methods to add a data source and obtain a click event through an agent
just call this method
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

![image](https://github.com/RaInvis/TFDropDownMenu/blob/master/TFDropDownMenu-master/TFDropDownMenuDemo/drowDownMenugif.gif)


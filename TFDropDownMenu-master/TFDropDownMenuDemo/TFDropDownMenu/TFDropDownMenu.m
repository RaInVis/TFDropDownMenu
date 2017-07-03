//
//  TFDropDownMenu.m
//  TFDropDownMenuDemo
//
//  Created by RaInVis on 2017/7/3.
//  Copyright © 2017年 RaInVis. All rights reserved.
//

#import "TFDropDownMenu.h"
#import "TFDropDownMenuModel.h"
#import "TFDropDownMenuTableViewCell.h"

static CGFloat imageWidth = 14.f;
static CGFloat imageHeight = 14.f;

@interface TFDropDownMenu () <UITableViewDataSource, UITableViewDelegate>

@property (nonatomic, strong) NSMutableArray *dataArray; //!< <#注释#>
@property (nonatomic, strong) UITableView *tableView; //!< <#注释#>
@property (nonatomic, strong) UIImageView *imageView; //!< <#注释#>
@property (nonatomic, strong) TFDropDownMenuModel *defaultModel; //!< <#注释#>
@property (nonatomic, strong) UIView *bgView; //!< <#注释#>
@property (nonatomic, strong) UIView *contentView; //!< <#注释#>

@property (nonatomic, assign) CGPoint point; //!< <#注释#>
@property (nonatomic, assign) CGFloat ratio; //!< <#注释#>
@property (nonatomic, strong) UIColor *bgColor; //!< <#注释#>
@property (nonatomic, assign) CGFloat itemWidth; //!< <#注释#>
@property (nonatomic, assign) NSUInteger index; //!< <#注释#>
@property (nonatomic, strong) UIColor *placeholdColor; //!< <#注释#>
@property (nonatomic, assign) CGFloat alpha; //!< <#注释#>
@property (nonatomic, assign) TFDropDownMenuArrowsDirection direction; //!< <#注释#>

@end

@implementation TFDropDownMenu

- (UIView *)contentView
{
    if (!_contentView) {
        _contentView = [[UIView alloc] init];
        _contentView.alpha = 0;
        _contentView.userInteractionEnabled = YES;
        UITapGestureRecognizer *tap = [[UITapGestureRecognizer alloc] initWithTarget:self action:@selector(remove)];
        [_contentView addGestureRecognizer:tap];
    
    }
    return _contentView;
}

- (UIView *)bgView
{
    if (!_bgView) {
        _bgView = [[UIView alloc] init];
        _bgView.clipsToBounds = YES;
    }
    return _bgView;
}

- (UIImageView *)imageView
{
    if (!_imageView) {
        _imageView = [[UIImageView alloc] initWithImage:[UIImage imageNamed:@"messageList_arrow_icon"]];
    }
    return _imageView;
}

- (UIColor *)bgColor
{
    if (!_bgColor) {
        _bgColor = [UIColor new];
    }
    return _bgColor;
}

- (UIColor *)placeholdColor
{
    if (!_placeholdColor) {
        _placeholdColor = [UIColor new];
    }
    return _placeholdColor;
}

- (TFDropDownMenuModel *)defaultModel
{
    if (!_defaultModel) {
        _defaultModel = [[TFDropDownMenuModel alloc] init];
    }
    return _defaultModel;
}

- (UITableView *)tableView
{
    if (!_tableView) {
        _tableView = [[UITableView alloc] init];
        _tableView.separatorStyle = UITableViewCellSeparatorStyleNone;
        _tableView.layer.cornerRadius = 3.f;
        _tableView.layer.masksToBounds = YES;
        _tableView.bounces = NO;
        _tableView.delegate = self;
        _tableView.dataSource = self;
        _tableView.backgroundColor = [UIColor clearColor];
        [_tableView registerNib:[UINib nibWithNibName:@"TFDropDownMenuTableViewCell" bundle:nil] forCellReuseIdentifier:@"TFDropDownMenuTableViewCell"];
    }
    return _tableView;
}

- (NSMutableArray *)dataArray
{
    if (!_dataArray) {
        _dataArray = [NSMutableArray array];
    }
    return _dataArray;
}

- (instancetype)initWithPoint:(CGPoint)point
                  arrowsRatio:(CGFloat)ratio
                    direction:(TFDropDownMenuArrowsDirection)direction                             alpha:(CGFloat)alpha
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
                        title:(NSString *)title, ...NS_REQUIRES_NIL_TERMINATION
{
    if (self = [super init]) {
        
        self.defaultModel = [[TFDropDownMenuModel alloc] initWithInitialIndex:index unselectedColor:unselectedColor selectedColor:selectedColor itemColor:itemColor unselectedFont:unselectedFont selectedFont:selectedFont itemHeight:height separateLineColor:separateLineColor title:title];
        
        self.direction = direction;
        self.itemWidth = width;
        self.delegate = delagte;
        self.point = point;
        self.ratio = ratio;
        self.index = index;
        self.bgColor = color;
        self.alpha = alpha;
        
        va_list args;
        va_start(args, title);
        
        if (title) {
            [self addItemWithTitle:title];
            NSString *other;
            while ((other = va_arg(args, NSString *))) {
                [self addItemWithTitle:other];
            }
        }
        va_end(args);
    }
    return self;
}

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
                   titleArray:(NSArray <NSString *>*)titleArray
{
    if (self = [super init]) {
        
        self.defaultModel = [[TFDropDownMenuModel alloc] initWithInitialIndex:index unselectedColor:unselectedColor selectedColor:selectedColor itemColor:itemColor unselectedFont:unselectedFont selectedFont:selectedFont itemHeight:height separateLineColor:separateLineColor title:titleArray.firstObject];
        self.direction = direction;
        self.itemWidth = width;
        self.delegate = delagte;
        self.point = point;
        self.ratio = ratio;
        self.index = index;
        self.bgColor = color;
        self.alpha = alpha;
        
        for (NSString *title in titleArray) {
            [self addItemWithTitle:title];
        }
    }
    return self;
}


- (void)reSetForIndex:(NSUInteger)idx
            itemColor:(UIColor *)itemColor
      unselectedColor:(UIColor *)unselectedColor
        selectedColor:(UIColor *)selectedColor
       unselectedFont:(UIFont *)unselectedFont
         selectedFont:(UIFont *)selectedFont
           itemHeight:(CGFloat)height
    separateLineColor:(UIColor *)separateLineColor
                title:(NSString *)title
{
    NSAssert(self.dataArray.count > idx, @"self.dataArray.count > idx");    
    TFDropDownMenuModel *model = [[TFDropDownMenuModel alloc] initWithInitialIndex:idx unselectedColor:unselectedColor selectedColor:selectedColor itemColor:itemColor unselectedFont:unselectedFont selectedFont:selectedFont itemHeight:height separateLineColor:separateLineColor title:title];
    [self.dataArray replaceObjectAtIndex:idx withObject:model];
}

- (void)addItemWithTitle:(NSString *)title
{
    TFDropDownMenuModel *model = [[TFDropDownMenuModel alloc] initWithTitle:title index:self.dataArray.count];
    [self.dataArray addObject:model];
}

- (void)addItemWithTitle:(NSString *)title
               itemColor:(UIColor *)itemColor
         unselectedColor:(UIColor *)unselectedColor
           selectedColor:(UIColor *)selectedColor
          unselectedFont:(UIFont *)unselectedFont
            selectedFont:(UIFont *)selectedFont
              itemHeight:(CGFloat)height
       separateLineColor:(UIColor *)separateLineColor
{
    TFDropDownMenuModel *model = [[TFDropDownMenuModel alloc] initWithInitialIndex:self.dataArray.count unselectedColor:unselectedColor selectedColor:selectedColor itemColor:itemColor unselectedFont:unselectedFont selectedFont:selectedFont itemHeight:height separateLineColor:separateLineColor title:title];
    [self.dataArray addObject:model];
}


- (void)showInView:(UIView *)view animate:(BOOL)animate
{
    CGFloat tableViewH = [self getTableViewHeight];
    // 设置箭头的位置和方向
    CGFloat x =  (self.itemWidth - imageWidth)*self.ratio;
    if (self.direction == TFDropDownMenuArrowsDirectionTop) {
        self.imageView.frame = CGRectMake(x, 0.5, imageWidth, imageWidth);
        self.tableView.frame = CGRectMake(0, imageHeight, self.itemWidth, tableViewH);
    }else{
        self.tableView.frame = CGRectMake(0, 0, self.itemWidth, tableViewH);
        
        self.imageView.frame = CGRectMake(x, tableViewH - 0.5, imageWidth, imageWidth);
        self.imageView.transform = CGAffineTransformMakeRotation(M_PI);
    }
    self.tableView.layer.borderColor = [UIColor colorWithRed:220.0/255.0 green:220.0/255.0 blue:220.0/255.0 alpha:1].CGColor;
    self.tableView.layer.borderWidth = 0.5;
    
    self.bgView.frame = CGRectMake(self.point.x - x -imageWidth/2, self.point.y, self.itemWidth, 0);
    self.frame = view.bounds;
    self.contentView.frame = self.bounds;
    
    self.contentView.backgroundColor = self.bgColor;

    [self.bgView addSubview:self.tableView];
    [self.bgView addSubview:self.imageView];
    [self addSubview:self.contentView];
    [self addSubview:self.bgView];
    [view addSubview:self];
    // 动画小伙
    [UIView animateWithDuration:0.3 animations:^{
        self.contentView.alpha = self.alpha;
        
        if (self.direction == TFDropDownMenuArrowsDirectionTop) {
            self.bgView.frame = CGRectMake(self.point.x - x -imageWidth/2, self.point.y, self.itemWidth, tableViewH + imageHeight);
        }else{
            self.bgView.frame = CGRectMake(self.point.x - x -imageWidth/2, self.point.y - imageWidth - tableViewH, self.itemWidth, tableViewH + imageHeight);
        }
        
    } completion:^(BOOL finished) {
        [self layoutIfNeeded];
        [self setNeedsLayout];
    }];
    
}
// 动态计算tableView的高度
- (CGFloat)getTableViewHeight
{
    CGFloat tableViewH = 0.0;
    for (NSUInteger idx = 0; idx < self.dataArray.count; idx ++) {
        TFDropDownMenuModel *model = self.dataArray[idx];
        if (model.itemHeight) {
            tableViewH += model.itemHeight;
        }else {
            tableViewH += self.defaultModel.itemHeight;
        }
    }
    return tableViewH;
}

- (void)remove
{
    __weak typeof(self) weakSelf = self;
    [self dismiss:^(BOOL finished) {
        if (self.delegate && [self.delegate respondsToSelector:@selector(TFDropDownMenuWillDisappear:)]) {
            [self.delegate TFDropDownMenuWillDisappear:self];
        }
        [weakSelf removeFromSuperview];
    }];
}

- (void)dismiss:(void (^ __nullable)(BOOL finished))completion
{
    CGFloat x =  (self.itemWidth - imageWidth)*self.ratio;
    
    [UIView animateWithDuration:0.3 animations:^{
        self.contentView.alpha = 0;
        self.bgView.frame = CGRectMake(self.point.x - x -imageWidth/2, self.point.y, self.itemWidth, 0);
    } completion:^(BOOL finished) {
        if (completion) {
            completion(finished);
        }
    }];
}

#pragma mark - UITableViewDataSource & UITableViewDelegate

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    TFDropDownMenuTableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:@"TFDropDownMenuTableViewCell"];
    TFDropDownMenuModel *model = self.dataArray[indexPath.row];
    model.isSelected = NO;
    if (indexPath.row == self.index) {
        model.isSelected = YES;
    }
    if (model.itemHeight == 0) {
        self.defaultModel.index = model.index;
        self.defaultModel.isSelected = model.isSelected;
        self.defaultModel.title = model.title;
        [cell configCell:self.defaultModel];
    }else{
        
        if (self.direction == TFDropDownMenuArrowsDirectionBottom && self.dataArray.count == indexPath.row + 1) {
            model.separateLineColor = [UIColor clearColor];
        }
        
        [cell configCell:model];
    }
    
    return cell;
}

- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath
{
    TFDropDownMenuModel *model = self.dataArray[indexPath.row];
    if (model.itemHeight) {
        return model.itemHeight;
    }
    return self.defaultModel.itemHeight;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    return self.dataArray.count;
}

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath
{
    [tableView deselectRowAtIndexPath:indexPath animated:YES];
    __weak typeof(self) weakSelf = self;
    [self dismiss:^(BOOL finished) {
        if (weakSelf.delegate && [weakSelf.delegate respondsToSelector:@selector(TFDropDownMenu:didSelectRowAtIndex:)]) {
            [weakSelf.delegate TFDropDownMenu:weakSelf didSelectRowAtIndex:indexPath.row];
        }
        if (self.delegate && [self.delegate respondsToSelector:@selector(TFDropDownMenuWillDisappear:)]) {
            [self.delegate TFDropDownMenuWillDisappear:self];
        }
        [weakSelf removeFromSuperview];
    }];
}
- (NSArray<NSString *> *)titleArray
{
    NSMutableArray *array = [NSMutableArray array];
    
    for (NSUInteger idx = 0; idx < self.dataArray.count; idx ++) {
        TFDropDownMenuModel *model = self.dataArray[idx];
        [array addObject: model.title];
    }
    
    return [NSArray arrayWithArray:array];
    
}


@end

//
//  TFDropDownMenuTableViewCell.m
//  TFDropDownMenuDemo
//
//  Created by RaInVis on 2017/7/3.
//  Copyright © 2017年 RaInVis. All rights reserved.
//

#import "TFDropDownMenuTableViewCell.h"
#import "TFDropDownMenuModel.h"

@interface TFDropDownMenuTableViewCell ()

@property (weak, nonatomic) IBOutlet UILabel *titleLab;
@property (weak, nonatomic) IBOutlet UIView *placeholderLine;

@end

@implementation TFDropDownMenuTableViewCell

- (void)configCell:(TFDropDownMenuModel *)model
{
    _titleLab.text = model.title;
    _titleLab.font = model.unselectedFont;
    _titleLab.textColor = model.unselectedColor;
    _placeholderLine.backgroundColor = model.separateLineColor;
    self.contentView.backgroundColor = model.itemColor;
    if (model.isSelected) {
        _titleLab.font = model.selectedFont;
        _titleLab.textColor = model.selectedColor;
    }
}


- (void)awakeFromNib {
    [super awakeFromNib];
    self.selectionStyle = UITableViewCellSelectionStyleNone;
    // Initialization code
}

- (void)setSelected:(BOOL)selected animated:(BOOL)animated {
    [super setSelected:selected animated:animated];

    // Configure the view for the selected state
}

@end

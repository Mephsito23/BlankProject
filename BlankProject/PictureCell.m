//
//  PictureCell.m
//  BlankProject
//
//  Created by mac on 2019/1/14.
//  Copyright © 2019年 Mephsito. All rights reserved.
//

#import "PictureCell.h"
#import "PictureModel.h"


@interface PictureCell ()

@property (nonatomic, strong) UILabel *titleL;
@property (nonatomic, strong) UILabel *nameL;
@property (nonatomic, strong) UILabel *locationL;
@property (nonatomic, strong) UIImageView *iconV;
@property (nonatomic, strong) UIView *lineV;

@end

@implementation PictureCell

-(instancetype)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier {
    
    self = [super initWithStyle:style reuseIdentifier:reuseIdentifier];
    if (self) {
        
        self.selectionStyle = UITableViewCellSelectionStyleNone;
        self.backgroundColor = [UIColor whiteColor];
        [self creatSubView];
        
    }
    return self;
}

#pragma mark  - 协议方法

+ (CGFloat)tableView:(UITableView *)tableView rowHeightForObject:(PictureModel *)object {
    return 120;
}

- (void)cellBindModel:(PictureModel *)model {
    self.nameL.text = [NSString stringWithFormat:@"index : %@", model.index];
}

#pragma mark  -

- (void)creatSubView {
    
    [self.contentView addSubview:self.titleL];
    [self.contentView addSubview:self.nameL];
    [self.contentView addSubview:self.locationL];
    [self.contentView addSubview:self.iconV];
    [self.contentView addSubview:self.lineV];
    
    self.iconV.image = [UIImage imageWithColor:ColorYellow];
    
    [self layoutPageSubViews];
}


- (void)layoutPageSubViews {
    
    self.titleL.sd_layout
    .leftSpaceToView(self.contentView, XZSpace)
    .topSpaceToView(self.contentView, XZLittleSpace)
    .heightIs(20);
    [self.titleL setSingleLineAutoResizeWithMaxWidth:300];
    
    self.nameL.sd_layout
    .leftSpaceToView(self.contentView, XZSpace)
    .topSpaceToView(self.titleL, XZLittleSpace)
    .heightIs(20);
    [self.nameL setSingleLineAutoResizeWithMaxWidth:300];
    
    self.locationL.sd_layout
    .leftSpaceToView(self.contentView, XZSpace)
    .topSpaceToView(self.nameL, XZLittleSpace)
    .heightIs(20);
    [self.locationL setSingleLineAutoResizeWithMaxWidth:300];
    
    self.iconV.sd_layout
    .leftSpaceToView(self.titleL, 30)
    .topEqualToView(self.titleL)
    .heightRatioToView(self.contentView, 0.8)
    .widthEqualToHeight();
    
    self.lineV.sd_layout
    .leftEqualToView(self.contentView)
    .rightEqualToView(self.contentView)
    .bottomEqualToView(self.contentView)
    .heightIs(1);
    
}

#pragma mark  - getter and setter

LazyLoadLabel(titleL, @"第一种Cell", BaseTitleFont, ColorTitle)
LazyLoadLabel(nameL, @"poorkane", BaseTitleFont, ColorTitle)
LazyLoadLabel(locationL, @"Way out there", BaseTitleFont, ColorTitle)
LazyLoadImageView(iconV, @"");

- (UIView *)lineV{
    if (_lineV == nil) {
        _lineV = [UIView new];
        _lineV.backgroundColor = ColorLightLine;
    }
    return _lineV;
}

@end

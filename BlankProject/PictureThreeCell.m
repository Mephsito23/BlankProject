//
//  PictureThreeCell.m
//  BlankProject
//
//  Created by mac on 2019/1/14.
//  Copyright © 2019年 Mephsito. All rights reserved.
//

#import "PictureThreeCell.h"
#import "PictureThreeModel.h"

@interface PictureThreeCell ()

@property (nonatomic, strong) UILabel *indexL;
@property (nonatomic, strong) UIImageView *oneV;
@property (nonatomic, strong) UIImageView *twoV;
@property (nonatomic, strong) UIImageView *threeV;
@property (nonatomic, strong) UIView *lineV;

@end

@implementation PictureThreeCell

-(instancetype)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier {
    
    self = [super initWithStyle:style reuseIdentifier:reuseIdentifier];
    if (self) {
        
        self.selectionStyle = UITableViewCellSelectionStyleNone;
        self.backgroundColor = [UIColor whiteColor];
        [self creatSubView];
        
    }
    return self;
}

#pragma mark  - BindViewModelProtocol方法
+ (CGFloat)tableView:(UITableView *)tableView rowHeightForObject:(PictureThreeModel *)object {
    return 250.0f;
}

- (void)cellBindModel:(PictureThreeModel *)model {
    self.indexL.text = [NSString stringWithFormat:@"第三种Cell index: %@", model.index];
    
}
#pragma mark  -

- (void)creatSubView {
    
    [self.contentView addSubview:self.indexL];
    [self.contentView addSubview:self.oneV];
    [self.contentView addSubview:self.twoV];
    [self.contentView addSubview:self.threeV];
    [self.contentView addSubview:self.lineV];
    
    self.oneV.image = [UIImage imageWithColor:UIColor.redColor];
    self.twoV.image = [UIImage imageWithColor:UIColor.blueColor];
    self.threeV.image = [UIImage imageWithColor:UIColor.grayColor];
    
    [self layoutPageSubViews];
}


- (void)layoutPageSubViews {
    
    self.indexL.sd_layout
    .leftSpaceToView(self.contentView, XZSpace)
    .topSpaceToView(self.contentView, XZSpace)
    .heightIs(20);
    [self.indexL setSingleLineAutoResizeWithMaxWidth:300];
    
    self.oneV.sd_layout
    .leftSpaceToView(self.contentView, XZSpace)
    .topSpaceToView(self.indexL, XZLittleSpace)
    .heightRatioToView(self.contentView, 0.8)
    .widthEqualToHeight();
    
    self.twoV.sd_layout
    .leftSpaceToView(self.oneV, XZSpace)
    .topEqualToView(self.oneV)
    .heightRatioToView(self.contentView, 0.38)
    .widthEqualToHeight();
    
    self.threeV.sd_layout
    .leftSpaceToView(self.oneV, XZSpace)
    .topSpaceToView(self.twoV, XZLittleSpace)
    .heightRatioToView(self.contentView, 0.38)
    .widthEqualToHeight();
    
    self.lineV.sd_layout
    .leftEqualToView(self.contentView)
    .rightEqualToView(self.contentView)
    .bottomEqualToView(self.contentView)
    .heightIs(1);
    
}

#pragma mark  - getter and setter

LazyLoadLabel(indexL, @"index:", BaseTitleFont, ColorTitle)
LazyLoadImageView(oneV, @"")
LazyLoadImageView(twoV, @"")
LazyLoadImageView(threeV, @"")

- (UIView *)lineV{
    if (_lineV == nil) {
        _lineV = [UIView new];
        _lineV.backgroundColor = ColorLightLine;
    }
    return _lineV;
}


@end

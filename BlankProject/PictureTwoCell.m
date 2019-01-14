//
//  PictureTwoCell.m
//  BlankProject
//
//  Created by mac on 2019/1/14.
//  Copyright © 2019年 Mephsito. All rights reserved.
//

#import "PictureTwoCell.h"
#import "PictureTwoModel.h"


@interface PictureTwoCell ()

@property (nonatomic, strong) UILabel *titleL;
@property (nonatomic, strong) UILabel *indexL;
@property (nonatomic, strong) UIImageView *iconV;
@property (nonatomic, strong) UIView *lineV;

@end

@implementation PictureTwoCell

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

+ (CGFloat)tableView:(UITableView *)tableView rowHeightForObject:(id)object {
    return 200;
}

- (void)cellBindModel:(PictureTwoModel *)model {
    self.indexL.text = [NSString stringWithFormat:@"index : %@", model.index];
}

#pragma mark  -


- (void)creatSubView {
    
    [self.contentView addSubview:self.titleL];
    [self.contentView addSubview:self.indexL];
    [self.contentView addSubview:self.iconV];
    [self.contentView addSubview:self.lineV];
    
    self.iconV.image = [UIImage imageWithColor:[UIColor flatGreenColor]];

    [self layoutPageSubViews];
}


- (void)layoutPageSubViews {
    
    self.titleL.sd_layout
    .leftSpaceToView(self.contentView, XZSpace)
    .topSpaceToView(self.contentView, XZLittleSpace)
    .heightIs(20);
    [self.titleL setSingleLineAutoResizeWithMaxWidth:300];
    
    self.indexL.sd_layout
    .leftSpaceToView(self.contentView, XZSpace)
    .topSpaceToView(self.titleL, XZLittleSpace)
    .heightIs(20);
    [self.indexL setSingleLineAutoResizeWithMaxWidth:300];

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

LazyLoadLabel(titleL, @"第二种Cell", BaseTitleFont, ColorTitle)
LazyLoadLabel(indexL, @"Index:", BaseTitleFont, ColorTitle)
LazyLoadImageView(iconV, @"")

- (UIView *)lineV{
    if (_lineV == nil) {
        _lineV = [UIView new];
        _lineV.backgroundColor = ColorLightLine;
    }
    return _lineV;
}


@end

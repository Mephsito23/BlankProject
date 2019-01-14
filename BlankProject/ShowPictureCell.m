//
//  ShowPictureCell.m
//  BlankProject
//
//  Created by mac on 2019/1/14.
//  Copyright © 2019年 Mephsito. All rights reserved.
//

#import "ShowPictureCell.h"
#import "ShowPictureModel.h"


@interface ShowPictureCell ()

@property (nonatomic, strong) UIImageView *userIconV;
@property (nonatomic, strong) UILabel *nameL;
@property (nonatomic, strong) UILabel *locationL;
@property (nonatomic, strong) UIImageView *iconV;
@property (nonatomic, strong) UIView *lineV;


@end

@implementation ShowPictureCell

-(instancetype)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier {
    
    self = [super initWithStyle:style reuseIdentifier:reuseIdentifier];
    if (self) {
        
        self.selectionStyle = UITableViewCellSelectionStyleNone;
        self.backgroundColor = [UIColor whiteColor];
        [self creatSubView];
        
    }
    return self;
}

#pragma mark  - BindViewModelProtocol

+ (CGFloat)tableView:(UITableView *)tableView rowHeightForObject:(id)object {
    return 430;
}

- (void)cellBindModel:(ShowPictureModel *)model {
    [self.userIconV sd_setImageWithURL:[NSURL URLWithString:model.userProfileURL]];
    [self.iconV sd_setImageWithURL:[NSURL URLWithString:model.imageURL]];
    self.nameL.text = model.userName;
    self.locationL.text = model.address ?:@"暂无地址";
}

#pragma mark  -

- (void)creatSubView {
    
    [self.contentView addSubview:self.userIconV];
    [self.contentView addSubview:self.nameL];
    [self.contentView addSubview:self.locationL];
    [self.contentView addSubview:self.iconV];
    [self.contentView addSubview:self.lineV];
    [self layoutPageSubViews];
    
    self.userIconV.image = [UIImage imageWithColor:UIColor.orangeColor];
    self.iconV.image = [UIImage imageWithColor:UIColor.flatMintColor];
}


- (void)layoutPageSubViews {
    
    CGFloat space = XZSpace;
    
    self.userIconV.sd_layout
    .leftSpaceToView(self.contentView, space)
    .topSpaceToView(self.contentView, space)
    .widthIs(40)
    .heightEqualToWidth();
    
    self.nameL.sd_layout
    .leftSpaceToView(self.userIconV, space)
    .topEqualToView(self.userIconV)
    .heightIs(20);
    [self.nameL setSingleLineAutoResizeWithMaxWidth:300];
    
    self.locationL.sd_layout
    .leftEqualToView(self.nameL)
    .topSpaceToView(self.nameL, XZLittleSpace)
    .heightIs(14);
    [self.locationL setSingleLineAutoResizeWithMaxWidth:300];
    
    self.iconV.sd_layout
    .leftEqualToView(self.userIconV)
    .rightSpaceToView(self.contentView, XZSpace)
    .topSpaceToView(self.locationL, XZSpace)
    .heightEqualToWidth();
    
    self.lineV.sd_layout
    .leftEqualToView(self.contentView)
    .rightEqualToView(self.contentView)
    .bottomEqualToView(self.contentView)
    .heightIs(1);
}

#pragma mark  - getter and setter

LazyLoadImageView(userIconV, @"")
LazyLoadLabel(nameL, @"userName", BaseTitleFont, ColorTitle)
LazyLoadLabel(locationL, @"location", contentFont, ColorGray)
LazyLoadImageView(iconV, @"")

- (UIView *)lineV{
    if (_lineV == nil) {
        _lineV = [UIView new];
        _lineV.backgroundColor = ColorLightLine;
    }
    return _lineV;
}

@end

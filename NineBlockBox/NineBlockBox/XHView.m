//
//  XHView.m
//  NineBlockBox
//
//  Created by snow on 16/12/24.
//  Copyright © 2016年 snow. All rights reserved.
//

#import "XHView.h"

@interface XHView ()
@property (nonatomic, strong) UIImageView *iconImgView;
@property (nonatomic, strong) UILabel *nameLabel;

@end

@implementation XHView

//init方法内部会自动调用initWithFrame:方法
- (instancetype)initWithFrame:(CGRect)frame {
    self = [super initWithFrame:frame];
    if (self) {
        self.backgroundColor = [UIColor redColor];
    }
    return self;
}

- (UIImageView *)iconImgView {
    if (!_iconImgView) {
        _iconImgView = [[UIImageView alloc]init];
    }
    [self addSubview:_iconImgView];
    return _iconImgView;
}

- (UILabel *)nameLabel {
    if (!_nameLabel) {
       _nameLabel = [[UILabel alloc]init];
       _nameLabel.font = [UIFont systemFontOfSize:11];
       _nameLabel.textAlignment = NSTextAlignmentCenter;
    }
    [self addSubview:_nameLabel];
    return _nameLabel;
}

/**
 * 这个方法专门用来布局子控件，一般在这里设置子控件的frame
 * 当控件本身的尺寸发生改变的时候，系统会自动调用这个方法
 *
 */
- (void)layoutSubviews {
    CGFloat shopViewWidth = self.frame.size.width;
    CGFloat shopViewHeight = self.frame.size.height;
    self.iconImgView.frame= CGRectMake(0, 0, shopViewWidth, shopViewWidth);
    self.nameLabel.frame =CGRectMake(0, shopViewWidth, shopViewWidth, shopViewHeight-shopViewWidth);
}

- (void)setShop:(Shop *)shop {
    _shop = shop;
    self.nameLabel.text = shop.name;
    self.iconImgView.image = [UIImage imageNamed:shop.icon];
}
@end

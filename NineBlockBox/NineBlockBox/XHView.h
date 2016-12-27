//
//  XHView.h
//  NineBlockBox
//
//  Created by snow on 16/12/24.
//  Copyright © 2016年 snow. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "Shop.h"

@interface XHView : UIView

- (instancetype)initWithFrame:(CGRect)frame;
//商品属性
@property (nonatomic, strong) Shop *shop;
@end

//
//  Shop.h
//  NineBlockBox
//
//  Created by snow on 16/12/24.
//  Copyright © 2016年 snow. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface Shop : NSObject
@property (nonatomic, copy) NSString *name;
@property (nonatomic, copy) NSString *icon;

- (instancetype)initWithDict:(NSDictionary *)dict;
+ (instancetype)shopWithDict:(NSDictionary *)dict;
@end

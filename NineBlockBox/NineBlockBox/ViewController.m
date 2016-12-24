//
//  ViewController.m
//  NineBlockBox
//
//  Created by snow on 16/12/24.
//  Copyright © 2016年 snow. All rights reserved.
//

#import "ViewController.h"

@interface ViewController ()
@property (weak, nonatomic) IBOutlet UIView *shopsView;
@property (weak, nonatomic) IBOutlet UIButton *removeButton;
@property (weak, nonatomic) IBOutlet UIButton *addButton;
@property (weak, nonatomic) IBOutlet UILabel *HUDLabel;
- (IBAction)add:(UIButton *)sender;
- (IBAction)remove:(UIButton *)sender;
@property (nonatomic, strong) NSArray *shops;

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    self.removeButton.enabled = NO;
    self.HUDLabel.hidden = YES;
}


- (IBAction)add:(UIButton *)sender {
    CGFloat shopViewWidth = 50;
    CGFloat shopViewHeight = 70;
    NSInteger numberOfItem = 3;
    CGFloat colMagin = (self.shopsView.frame.size.width - numberOfItem * shopViewWidth) / (numberOfItem - 1);
    CGFloat rowMagin = 10;
    
    NSUInteger index = self.shopsView.subviews.count;
    
    NSUInteger row = index / numberOfItem;
    NSUInteger colum = index % numberOfItem;
    
    UIView *shopView = [[UIView alloc]initWithFrame:CGRectMake(colum * (shopViewWidth + colMagin), row * (shopViewHeight + rowMagin), shopViewWidth, shopViewHeight)];
    [self.shopsView addSubview:shopView];
    
    NSString *file = [[NSBundle mainBundle]pathForResource:@"shops" ofType: @"plist"];
    self.shops = [NSArray arrayWithContentsOfFile:file];
    NSDictionary *shop = self.shops[index];
    
    
    UIImageView *iconImageView = [[UIImageView alloc]initWithFrame:CGRectMake(0, 0, shopViewWidth, shopViewWidth)];
    iconImageView.image = [UIImage imageNamed:shop[@"icon"]];
    [shopView addSubview:iconImageView];
    
    UILabel *label = [[UILabel alloc]initWithFrame:CGRectMake(0, shopViewWidth, shopViewWidth, 20)];
    label.text = shop[@"name"];
    label.font = [UIFont systemFontOfSize:11];
    label.textAlignment = NSTextAlignmentCenter;
    [shopView addSubview:label];
    [self checkState];
}

- (IBAction)remove:(UIButton *)sender {
    [self.shopsView.subviews.lastObject removeFromSuperview];
    [self checkState];
}

- (void)checkState {
    self.addButton.enabled = self.shopsView.subviews.count < self.shops.count;
    self.removeButton.enabled = self.shopsView.subviews.count != 0;
    if (!self.addButton.enabled) {
        self.HUDLabel.hidden = NO;
        self.HUDLabel.text = @"已经添加满了";
        [self performSelector:@selector(hideHUD) withObject:nil afterDelay:1.0];
    }
    if (!self.removeButton.enabled) {
        self.HUDLabel.hidden = NO;
        self.HUDLabel.text = @"已经删除完了";
        [self performSelector:@selector(hideHUD) withObject:nil afterDelay:1.0];
    }
}

- (void)hideHUD {
    self.HUDLabel.hidden = YES;
}

@end

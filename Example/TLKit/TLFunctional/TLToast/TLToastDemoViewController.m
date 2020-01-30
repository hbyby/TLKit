//
//  TLToastDemoViewController.m
//  TLKit_Example
//
//  Created by 李伯坤 on 2020/1/30.
//  Copyright © 2020 libokun. All rights reserved.
//

#import "TLToastDemoViewController.h"
#import "TLMenuItemCell.h"
#import "TLMenuHeaderView.h"

@interface TLToastDemoViewController ()

@end

@implementation TLToastDemoViewController

- (void)loadView
{
    [super loadView];
    [self setTitle:@"TLToast"];
    
    [self.view setBackgroundColor:RGBColor(240, 239, 245)];
    
    [self reloadTestMenu];
}

- (void)reloadTestMenu
{
    self.clear();
    
    NSInteger sectionType = 0;
    self.addSection(sectionType).sectionInsets(UIEdgeInsetsMake(0, 0, 10, 0));
    self.setHeader([TLMenuHeaderView class]).toSection(sectionType).withDataModel(@"基础样式");
    self.addCell([TLMenuItemCell class]).toSection(sectionType).withDataModel(@"成功").selectedAction(^ (NSString *title) {
        [TLToast showSuccessHint:@"修改成功"];
    });
    self.addCell([TLMenuItemCell class]).toSection(sectionType).withDataModel(@"失败").selectedAction(^ (NSString *title) {
        [TLToast showErrorHint:@"请求失败"];
    });
    self.addCell([TLMenuItemCell class]).toSection(sectionType).withDataModel(@"警告").selectedAction(^ (NSString *title) {
        [TLToast showInfoHint:@"无有效内容"];
    });
    self.addCell([TLMenuItemCell class]).toSection(sectionType).withDataModel(@"加载中...").selectedAction(^ (NSString *title) {
        [TLToast showLoading:@"加载中..."];
        dispatch_after(dispatch_time(DISPATCH_TIME_NOW, (int64_t)(2 * NSEC_PER_SEC)), dispatch_get_main_queue(), ^{
            [TLToast hiddenLoading];
        });
    });
    self.addCell([TLMenuItemCell class]).toSection(sectionType).withDataModel(@"Loading").selectedAction(^ (NSString *title) {
        [TLToast showLoading:nil];
        dispatch_after(dispatch_time(DISPATCH_TIME_NOW, (int64_t)(2 * NSEC_PER_SEC)), dispatch_get_main_queue(), ^{
            [TLToast hiddenLoading];
        });
    });
    self.addCell([TLMenuItemCell class]).toSection(sectionType).withDataModel(@"隐藏").selectedAction(^ (NSString *title) {
        [TLToast hiddenLoading];
    });
}

@end

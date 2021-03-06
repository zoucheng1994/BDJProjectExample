//
//  BDJRecommendTagActivity.m
//  百思不得姐
//
//  Created by 付星 on 2016/11/16.
//    Copyright © 2016年 yizzuide. All rights reserved.
//

#import "BDJRecommendTagActivity.h"
#import "BDJRecommendTagEventHandlerPort.h"
#import "BDJRCTagCell.h"
#import <SVProgressHUD.h>
#import "BDJRCTagRenderItem.h"

#define EventHandler  XFConvertPresenterToType(id<BDJRecommendTagEventHandlerPort>)

@interface BDJRecommendTagActivity ()

@end

@implementation BDJRecommendTagActivity

static NSString * const Identifier = @"RCTagCell";

- (void)viewDidLoad
{
    [super viewDidLoad];
    
    [self config];
    // 初始化视图
    [self setUpViews];
    // 绑定视图数据
    [self bindViewData];
}

#pragma mark - 初始化
- (void)config
{
    self.tableView.backgroundColor = UIColorFromRGB(R_Color_GlobalBkg);
    self.tableView.separatorStyle = UITableViewCellSeparatorStyleNone;
    self.tableView.rowHeight = 70.f;
    self.tableView.dataSource = self;
    self.tableView.delegate = self;
    [self.tableView registerNib:[UINib nibWithNibName:@"BDJRCTagCell" bundle:nil] forCellReuseIdentifier:Identifier];
}
- (void)setUpViews {
    
}

- (void)bindViewData {
    // 双向数据绑定
    //XF_$_(self.textField, text, EventHandler, text)
    // 绑定事件层按钮命令
    //XF_C_(self.btn, EventHandler, Command)
    
    [SVProgressHUD show];
    XF_Define_Weak
    [RACObserve(self.eventHandler, expressPack) subscribeNext:^(id x) {
        XF_Define_Strong
        if (x) {
            [SVProgressHUD dismiss];
            [self.tableView reloadData];
        }
    }];
}

#pragma mark - TableView DataSource
- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    return self.eventHandler.expressPack.expressPieces.count;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    BDJRCTagCell *cell = [tableView dequeueReusableCellWithIdentifier:Identifier];
    BDJRCTagRenderItem *renderItem = self.eventHandler.expressPack.expressPieces[indexPath.row].renderItem;
    cell.renderItem = renderItem;
    return cell;
}

#pragma mark - UIControlDelegate




#pragma mark - Getter

- (void)xfLego_viewWillPopOrDismiss
{
    [SVProgressHUD popActivity];
}

- (void)dealloc
{
    XF_Debug_M();
}
@end

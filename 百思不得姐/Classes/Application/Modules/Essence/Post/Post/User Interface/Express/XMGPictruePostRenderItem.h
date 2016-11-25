//
//  XMGPictruePostRenderItem.h
//  百思不得姐
//
//  Created by 付星 on 2016/11/23.
//  Copyright © 2016年 yizzuide. All rights reserved.
//

#import "XMGPostRenderItem.h"

@interface XMGPictruePostRenderItem : XMGPostRenderItem

@property (nonatomic, assign) NSInteger width;
@property (nonatomic, assign) NSInteger height;
@property (nonatomic, strong) NSURL *url;

// 图下载进度
@property (nonatomic, assign) CGFloat loadProgress;
@end

//
//  PreView.m
//  Randomer
//
//  Created by 王子轩 on 16/4/9.
//  Copyright © 2016年 com.wzx. All rights reserved.
//

#import "PreView.h"

@implementation PreView

- (void)updateConstraints
{
    WS(weakSelf)
    [self.preImgView mas_makeConstraints:^(MASConstraintMaker *make) {
        
        make.edges.equalTo(weakSelf).insets(UIEdgeInsetsMake(0, 0, 0, 0));
        
    }];
    [super updateConstraints];
}

- (void)wzx_setupViews {
    [self addSubview:self.preImgView];
    [self setNeedsUpdateConstraints];
    [self updateConstraintsIfNeeded];
}

- (UIImageView *)preImgView {
    if (!_preImgView) {
        _preImgView = [[UIImageView alloc]initWithImage:[UIImage imageWithContentsOfFile:FilePATH(@"randomer", @"png")]];
    }
    return _preImgView;
}
@end

//
//  GLHeaderView.m
//  LoadMore
//
//  Created by IOS开发 on 12-7-25.
//  Copyright (c) 2012年 __MyCompanyName__. All rights reserved.
//

#import "GLHeaderView.h"

@implementation GLHeaderView

@synthesize updateTimeLabel;
@synthesize loadImage;
@synthesize statusLabel;

- (id)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    if (self) {
        loadImage  = [[UIImageView alloc] initWithImage:[UIImage imageNamed:@"redArrow.png"]];
        loadImage.frame  = CGRectMake(20, 0, 32, 60);
        
        [self addSubview:loadImage];
        
        statusLabel  =  [[UILabel alloc] init];
        statusLabel.frame = CGRectMake(60, 5, 200, 20);
        statusLabel.font = [UIFont systemFontOfSize:12];
        statusLabel.text = @"下拉加载最近数据……";
        [self addSubview:statusLabel];

        updateTimeLabel = [[UILabel alloc] init];
        updateTimeLabel.frame = CGRectMake(60, 30, 250, 20);
        updateTimeLabel.font = [UIFont systemFontOfSize:12];

        updateTimeLabel.text = @"最后更新于：2012-12-12";
        [self addSubview:updateTimeLabel];
    }
    return self;
}

/*
// Only override drawRect: if you perform custom drawing.
// An empty implementation adversely affects performance during animation.
- (void)drawRect:(CGRect)rect
{
    // Drawing code
}
*/

@end

//
//  GLHeaderView.h
//  LoadMore
//  用于展现头部的文案和信息等
//  Created by IOS开发 on 12-7-25.
//  Copyright (c) 2012年 __MyCompanyName__. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface GLHeaderViewController : UIViewController

@property (weak, nonatomic) IBOutlet UIImageView *loadImageView;

@property (weak, nonatomic) IBOutlet UILabel *tipsMessage;

@property (weak, nonatomic) IBOutlet UILabel *updateTime;

@end

//
//  GLTableViewController.h
//  LoadMore
//
//  Created by IOS开发 on 12-7-25.
//  Copyright (c) 2012年 __MyCompanyName__. All rights reserved.
//

#import <UIKit/UIKit.h>
#import <QuartzCore/QuartzCore.h>

#import "GLHeaderView.h"
@interface GLTableViewController : UITableViewController

@property (strong,atomic) NSMutableArray *dataList;

@property (strong,atomic) GLHeaderView *headerView;

@end

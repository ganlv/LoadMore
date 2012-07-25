//
//  GLTableViewController.h
//  LoadMore
//
//  Created by IOS开发 on 12-7-25.
//  Copyright (c) 2012年 __MyCompanyName__. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface GLTableViewController : UITableViewController<UITableViewDelegate,UITableViewDataSource>

@property (strong,atomic) NSMutableArray *dataList;

@end

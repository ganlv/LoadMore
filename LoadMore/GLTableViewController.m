//
//  GLTableViewController.m
//  LoadMore
//
//  Created by IOS开发 on 12-7-25.
//  Copyright (c) 2012年 __MyCompanyName__. All rights reserved.
//

#import "GLTableViewController.h"

@interface GLTableViewController ()

@end

@implementation GLTableViewController
@synthesize dataList;
@synthesize headerView;

- (id)initWithStyle:(UITableViewStyle)style
{
    self = [super initWithStyle:style];
    if (self) {
        // Custom initialization
    }
    return self;
}

- (void)viewDidLoad
{
    [super viewDidLoad];
    self.tableView.delegate = self;
    self.tableView.dataSource = self;
    
    NSArray *array = [[NSArray alloc] initWithObjects:@"xiaoshi",@"xiaoshi",@"xiaoshi",@"xiaoshi",@"xiaoshi",@"xiaoshi",@"xiaoshi",@"xiaoshi",@"xiaoshi",@"xiaoshi",@"xiaoshi",@"xiaoshi",@"xiaoshi",@"xiaoshi",@"xiaoshi", nil];
    dataList = [[NSMutableArray alloc] init];
    [dataList  addObjectsFromArray:array];
    self.title = @"Load more";
    
    headerView = [[GLHeaderView alloc] initWithFrame:CGRectMake(0, -60,320, 60)];
    [self.view addSubview:headerView];
    
    // Uncomment the following line to preserve selection between presentations.
    // self.clearsSelectionOnViewWillAppear = NO;
 
    // Uncomment the following line to display an Edit button in the navigation bar for this view controller.
    // self.navigationItem.rightBarButtonItem = self.editButtonItem;
}

- (void)viewDidUnload
{
    [super viewDidUnload];
    dataList = nil;
    // Release any retained subviews of the main view.
    // e.g. self.myOutlet = nil;
}

- (BOOL)shouldAutorotateToInterfaceOrientation:(UIInterfaceOrientation)interfaceOrientation
{
    return (interfaceOrientation == UIInterfaceOrientationPortrait);
}

#pragma mark - Table view data source

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView
{
    // Return the number of sections.
    return 1;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    // Return the number of rows in the section.
    return [dataList count];
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    static NSString *CellIdentifier = @"Cell";
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:CellIdentifier];
    
    if (!cell) {
        cell = [[UITableViewCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:CellIdentifier];
    }
    cell.textLabel.text = [dataList objectAtIndex:indexPath.row];
    return cell;
}

/*
// Override to support conditional editing of the table view.
- (BOOL)tableView:(UITableView *)tableView canEditRowAtIndexPath:(NSIndexPath *)indexPath
{
    // Return NO if you do not want the specified item to be editable.
    return YES;
}
*/

/*
// Override to support editing the table view.
- (void)tableView:(UITableView *)tableView commitEditingStyle:(UITableViewCellEditingStyle)editingStyle forRowAtIndexPath:(NSIndexPath *)indexPath
{
    if (editingStyle == UITableViewCellEditingStyleDelete) {
        // Delete the row from the data source
        [tableView deleteRowsAtIndexPaths:[NSArray arrayWithObject:indexPath] withRowAnimation:UITableViewRowAnimationFade];
    }   
    else if (editingStyle == UITableViewCellEditingStyleInsert) {
        // Create a new instance of the appropriate class, insert it into the array, and add a new row to the table view
    }   
}
*/

/*
// Override to support rearranging the table view.
- (void)tableView:(UITableView *)tableView moveRowAtIndexPath:(NSIndexPath *)fromIndexPath toIndexPath:(NSIndexPath *)toIndexPath
{
}
*/

/*
// Override to support conditional rearranging of the table view.
- (BOOL)tableView:(UITableView *)tableView canMoveRowAtIndexPath:(NSIndexPath *)indexPath
{
    // Return NO if you do not want the item to be re-orderable.
    return YES;
}
*/

#pragma mark - Table view delegate

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath
{
    //do nothing
}

-(void)scrollViewWillEndDragging:(UIScrollView *)scrollView withVelocity:(CGPoint)velocity targetContentOffset:(CGPoint *)targetContentOffset{
    //do fresh
    NSLog(@"some thing dragging,%f",scrollView.contentOffset.y);
    NSDateFormatter *dateFormatter = [[NSDateFormatter alloc] init];
    [dateFormatter setDateStyle:NSDateFormatterMediumStyle];
    [dateFormatter setTimeStyle:NSDateFormatterMediumStyle];
    [dateFormatter setDateFormat:@"yyyy-MM-dd hh:mm:ss"];
    
    NSString *str =[dateFormatter stringFromDate:[NSDate date]];
    NSString *updateTime = [NSString stringWithFormat:@"最后更新于：%@",str];
    headerView.updateTimeLabel.text= updateTime;
    
    [UIView animateWithDuration:0 animations:^{
        headerView.loadImage.transform = CGAffineTransformMakeRotation(0);
    }];
    
    
    NSArray *array = [[NSArray alloc] initWithObjects:@"痴心绝对",@"痴心绝对",@"痴心绝对",@"痴心绝对",@"痴心绝对", nil];
    dataList = [[NSMutableArray alloc] init];
    [dataList  addObjectsFromArray:array];
    [self.tableView reloadData];
}

-(void)scrollViewDidScroll:(UIScrollView *)scrollView{
    //scroll swith view
    NSLog(@"scroll view,%f",scrollView.contentOffset.y);
    
    if(scrollView.contentOffset.y < -65.0){
        headerView.statusLabel.text = @"松开即可刷新";
        [UIView animateWithDuration:0.2 animations:^{
            headerView.loadImage.transform = CGAffineTransformMakeRotation(M_PI);
        }];
    }
}

@end

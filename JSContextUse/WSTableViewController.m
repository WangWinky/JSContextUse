//
//  WSTableViewController.m
//  JSContextUse
//
//  Created by wangshanshan on 2018/4/5.
//  Copyright © 2018年 ws. All rights reserved.
//

#import "WSTableViewController.h"
#import "WSWebViewController.h"

@interface WSTableViewController ()

@end

@implementation WSTableViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    // Uncomment the following line to preserve selection between presentations.
    // self.clearsSelectionOnViewWillAppear = NO;
    
    // Uncomment the following line to display an Edit button in the navigation bar for this view controller.
    // self.navigationItem.rightBarButtonItem = self.editButtonItem;
    
    self.tableView.tableFooterView = [[UIView alloc]init];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

#pragma mark - Table view data source

-(void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath{
    
    NSString *fileName = [NSString stringWithFormat:@"WebViewTest_0%li",indexPath.row+1];
    WSWebViewController *webViewController = [[WSWebViewController alloc]initWithFileName:fileName];
    [self.navigationController pushViewController:webViewController animated:YES];
    
}





@end

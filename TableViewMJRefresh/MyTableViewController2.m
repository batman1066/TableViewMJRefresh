//
//  MyTableViewController2.m
//  TableViewHeaderFooter
//
//  Created by yang ming on 2017/1/19.
//  Copyright © 2017年 yang ming. All rights reserved.
//

#import "MyTableViewController2.h"
#import "MJRefresh.h"
@interface MyTableViewController2 ()

@end

@implementation MyTableViewController2


-(NSMutableArray *)dataList{
    if(_dataList==nil){
        _dataList=[NSMutableArray array];
        for(int i=0;i<5;i++){
            NSString *number=[NSString stringWithFormat:@"%d",arc4random_uniform(100000)];
            [_dataList addObject:number];
        }
        
    }
    return _dataList;
}
-(void)viewDidLoad{
    [super viewDidLoad];
    
    [self.navigationController.navigationBar setBackgroundColor:[UIColor clearColor]];
    self.tableView.mj_header=[MJRefreshNormalHeader headerWithRefreshingBlock:^{
        dispatch_after(dispatch_time(DISPATCH_TIME_NOW, (int64_t)(1.0 * NSEC_PER_SEC)), dispatch_get_main_queue(), ^{
            [self loadNewData];
        });
    }];
    self.tableView.mj_header.automaticallyChangeAlpha=YES;
    self.tableView.mj_footer=[MJRefreshBackNormalFooter footerWithRefreshingTarget:self refreshingAction:@selector(loadMoreData)];
    
    self.tableView.contentInset=UIEdgeInsetsMake(0, 0, 30, 0);
    self.tableView.mj_footer.ignoredScrollViewContentInsetBottom=30;
    
    
    
    UISearchBar *searchBar=[[UISearchBar alloc] initWithFrame:CGRectMake(0, 0, 320, 40)];
    self.tableView.tableHeaderView=searchBar;
    UIView *footerView=[UIView new ];
    footerView.backgroundColor=[UIColor clearColor];
    self.tableView.tableFooterView=footerView;
    
    
    
}
- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    return self.dataList.count;
}


- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    static NSString *cellId=@"cell";
    UITableViewCell *uiTableViewCell=[tableView dequeueReusableCellWithIdentifier:cellId];
    if(uiTableViewCell==nil){
        uiTableViewCell=[[UITableViewCell alloc] initWithStyle:UITableViewCellStyleSubtitle reuseIdentifier:cellId];
    }

    uiTableViewCell.textLabel.text=self.dataList[indexPath.row];
    
    return uiTableViewCell;
}
-(void)loadNewData{
    for(int i=0;i<5;i++){
        NSString *number=[NSString stringWithFormat:@"%d--",arc4random_uniform(100000)];
        [_dataList insertObject:number atIndex:0];
    }
    [self.tableView reloadData];
    [self.tableView.mj_header endRefreshing];
    
}
-(void)loadMoreData{
    for(int i=0;i<5;i++){
        NSString *number=[NSString stringWithFormat:@"%d--",arc4random_uniform(100000)];
        [_dataList addObject:number];
    }
    [self.tableView reloadData];
    [self.tableView.mj_footer endRefreshing];
}
@end

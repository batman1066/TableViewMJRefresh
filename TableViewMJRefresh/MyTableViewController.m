//
//  MyTableViewController.m
//  TableViewHeaderFooter
//
//  Created by yang ming on 2017/1/19.
//  Copyright © 2017年 yang ming. All rights reserved.
//

#import "MyTableViewController.h"

@interface MyTableViewController ()
@property (nonatomic,strong) NSMutableArray *dataList;
@end

@implementation MyTableViewController

-(NSMutableArray *)dataList{
    if(_dataList==nil){
        _dataList=[NSMutableArray array];
        for(int i=0;i<5;i++){
            NSString *number=[NSString stringWithFormat:@"%d",arc4random_uniform(1100000)];
            [_dataList addObject:number];
        }
        
    }
    return _dataList;
}
- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    return self.dataList.count;
}


- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    static NSString *cellID=@"cell";
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:cellID forIndexPath:indexPath];
    if(cell==nil){
        cell = [[UITableViewCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:cellID];
    }
    cell.textLabel.text=@"323";//self.dataList[indexPath.row];
    
    return cell;
}


@end

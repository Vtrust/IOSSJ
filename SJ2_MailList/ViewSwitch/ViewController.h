//
//  ViewController.h
//  ViewSwitch
//
//  Created by vtrust on 2018/3/14.
//  Copyright © 2018年 vtrust. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface ViewController : UIViewController<UITableViewDelegate,UITableViewDataSource>


@property(nonatomic,strong)NSDictionary *phoneData;
@property(nonatomic,strong)NSArray *listTeam;
@property(nonatomic,strong)UITableView *tableView;


@end


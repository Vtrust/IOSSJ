//
//  ViewController1.h
//  WeChat
//
//  Created by vtrust on 2018/3/21.
//  Copyright © 2018年 vtrust. All rights reserved.
//

#import <UIKit/UIKit.h>


@interface ViewController1 : UIViewController<UITableViewDelegate, UITableViewDataSource,UISearchBarDelegate,UISearchResultsUpdating>{
    
}

@property(strong,nonatomic)UISearchController *searchController;
@property(nonatomic,strong)NSArray *listTeams;
@property(nonatomic,strong)NSMutableArray *listFilterTeams;

//内容过滤方法
-(void)filterContentForSearchText:(NSString*)searchText scope:(NSUInteger)scope;

@end

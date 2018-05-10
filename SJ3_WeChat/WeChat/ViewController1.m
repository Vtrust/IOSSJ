//
//  ViewController1.m
//  WeChat
//
//  Created by vtrust on 2018/3/21.
//  Copyright © 2018年 vtrust. All rights reserved.
//

#import "ViewController1.h"
#import "Cell1.h"

@interface ViewController1 ()

//@property (nonatomic,strong)NSArray *listTeams;
@property (nonatomic,strong)NSArray *teamNames;
@property (nonatomic,strong)UITableView *tableView;

@end

@implementation ViewController1

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    self.navigationController.navigationBar.barStyle = UIBarStyleBlack;
    self.title = @"微信";
    self.view.backgroundColor = [UIColor redColor];
    NSBundle *bundle = [NSBundle mainBundle];
    NSString *mes1 = [bundle pathForResource:@"mes1" ofType:@"plist"];
    self.listTeams = [[NSArray alloc]initWithContentsOfFile:(mes1)];
    
    self.tableView = [[UITableView alloc] initWithFrame:self.view.frame style:UITableViewStylePlain];

    self.tableView.delegate = self;
    self.tableView.dataSource = self;
    self.tableView.rowHeight = 70;


    
//    [self filterContentForSearchText:@"" scope:-1];
//
//    //实例化UIserachController
//    self.searchController = [[UISearchController alloc]initWithSearchResultsController:nil];
//    self.searchController.searchResultsUpdater = self;
//    self.searchController.dimsBackgroundDuringPresentation = FALSE;
//
//    self.searchController.searchBar.scopeButtonTitles = @[@"中文",@"英文"];
//    self.searchController.searchBar.delegate =self;
//
//    self.tableView.tableHeaderView =self.searchController.searchBar;
//    [self.searchController.searchBar sizeToFit];
    //self.title = @"view1";
    
    [self.view addSubview: self.tableView];
}

//-(void)filterContentForSearchText:(NSString *)searchText scope:(NSUInteger)scope{
//    if([searchText length]==0){
//        self.listTeams = [NSMutableArray arrayWithCapacity:self.listTeams];
//        return;
//    }
//
//    NSPredicate *scopePredicate;
//    NSArray *tempArray;
//
//    switch (scope) {
//        case 0:
//            scopePredicate = [NSPredicate predicateWithFormat:@"SELF.name contains[c] %@",searchText];
//            tempArray = [self.listTeams filteredArrayUsingPredicate:scopePredicate];
//            self.listFilterTeams = [NSMutableArray arrayWithCapacity:tempArray];
//            break;
//        case 1:
//            scopePredicate = [NSPredicate predicateWithFormat:@"SELF.image contains[c] %@",searchText];
//            tempArray = [self.listTeams filteredArrayUsingPredicate:scopePredicate];
//            self.listFilterTeams = [NSMutableArray arrayWithCapacity:tempArray];
//
//        default:
//            self.listFilterTeams = [NSMutableArray arrayWithCapacity:self.listTeams];
//            break;
//    }
//}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

-(NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section{
    return [self.listTeams count];
}

- (nonnull UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath{
//    static NSString *reusableFlag = @"reusableFlag";
//    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:reusableFlag];
//    if(cell == nil){
//        cell = [[UITableViewCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:reusableFlag];
//        NSLog(@"----");
//    }
//    NSDictionary *item=[self.listTeams objectAtIndex:[indexPath row]];
//    cell.textLabel.text = [item objectForKey:@"name"];
//    return  cell;
    Cell1 *cell = [tableView dequeueReusableCellWithIdentifier:@"cell1"];
    if(cell == nil){
        cell = [[Cell1 alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:@"cell1"];
    }
    NSDictionary *item=[self.listTeams objectAtIndex:[indexPath row]];
    NSString *imgPath = [[NSString alloc]initWithFormat:@"%@.jpg",item[@"image"]];
    cell.img.image = [UIImage imageNamed:imgPath];
    cell.name.text = item[@"name"];
    cell.msg.text = item[@"mse"];
    cell.time.text = item[@"time"];
    
    return cell;
}

@end

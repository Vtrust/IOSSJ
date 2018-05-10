//
//  ViewController3.m
//  WeChat
//
//  Created by vtrust on 2018/3/21.
//  Copyright © 2018年 vtrust. All rights reserved.
//

#import "ViewController3.h"
#import "Cell3.h"
#define CellIdentifier @"CellIdentifier"


@interface ViewController3 ()

@property(nonatomic,strong)NSDictionary *dictData;
@property(nonatomic,strong)NSArray *listGroupname;
@property(nonatomic,strong)UITableView *tableView;

@end

@implementation ViewController3

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    self.navigationController.navigationBar.barStyle = UIBarStyleBlack;
    self.title = @"发现";
    
    NSBundle *bundle = [NSBundle mainBundle];
    NSString *plistPath = [bundle pathForResource:@"discover" ofType:@"plist"];
    
    self.dictData = [[NSDictionary alloc] initWithContentsOfFile:plistPath];
    
    NSArray* tempList = [self.dictData allKeys];
    
    self.listGroupname = [tempList sortedArrayUsingSelector:@selector(compare:)];
    self.tableView = [[UITableView alloc]initWithFrame:self.view.frame style:UITableViewStyleGrouped];
    
    self.tableView.delegate = self;
    self.tableView.dataSource = self;
    
    [self.view addSubview:self.tableView];
}

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
    NSString *groupName = self.listGroupname[section];
    NSLog(@"222222%@",groupName);
    NSArray *listTeams = self.dictData[groupName];
    NSLog(@"33333333%@",listTeams[0]);
    return [listTeams count];
}

-(UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath{
    //static NSString *CellIdentifier = @"CellIdentifier";
    Cell3 *cell = [tableView dequeueReusableCellWithIdentifier:@"cell3"];
    if(cell == nil){
        cell = [[Cell3 alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:@"cell3"];
    }
    NSInteger section = [indexPath section];
    NSInteger row = [indexPath row];
    
    NSString *groupName = self.listGroupname[section];
    
    NSArray *listTeams = self.dictData[groupName];
    NSDictionary *rowDict = listTeams[row];
    
    cell.myLabel.text = rowDict[@"name"];
    
    NSString *imageFile = rowDict[@"image"];
    NSString *imagePath = [[NSString alloc] initWithFormat:@"%@.png",imageFile];
    
    
    NSLog(@"%@11111name1111%@",imagePath,rowDict[@"name"]);
    cell.myImageView.image = [UIImage imageNamed:imagePath];
    
    return cell;
}

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView{
    return [self.listGroupname count];
}

/*-(NSString *)tableView:(UITableView *)tableView titleForFooterInSection:(NSInteger)section{
    NSString *groupName = self.listGroupname[section];
    return groupName;
}*/

@end

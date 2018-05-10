//
//  ViewController2.m
//  WeChat
//
//  Created by vtrust on 2018/3/21.
//  Copyright © 2018年 vtrust. All rights reserved.
//

#import "ViewController2.h"
#import "Cell3.h"

@interface ViewController2 ()

@property(nonatomic,strong)NSDictionary *dictData;
@property(nonatomic,strong)NSArray *listGroupname;
@property(nonatomic,strong)UITableView *tableView;

@end

@implementation ViewController2

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    self.navigationController.navigationBar.barStyle = UIBarStyleBlack;
    self.title = @"通讯录";
    self.view.backgroundColor = [UIColor yellowColor];
    NSBundle *bundle = [NSBundle mainBundle];
    NSString *plistPath = [bundle pathForResource:@"phone" ofType:@"plist"];
    
    self.dictData = [[NSDictionary alloc] initWithContentsOfFile:plistPath];
    
    NSArray* tempList = [self.dictData allKeys];
    
    self.listGroupname = [tempList sortedArrayUsingSelector:@selector(compare:)];
    self.tableView = [[UITableView alloc]initWithFrame:self.view.frame style:UITableViewStyleGrouped];
    
    self.tableView.delegate = self;
    self.tableView.dataSource = self;
    
    UIView *testView = [[UIView alloc] initWithFrame:CGRectMake(0, 0, self.view.frame.size.width, CGFLOAT_MIN)];
    
    self.tableView.tableHeaderView = testView;
    
    [self.view addSubview:self.tableView];
    
}

-(NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section{
    NSString *groupName = self.listGroupname[section];
    NSArray *listTeams = self.dictData[groupName];
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
    cell.myImageView.image = [UIImage imageNamed:imagePath];
    
    return cell;
}

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView{
    return [self.listGroupname count];
}

//- (CGFloat)tableView:(UITableView *)tableView heightForHeaderInSection:(NSInteger)section {
//    if(section ==0 ){
//        return 0;
//    }else{
//        return 10;
//    }
//}

- (NSString *)tableView:(UITableView *)tableView titleForHeaderInSection:(NSInteger)section{
    if(section == 0){
        return @"";
    }
    NSString *groupName = self.listGroupname[section];
    return groupName;
}

//- (CGFloat)tableView:(  UITableView *)tableView heightForHeaderInSection:( NSInteger )section{
//    return 10.0 ;
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

@end

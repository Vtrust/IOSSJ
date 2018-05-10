//
//  ViewController4.m
//  WeChat
//
//  Created by vtrust on 2018/3/26.
//  Copyright © 2018年 vtrust. All rights reserved.
//

#import "ViewController4.h"
#import "Cell3.h"
#import "Cell4.h"

@interface ViewController4 ()

@property(nonatomic,strong)NSDictionary *dictData;
@property(nonatomic,strong)NSArray *listGroupname;
@property(nonatomic,strong)UITableView *tableView;

@end

@implementation ViewController4

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    self.navigationController.navigationBar.barStyle = UIBarStyleBlack;
    self.title = @"我";
    NSBundle *bundle = [NSBundle mainBundle];
    NSString *plistPath = [bundle pathForResource:@"myself" ofType:@"plist"];
    
    self.dictData = [[NSDictionary alloc] initWithContentsOfFile:plistPath];
    
    NSArray* tempList = [self.dictData allKeys];
    
    self.listGroupname = [tempList sortedArrayUsingSelector:@selector(compare:)];
    self.tableView = [[UITableView alloc]initWithFrame:self.view.frame style:UITableViewStyleGrouped];
    
    self.tableView.delegate = self;
    self.tableView.dataSource = self;
    //表头定义
    UIView *HeadView = [[UIView alloc] initWithFrame:CGRectMake(0, 0, self.view.frame.size.width, 80)];
    HeadView.backgroundColor = [UIColor whiteColor];
    UIImageView *avator = [[UIImageView alloc]initWithFrame:CGRectMake(10, 10, 60, 60)];
    avator.image = [UIImage imageNamed:@"avator.jpeg"];
    [HeadView addSubview:avator];
    
    UILabel *mName = [[UILabel alloc]initWithFrame:CGRectMake(80, 20, 100, 25)];
    mName.font = [UIFont systemFontOfSize:25];
    mName.text = @"vtrust";
    [HeadView addSubview:mName];
    
    UILabel *mNumber = [[UILabel alloc]initWithFrame:CGRectMake(80, 55, 200, 14)];
    mNumber.font = [UIFont systemFontOfSize:14];
    mNumber.text = @"微信号： lpancake";
    [HeadView addSubview:mNumber];
    
    UILabel *mQR = [[UILabel alloc]initWithFrame:CGRectMake(self.view.frame.size.width-50, 20, 50, 40)];
    mQR.font = [UIFont systemFontOfSize:25];
    mQR.text = @"QR";
    [HeadView addSubview:mQR];
    
    
    
    
    //self.tableView.tableHeaderView = HeadView;
    
    [self.view addSubview:self.tableView];
}

-(NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section{
    NSString *groupName = self.listGroupname[section];
    NSArray *listTeams = self.dictData[groupName];
    return [listTeams count];
}

-(UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath{
    //static NSString *CellIdentifier = @"CellIdentifier";
    NSInteger section = [indexPath section];
    NSInteger row = [indexPath row];
    
    NSString *groupName = self.listGroupname[section];
    
    NSArray *listTeams = self.dictData[groupName];
    NSDictionary *rowDict = listTeams[row];
    
    if(section != 0){
        Cell3 *cell = [tableView dequeueReusableCellWithIdentifier:@"cell3"];
        if(cell == nil){
            cell = [[Cell3 alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:@"cell3"];
        }
        cell.myLabel.text = rowDict[@"name"];
        NSString *imageFile = rowDict[@"image"];
        NSString *imagePath = [[NSString alloc] initWithFormat:@"%@.png",imageFile];
        cell.myImageView.image = [UIImage imageNamed:imagePath];
        return cell;
    }else{
        Cell4 *cell = [tableView dequeueReusableCellWithIdentifier:@"cell4"];
        if(cell == nil){
            cell = [[Cell4 alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:@"cell4"];
        }
        NSLog(@"%@",rowDict);
        NSString *img1 = [[NSString alloc]initWithFormat:@"%@.jpeg",rowDict[@"image"]];
        cell.avator.image = [UIImage imageNamed:img1];
        cell.mName.text = rowDict[@"name"];
        cell.mNumber.text = [[NSString alloc]initWithFormat:@"微信号：%@",rowDict[@"number"]];
        cell.mQR.image = [UIImage imageNamed:rowDict[@"QR"]];
        return cell;
    }

    

}

- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath{
    NSInteger section = [indexPath section];
    if(section == 0){
        return 80;
    }else{
        return 45;
    }
}

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView{
    return [self.listGroupname count];
}

- (NSString *)tableView:(UITableView *)tableView titleForHeaderInSection:(NSInteger)section{
    NSString *groupName = @" ";
    return groupName;
}

- (CGFloat)tableView:(  UITableView *)tableView heightForHeaderInSection:( NSInteger )section{
    return 10.0 ;
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

@end

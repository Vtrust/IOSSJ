//
//  ViewController.m
//  ViewSwitch
//
//  Created by vtrust on 2018/3/14.
//  Copyright © 2018年 vtrust. All rights reserved.
//

#import "ViewController.h"
#import "NewViewController.h"
//#import "BMChineseSort.h"

@interface ViewController ()

//排序后的出现过的拼音首字母数组
@property(nonatomic,strong)NSMutableArray *indexArray;
//排序好的结果数组
@property(nonatomic,strong)NSMutableArray *letterResultArr;

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
    UIBarButtonItem* addButtonItem = [[UIBarButtonItem alloc]initWithBarButtonSystemItem:UIBarButtonSystemItemAdd target:self action:@selector(add:)];
    self.navigationItem.rightBarButtonItem = addButtonItem;
    
    
    NSString *plistPath = [[NSBundle mainBundle] pathForResource:@"phone" ofType:@"plist"];
    self.phoneData = [[NSDictionary alloc] initWithContentsOfFile:plistPath];
    self.listTeam = [self.phoneData allKeys];
    
    //根据Person对象的 name 属性 按中文 对 Person数组 排序
    //self.indexArray = [BMChineseSort IndexWithArray:self.listTeam Key:@"name"];
    //self.letterResultArr = [BMChineseSort sortObjectArray:self.listTeam Key:@"name"];
    
    //NSLog(@"%@",self.indexArray);
    
    
    self.tableView = [[UITableView alloc] initWithFrame:self.view.frame];
    //设置表示图的委托对象为self
    self.tableView.delegate = self;
    //设置表示图的数据对象为self;
    self.tableView.dataSource = self;
    
    [self.view addSubview:self.tableView];
}

-(void)add:(id)sender{
    NSLog(@"Tap Add");
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

//UITableViewDataSource协议方法
- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section{
    return [self.listTeam count];
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath{
    static NSString *reusableFlag = @"resuableFlag";
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:reusableFlag];
    if(cell == nil){
        cell = [[UITableViewCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:reusableFlag];
        NSLog(@"----");
    }

    cell.textLabel.text = [self.listTeam objectAtIndex:[indexPath row]];
    return  cell;
}

//#pragma mark - UITableView -
////section的titleHeader
//- (NSString *)tableView:(UITableView *)tableView titleForHeaderInSection:(NSInteger)section {
//    return [self.indexArray objectAtIndex:section];
//}
////section行数
//-(NSInteger)numberOfSectionsInTableView:(UITableView *)tableView{
//    return [self.indexArray count];
//}
////每组section个数
//- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section{
//    return [[self.letterResultArr objectAtIndex:section] count];
//}
////section右侧index数组
//-(NSArray *)sectionIndexTitlesForTableView:(UITableView *)tableView{
//    return self.indexArray;
//}
////点击右侧索引表项时调用 索引与section的对应关系
//- (NSInteger)tableView:(UITableView *)tableView sectionForSectionIndexTitle:(NSString *)title atIndex:(NSInteger)index{
//    return index;
//}
////返回cell
//- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath{
//    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:@"CELL"];
//    if (cell == nil){
//        cell = [[UITableViewCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:@"CELL"];
//    }
//    //获得对应的Person对象<替换为你自己的model对象>
//    //Person *p = [[self.letterResultArr objectAtIndex:indexPath.section] objectAtIndex:indexPath.row];
//    cell.textLabel.text = [self.letterResultArr objectAtIndex:[indexPath row]];
//    return cell;
//}




//表的选择事件
- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath{
    NSInteger selectedIndex = [indexPath row];
    NSLog(@"%@",self.listTeam[selectedIndex]);
    NSMutableDictionary *dict = [self.phoneData objectForKey:self.listTeam[selectedIndex]];
    NewViewController *newView=[[NewViewController alloc] init];
    //[dict setObject:@"pancake" forKey:@"email"];
    //newView.onePhone = dict;
    //NSLog(@"%@",dict);
    NSMutableDictionary * dict2 = [NSMutableDictionary dictionaryWithCapacity:5];
    [dict2 setObject:self.listTeam[selectedIndex] forKey:@"name"];
    [dict2 addEntriesFromDictionary:dict];
    newView.onePhone =dict2;
    NSLog(@"%@",dict2);
    [self.navigationController pushViewController:newView animated:YES];
}



@end

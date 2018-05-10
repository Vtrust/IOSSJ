//
//  ViewController.m
//  MailList
//
//  Created by vtrust on 2018/3/28.
//  Copyright © 2018年 vtrust. All rights reserved.
//

#import "MailList.h"
#import "Detail.h"
#import "Person+CoreDataClass.h"

@interface ViewController (){
    NSMutableArray *mailList;
    UITableView *tableView;
    NSManagedObjectContext *context;
    
}
@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
    [self createSqlite];
    
    UIBarButtonItem* addButtonItem = [[UIBarButtonItem alloc]initWithBarButtonSystemItem:UIBarButtonSystemItemAdd target:self action:@selector(addData:)];
    self.navigationItem.rightBarButtonItem = addButtonItem;
    
    //查询
    UIButton *button2 = [[UIButton alloc] initWithFrame:CGRectMake(100, 150, 200, 50)];
    button2.backgroundColor = [UIColor lightGrayColor];
    [button2 setTitle:@"删除数据" forState:UIControlStateNormal];
    [button2 addTarget:self action:@selector(button2Pressed) forControlEvents:UIControlEventTouchUpInside];
    
    [self tableReload];
    
    
    //tableview
    tableView = [[UITableView alloc] initWithFrame:self.view.frame];
    //设置表示图的委托对象为self
    tableView.delegate = self;
    //设置表示图的数据对象为self;
    tableView.dataSource = self;
    
    [self.view addSubview:tableView];
    //[self.view addSubview:button2];
    
}

//数据库创建
- (void)createSqlite{
    NSError *error = nil;
    
    NSManagedObjectModel *model = [NSManagedObjectModel mergedModelFromBundles:nil];
    NSPersistentStoreCoordinator *psc = [[NSPersistentStoreCoordinator alloc] initWithManagedObjectModel:model];
    
    NSString *docs = [NSSearchPathForDirectoriesInDomains(NSDocumentDirectory, NSUserDomainMask, YES) lastObject];
    NSURL *url = [NSURL fileURLWithPath:[docs stringByAppendingString:@"Person.sqlite"]];
    
    NSPersistentStore *store = [psc addPersistentStoreWithType:NSSQLiteStoreType configuration:nil URL:url options:nil error:&error];
    
    if (store == nil) {
        [NSException raise:@"DB Error" format:@"%@", [error localizedDescription]];
    }
    
    context = [[NSManagedObjectContext alloc] initWithConcurrencyType:NSPrivateQueueConcurrencyType];
    context.persistentStoreCoordinator = psc;
}


//UITableViewDataSource协议方法
- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section{
    return [mailList count];
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath{
    NSInteger row = [indexPath row];
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:@"cell"];
    if(cell == nil){
        cell = [[UITableViewCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:@"cell"];
        NSLog(@"----");
    }
    NSObject *obj = mailList[row];
    NSString *name = [obj valueForKey:@"name"];
    cell.textLabel.text = name;
    return  cell;
}

//点击插入数据
- (void)addData:(id)sender{
    NSLog(@"addData");
    
    for(int i=0;i<10;i++){
        NSString *name = [[NSString alloc] initWithFormat:@"name%d",i];
        NSString *phone = [[NSString alloc]initWithFormat:@"%d-123456",i];
        NSString *emial = [[NSString alloc]initWithFormat:@"%d-1234@mail.com",i];
        NSString *address = [[NSString alloc]initWithFormat:@"地址%d",i];
        NSString *province = [[NSString alloc]initWithFormat:@"省份%d",i];
        NSManagedObject *s1 = [NSEntityDescription insertNewObjectForEntityForName:@"Person" inManagedObjectContext:context];
        [s1 setValue:name forKey:@"name"];
        [s1 setValue:phone forKey:@"phone"];
        [s1 setValue:emial forKey:@"email"];
        [s1 setValue:address forKey:@"address"];
        [s1 setValue:province forKey:@"province"];
        
        NSError *error = nil;
        
        if([context save:&error]){
            NSLog(@"%d-ADD SUCCEED!",i);
        }else{
            NSString *err = [[NSString alloc]initWithFormat:@"%d-插入错误",i];
            [NSException raise:err format:@"%@", [error localizedDescription]];
        }
    }
    [self tableReload];
}
- (void)button2Pressed {
//    NSFetchRequest *request = [[NSFetchRequest alloc] init];
//    request.entity = [NSEntityDescription entityForName:@"Person" inManagedObjectContext:context];
    NSFetchRequest *request = [NSFetchRequest fetchRequestWithEntityName:@"Person"];
    
    //NSPredicate *predicate = [NSPredicate predicateWithFormat:@"uid = %@", @"001"];
    //request.predicate = predicate;
    
    NSError *error = nil;
    NSArray *objs = [context executeFetchRequest:request error:nil];
    if (error) {
        [NSException raise:@"查询错误" format:@"%@", [error localizedDescription]];
    }
    
    for (NSManagedObject *obj in objs) {
        NSLog(@"name = %@, phone = %@, email = %@", [obj valueForKey:@"name"], [obj valueForKey:@"phone"], [obj valueForKey:@"email"]);
        [context deleteObject:obj];
        NSLog(@"delete");
    }
    
    [context save:&error];
    
    [self tableReload];
    
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (void)tableReload{
    NSFetchRequest *request = [[NSFetchRequest alloc] init];
    request.entity = [NSEntityDescription entityForName:@"Person" inManagedObjectContext:context];
    NSError *error = nil;
    NSArray *resArray = [context executeFetchRequest:request error:&error];
    mailList = [NSMutableArray arrayWithArray:resArray];
    if (error) {
        [NSException raise:@"查询错误" format:@"%@", [error localizedDescription]];
    }
    [tableView reloadData];
}

//表的选择事件
- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath{
    NSInteger row = [indexPath row];
    NSLog(@"%ld",row);
    NSObject *onePerson = mailList[row];
    NSLog(@"%ld-----%@",(long)row,onePerson);
    Detail *detail=[[Detail alloc] init];
    detail.onePerson = onePerson;
    detail.context = context;
    [self.navigationController pushViewController:detail animated:YES];
}

- (void)viewWillAppear:(BOOL)animated{
    [self tableReload];
}

@end

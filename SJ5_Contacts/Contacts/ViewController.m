//
//  ViewController.m
//  Contacts
//
//  Copyright © 2018年 Jiachi Xu. All rights reserved.
//

#import "ViewController.h"
#import "ChineseString.h"

#define APP_WIDTH [[UIScreen mainScreen]applicationFrame].size.width
#define APP_HEIGHT [[UIScreen mainScreen]applicationFrame].size.height

@interface ViewController (){
    NSManagedObjectContext *context;
    NSInteger *reloadFlag;
}

-(void)filterContentForSearchText:(NSString*)searchText;

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    //reloadFlag =1;
    // Do any additional setup after loading the view, typically from a nib.
    
    self.title = @"通讯录";
    [self.view setBackgroundColor:[UIColor whiteColor]];
    
    NSError *error = nil;
    
    NSManagedObjectModel *model = [NSManagedObjectModel mergedModelFromBundles:nil];
    NSPersistentStoreCoordinator *psc = [[NSPersistentStoreCoordinator alloc] initWithManagedObjectModel:model];
    
    NSString *docs = [NSSearchPathForDirectoriesInDomains(NSDocumentDirectory, NSUserDomainMask, YES) lastObject];
    NSURL *url = [NSURL fileURLWithPath:[docs stringByAppendingString:@"Cntact.sqlite"]];
    
    NSPersistentStore *store = [psc addPersistentStoreWithType:NSSQLiteStoreType configuration:nil URL:url options:nil error:&error];
    
    if (store == nil) {
        [NSException raise:@"DB Error" format:@"%@", [error localizedDescription]];
    }
    
    context = [[NSManagedObjectContext alloc] initWithConcurrencyType:NSPrivateQueueConcurrencyType];
    context.persistentStoreCoordinator = psc;
    
    // 可变数组初始化
    _infoMutableArray = [NSMutableArray array];
    _personsName = [NSMutableArray array];
    _tPersonsName = [NSMutableArray array];
    tableView = [[UITableView alloc] initWithFrame:self.view.frame style:UITableViewStylePlain];
    
    //tableView.tableFooterView = [[UIView alloc] initWithFrame:CGRectZero];
    
    tableView.delegate = self;
    tableView.dataSource = self;
    
    [self.view addSubview:tableView];
    
    [self loadData];
    
    // 索引标题显示
    sectionTitleView = ({
        UILabel *sectionTitleView1 = [[UILabel alloc] initWithFrame:CGRectMake((APP_WIDTH-100)/2, (APP_HEIGHT-100)/2,100,100)];
        sectionTitleView1.textAlignment = NSTextAlignmentCenter;
        sectionTitleView1.font = [UIFont boldSystemFontOfSize:60];
        sectionTitleView1.textColor = [UIColor blackColor];
        sectionTitleView1.backgroundColor = [UIColor whiteColor];
        sectionTitleView1.layer.cornerRadius = 6;
        sectionTitleView1.layer.borderWidth = 1.f/[UIScreen mainScreen].scale;
        sectionTitleView.layer.borderColor = [UIColor groupTableViewBackgroundColor].CGColor;
        sectionTitleView1;
    });
    [self.view addSubview:sectionTitleView];
    sectionTitleView.hidden = YES;
    
    
    //搜索框
    self.searchController = [[UISearchController alloc]initWithSearchResultsController:nil];
    self.searchController.searchResultsUpdater = self;
    self.searchController.dimsBackgroundDuringPresentation = FALSE;
    self.searchController.searchBar.placeholder = @"搜索名字";
    
    //样式设置
    self.searchController.searchBar.barTintColor = [UIColor whiteColor];
    
    //拿到输入框
    UITextField *searchTextField = [self.searchController.searchBar valueForKey:@"_searchField"];
    //字体大小
    searchTextField.font = [UIFont systemFontOfSize:15];
    //输入框背景颜色
    searchTextField.backgroundColor = [UIColor colorWithRed:234/255.0 green:235/255.0 blue:237/255.0 alpha:1];
    [self.searchController.searchBar setValue:@"取消" forKey:@"_cancelButtonText"];
    
    self.searchController.searchBar.delegate = self;
    
    //放在表头
    tableView.tableHeaderView = self.searchController.searchBar;
    [self.searchController.searchBar sizeToFit];
    
    // 搜索框自动隐藏
    self.definesPresentationContext = YES;
    
    //初始化UIRefreshControl
    UIRefreshControl *rc = [[UIRefreshControl alloc] init];
    rc.attributedTitle = [[NSAttributedString alloc]initWithString:@"下拉刷新"];
    [rc addTarget:self action:@selector(refreshTableView) forControlEvents:UIControlEventValueChanged];
    refreshControl = rc;
    [tableView addSubview:refreshControl];

}

-(void)refreshTableView{
    if(refreshControl.refreshing){
        refreshControl.attributedTitle = [[NSAttributedString alloc]initWithString:@"加载中..."];
        
        //if(reloadFlag == 1){
            reloadFlag = 0;
            [self reloadData];
        //}
        //[tableView reloadData];
        
        [refreshControl endRefreshing];
        
        //中文排序
        indexArray = [ChineseString IndexArray:_personsName];
        letterResultArr = [ChineseString LetterSortArray:_personsName];
        
        [tableView reloadData];
        
        
        refreshControl.attributedTitle = [[NSAttributedString alloc]initWithString:@"下拉刷新"];
    }
}

// 搜索过滤
-(void)filterContentForSearchText:(NSString *)searchText{
    
    NSPredicate *scopePredicate;
    NSArray *tempPerson;
    NSMutableArray *tempName = [NSMutableArray array];
    
    if([searchText length]==0){
        tempName = _personsName;
    }
    
    scopePredicate = [NSPredicate predicateWithFormat:@"SELF.name contains[c] %@",searchText];
    tempPerson = [personArray filteredArrayUsingPredicate:scopePredicate];
    NSLog(@"ssssss%@",tempPerson);
    for(Contacts *per in tempPerson){
        [tempName addObject:per.name];
    }
    indexArray = [ChineseString IndexArray:tempName];
    letterResultArr = [ChineseString LetterSortArray:tempName];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (void) loadData {
    
    //[self deleteDBData];
    [_infoMutableArray removeAllObjects];
    [_personsName removeAllObjects];
    [indexArray removeAllObjects];
    [letterResultArr removeAllObjects];
    
    NSError *error = nil;
    
    NSEntityDescription *entity1 = [NSEntityDescription entityForName:@"Cntact" inManagedObjectContext:context];
    
    NSFetchRequest *fetchRequest1 = [[NSFetchRequest alloc]init];
    fetchRequest1.entity = entity1;
    
    personArray = [context executeFetchRequest:fetchRequest1 error:NULL];
    
    NSLog(@"%lu",(unsigned long)[personArray count]);
    
    if([personArray count]>0){
        NSLog(@"not net");
        for (Contacts *obj in personArray) {
            Contacts *contact = [[Contacts alloc]init];

                contact.name = obj.name;
                [_personsName addObject:contact.name];
        
     
                contact.phone = obj.phone;
            
            /*if (obj.telephone) {
             contact.telephone = obj.telephone;
             }
             if (obj.office) {
             contact.office = obj.office;
             }
             if (obj.department) {
             contact.department = obj.department;
             }
             if (obj.email) {
             contact.email = obj.email;
             }*/
            [_infoMutableArray addObject:contact];
        }
        
        //中文排序
        indexArray = [ChineseString IndexArray:_personsName];
        letterResultArr = [ChineseString LetterSortArray:_personsName];
        
        [tableView reloadData];
    }else{
        BmobQuery *query = [BmobQuery queryWithClassName:@"Contacts"];
    [query findObjectsInBackgroundWithBlock:^(NSArray *array, NSError *error) {
        
        for (BmobObject *obj in array) {
            Contacts *contact = [[Contacts alloc] init];
            NSEntityDescription *entity = [NSEntityDescription entityForName:@"Cntact" inManagedObjectContext:context];
            Cntact *cnt = [[Cntact alloc] initWithEntity:entity insertIntoManagedObjectContext:context];
            
            if ([obj objectForKey:@"name"]) {
                contact.name = [obj objectForKey:@"name"];
                [cnt setName:contact.name];
                [_personsName addObject:contact.name];
            }
            if ([obj objectForKey:@"phone"]) {
                contact.phone = [obj objectForKey:@"phone"];
                [cnt setPhone:contact.phone];
            }
            if ([obj objectForKey:@"telephone"]) {
                contact.telephone = [obj objectForKey:@"telephone"];
                [cnt setTelephone:contact.telephone];
            }
            if ([obj objectForKey:@"office"]) {
                contact.office = [obj objectForKey:@"office"];
                [cnt setOffice:contact.office];
            }
            if ([obj objectForKey:@"department"]) {
                contact.department = [obj objectForKey:@"department"];
                [cnt setDapartment:contact.department];
            }
            if ([obj objectForKey:@"email"]) {
                contact.email = [obj objectForKey:@"email"];
                [cnt setEmail:contact.email];
            }
            [_infoMutableArray addObject:contact];
            
            
            if ([context save:&error]) {
                NSLog(@"数据插入到数据库成功");
            }else{
                NSLog(@"数据插入到数据库失败, %@",error);
            }
        }
        NSLog(@"%lu", (unsigned long)[_infoMutableArray count]);
        
        // CoreData 做数据源
        NSEntityDescription *entity = [NSEntityDescription entityForName:@"Cntact" inManagedObjectContext:context];
        NSFetchRequest *request = [[NSFetchRequest alloc] init];
        [request setEntity:entity];
        
        personArray = [context executeFetchRequest:request error:&error];
        NSLog(@"%lu", (unsigned long)[personArray count]);
        
        //中文排序
        indexArray = [ChineseString IndexArray:_personsName];
        letterResultArr = [ChineseString LetterSortArray:_personsName];
        
        [tableView reloadData];
  

    }];
    }

    
}

- (void) reloadData {
    
    [self deleteDBData];
    [_infoMutableArray removeAllObjects];
    [_personsName removeAllObjects];
    //[indexArray removeAllObjects];
    //[letterResultArr removeAllObjects];
    
    NSError *error = nil;
    BmobQuery *query = [BmobQuery queryWithClassName:@"Contacts"];
    [query findObjectsInBackgroundWithBlock:^(NSArray *array, NSError *error) {

        
        for (BmobObject *obj in array) {
            Contacts *contact = [[Contacts alloc] init];
            NSEntityDescription *entity = [NSEntityDescription entityForName:@"Cntact" inManagedObjectContext:context];
            Cntact *cnt = [[Cntact alloc] initWithEntity:entity insertIntoManagedObjectContext:context];
            
            if ([obj objectForKey:@"name"]) {
                contact.name = [obj objectForKey:@"name"];
                [cnt setName:contact.name];
                [_personsName addObject:contact.name];
            }
            if ([obj objectForKey:@"phone"]) {
                contact.phone = [obj objectForKey:@"phone"];
                [cnt setPhone:contact.phone];
            }
            if ([obj objectForKey:@"telephone"]) {
                contact.telephone = [obj objectForKey:@"telephone"];
                [cnt setTelephone:contact.telephone];
            }
            if ([obj objectForKey:@"office"]) {
                contact.office = [obj objectForKey:@"office"];
                [cnt setOffice:contact.office];
            }
            if ([obj objectForKey:@"department"]) {
                contact.department = [obj objectForKey:@"department"];
                [cnt setDapartment:contact.department];
            }
            if ([obj objectForKey:@"email"]) {
                contact.email = [obj objectForKey:@"email"];
                [cnt setEmail:contact.email];
            }
            [_infoMutableArray addObject:contact];
            
            
            if ([context save:&error]) {
                NSLog(@"数据插入到数据库成功");
            }else{
                NSLog(@"数据插入到数据库失败, %@",error);
            }
        }
        NSLog(@"%lu", (unsigned long)[_infoMutableArray count]);
        
        // CoreData 做数据源
        NSEntityDescription *entity = [NSEntityDescription entityForName:@"Cntact" inManagedObjectContext:context];
        NSFetchRequest *request = [[NSFetchRequest alloc] init];
        [request setEntity:entity];
        
        personArray = [context executeFetchRequest:request error:&error];
        NSLog(@"%lu", (unsigned long)[personArray count]);
        
        //[indexArray removeAllObjects];
        //[letterResultArr removeAllObjects];
        //中文排序
        indexArray = [ChineseString IndexArray:_personsName];
        letterResultArr = [ChineseString LetterSortArray:_personsName];
        
        [tableView reloadData];
    }];
}

- (void) deleteDBData {
    //1.创建查询请求 EntityName：想要清楚的实体的名字
    NSFetchRequest *request = [[NSFetchRequest alloc] initWithEntityName:@"Cntact"];
    //2.创建删除请求  参数是：查询请求
    //NSBatchDeleteRequest是iOS9之后新增的API，不兼容iOS8及以前的系统
    NSBatchDeleteRequest *deletRequest = [[NSBatchDeleteRequest alloc] initWithFetchRequest:request];
    //3.使用存储调度器(NSPersistentStoreCoordinator)执行删除请求
    /**
     Request：存储器请求（NSPersistentStoreRequest）  删除请求NSBatchDeleteRequest继承于NSPersistentStoreRequest
     context：管理对象上下文
     */
    [context.persistentStoreCoordinator executeRequest:deletRequest withContext:context error:nil];
    
}

#pragma mark --实现UISearchBarDelegate协议方法
- (void)searchBar:(UISearchBar *)searchBar selectedScopeButtonIndexDidChange:(NSInteger)selectedScope {
    [self updateSearchResultsForSearchController:self.searchController];
}

#pragma mark --实现UISearchResultsUpdating协议方法
- (void)updateSearchResultsForSearchController:(UISearchController *)searchController {
    NSString *searchString = searchController.searchBar.text;
    //查询
    [self filterContentForSearchText:searchString];
    [tableView reloadData];
}

#pragma mark - UITableView DataSource

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    //return [_infoMutableArray count];
    NSArray *listTeams = letterResultArr[section];
    return [listTeams count];
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    static NSString *CellIdentifier = @"CellIdentifier";
    ContactTableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:CellIdentifier];
    if(cell == nil){
        cell = [[ContactTableViewCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:CellIdentifier];
    }
    
    //Contacts *contact = (Contacts*)[_infoMutableArray objectAtIndex:indexPath.row];

//    cell.nameLabel.text = contact.name;
//    cell.phoneNumLabel.text = contact.phone;
    
    NSUInteger section = [indexPath section];
    NSUInteger row = [indexPath row];
    //NSManagedObject *person = personArray[row];
    NSArray *listTeams = letterResultArr[section];
    
    cell.nameLabel.text = listTeams[row];
    
    // 联系人对应电话
    NSString * searchContent = listTeams[row];
    NSPredicate * pre = [NSPredicate predicateWithFormat:@"name == %@",searchContent];
    NSEntityDescription *entity = [NSEntityDescription entityForName:@"Cntact" inManagedObjectContext:context];
    NSFetchRequest *request = [[NSFetchRequest alloc] init];
    [request setEntity:entity];
    [request setPredicate:pre];
    NSArray * array = [context executeFetchRequest:request error:NULL];
    Contacts *contact = [array objectAtIndex:0];
    cell.phoneNumLabel.text = contact.phone;
    
    cell.img.image = [UIImage imageNamed:@"avatar"];
    return cell;
}

- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath {
    return 80.0f;
}

-(NSInteger)numberOfSectionsInTableView:(UITableView *)tableView{
    return [indexArray count];
}

//分节标题
-(NSString *)tableView:(UITableView *)tableView titleForHeaderInSection:(NSInteger)section{
    NSString *groupName = indexArray[section];
    return groupName;
}

//索引
-(NSArray *)sectionIndexTitlesForTableView:(UITableView *)tableView{
    NSMutableArray *listTitles = [[NSMutableArray alloc]init];
    for (NSString *item in indexArray) {
        NSString *title = [item substringToIndex:1];
        [listTitles addObject:title];
    }
    return listTitles;
}

- (NSInteger)tableView:(UITableView *)tableView sectionForSectionIndexTitle:(NSString *)title atIndex:(NSInteger)index
{
    [self showSectionTitle:title];
    return index;
}

#pragma mark - private
- (void)timerHandler:(NSTimer *)sender
{
    dispatch_async(dispatch_get_main_queue(), ^{
        [UIView animateWithDuration:.3 animations:^{
            sectionTitleView.alpha = 0;
        } completion:^(BOOL finished) {
            sectionTitleView.hidden = YES;
        }];
    });
}

-(void)showSectionTitle:(NSString*)title{
    [sectionTitleView setText:title];
    sectionTitleView.hidden = NO;
    sectionTitleView.alpha = 1;
    [timer invalidate];
    timer = nil;
    timer = [NSTimer scheduledTimerWithTimeInterval:1 target:self selector:@selector(timerHandler:) userInfo:nil repeats:NO];
    [[NSRunLoop currentRunLoop] addTimer:timer forMode:NSRunLoopCommonModes];
}

#pragma mark - UITableView Delegate methods

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath {
    SpecInfoViewController *specInfoView = [[SpecInfoViewController alloc] init];
    
//    Contacts *contact = (Contacts*)[_infoMutableArray objectAtIndex:indexPath.row];
//    specInfoView.contact = contact;
    
    NSUInteger section = [indexPath section];
    NSUInteger row = [indexPath row];
    NSArray *listTeams = letterResultArr[section];
    NSString * searchContent = listTeams[row];
    NSPredicate * pre = [NSPredicate predicateWithFormat:@"name == %@",searchContent];
    NSEntityDescription *entity = [NSEntityDescription entityForName:@"Cntact" inManagedObjectContext:context];
    NSFetchRequest *request = [[NSFetchRequest alloc] init];
    [request setEntity:entity];
    [request setPredicate:pre];
    NSArray * array = [context executeFetchRequest:request error:NULL];
    Contacts *contact = [array objectAtIndex:0];
    
    specInfoView.person = contact;
    
    [self.navigationController pushViewController:specInfoView animated:YES];
    
}

@end

//
//  specInfoViewController.m
//  Contacts
//
//  Copyright © 2018年 Jiachi Xu. All rights reserved.
//

#import "SpecInfoViewController.h"

@interface SpecInfoViewController ()

@end

@implementation SpecInfoViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    
    name = [_person valueForKey:@"name"];
    phoneNum = [_person valueForKey:@"phone"];
    telephone = [_person valueForKey:@"telephone"];
    email = [_person valueForKey:@"email"];
    department = [_person valueForKey:@"dapartment"];
    office = [_person valueForKey:@"office"];
    
    self.title = _contact.name;
    [self.view setBackgroundColor:[UIColor whiteColor]];
    NSLog(@"%@", _contact);
    
    detailInfoTable = [[UITableView alloc] initWithFrame:self.view.frame style:UITableViewStylePlain];
    
    detailInfoTable.tableFooterView = [[UIView alloc] initWithFrame:CGRectZero];
    
    detailInfoTable.delegate = self;
    detailInfoTable.dataSource = self;
    
    [self.view addSubview:detailInfoTable];
    
//    img = [[UIImageView alloc] initWithFrame:CGRectMake(25, 80, 60, 60)];
//    img.image = [UIImage imageNamed:@"avatar"];
//    [self.view addSubview:img];
//    
//    nameLabel = [[UILabel alloc] initWithFrame:CGRectMake(100, 100, 40, 20)];
//    [nameLabel setText:_contact.name];
//    [self.view addSubview:nameLabel];
    
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

#pragma mark - UITableView DataSource

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    return 5;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {

    NSUInteger row = [indexPath row];
    static NSString *CellIdentifier = @"CellIdentifier";
    if (row == 0) {
        nameCell *cell = [tableView dequeueReusableCellWithIdentifier:CellIdentifier];
        if(cell == nil){
            cell = [[nameCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:CellIdentifier];
        }
        //cell.name.text = _contact.name;
        cell.name.text = name;
        cell.img.image = [UIImage imageNamed:@"avatar"];
        return cell;
    }else if (row == 1){
        PhoneCell *cell =[tableView dequeueReusableCellWithIdentifier:CellIdentifier];
        if(cell == nil){
            cell = [[PhoneCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:CellIdentifier];
        }
        
        //cell.phoneNum.text = _contact.phone;
        cell.phoneNum.text = phoneNum;
        cell.phoneNum.font = [UIFont systemFontOfSize:20.0f];
        [cell.call addTarget:self action:@selector(call:) forControlEvents:UIControlEventTouchUpInside];
        [cell.message addTarget:self action:@selector(sms:) forControlEvents:UIControlEventTouchUpInside];
        return cell;
    }else if (row == 2) {
        telPhoneCell *cell =[tableView dequeueReusableCellWithIdentifier:CellIdentifier];
        if(cell == nil){
            cell = [[telPhoneCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:CellIdentifier];
        }
        
        //cell.phoneNum.text = _contact.telephone;
        cell.phoneNum.text = telephone;
        cell.phoneNum.font = [UIFont systemFontOfSize:20.0f];
        [cell.call addTarget:self action:@selector(call_:) forControlEvents:UIControlEventTouchUpInside];
        return cell;
    }else if (row == 3) {
        emailCell *cell =[tableView dequeueReusableCellWithIdentifier:CellIdentifier];
        if(cell == nil){
            cell = [[emailCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:CellIdentifier];
        }
        
        //cell.email.text = _contact.email;
        cell.email.text = email;
        cell.email.font = [UIFont systemFontOfSize:20.0f];
        return cell;
    }else if (row == 4){
        OtherCell *cell = [tableView dequeueReusableCellWithIdentifier:CellIdentifier];
        if(cell == nil){
            cell = [[OtherCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:CellIdentifier];
        }
        
        //cell.department.text = _contact.department;
        cell.department.text = department;
        cell.department.font = [UIFont systemFontOfSize:20.0f];
        
        //cell.office.text = _contact.office;
        cell.office.text = office;
        cell.office.font = [UIFont systemFontOfSize:20.0f];
        return cell;
    }else {
        UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:CellIdentifier];
        if(cell == nil){
            cell = [[UITableViewCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:CellIdentifier];
        }
        return cell;
    }
}

- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath {
    NSUInteger row = [indexPath row];
    if (row == 0)
        return 100.0f;
    else if (row == 1 || row == 2 || row == 3)
        return 70.0f;
    else
        return 125.0f;
}
/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

- (void)call:(id)sender{
    NSLog(@"打电话给%@",name);
    NSString *str = [NSString stringWithFormat:@"telprompt://%@", phoneNum];
    [[UIApplication sharedApplication] openURL:[NSURL URLWithString:str] options:@{} completionHandler:^(BOOL success){
        if(success == 1){
            NSLog(@"打电话");
        }
    }];
}

- (void)sms:(id)sender{
    NSString *str = [NSString stringWithFormat:@"sms://%@", phoneNum];
    [[UIApplication sharedApplication] openURL:[NSURL URLWithString:str] options:@{} completionHandler:^(BOOL success) {
        if(success == 1){
            NSLog(@"发短信");
        }
    }];
}

- (void)call_:(id)sender{
    NSLog(@"打电话给%@",name);
    NSString *str = [NSString stringWithFormat:@"telprompt://0411-%@", phoneNum];
    [[UIApplication sharedApplication] openURL:[NSURL URLWithString:str] options:@{} completionHandler:^(BOOL success){
        if(success == 1){
            NSLog(@"打电话");
        }
    }];
}

@end

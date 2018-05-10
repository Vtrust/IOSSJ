//
//  Edit.m
//  MailList
//
//  Created by vtrust on 2018/3/28.
//  Copyright © 2018年 vtrust. All rights reserved.
//

#import "Edit.h"
#import "Person+CoreDataClass.h"

@interface Edit ()

@end

@implementation Edit



- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    int labelWidth = 60;
    int labelHeight = 50;
    int labelMarginLeft = 20;
    int labelMarginTop = 65;
    
    
    UIBarButtonItem* addButtonItem = [[UIBarButtonItem alloc]initWithBarButtonSystemItem:UIBarButtonSystemItemSave target:self action:@selector(submit)];
    self.navigationItem.rightBarButtonItem = addButtonItem;

    
    
    self.view.backgroundColor = [UIColor whiteColor];
    UILabel *myLable1 = [[UILabel alloc]initWithFrame:CGRectMake(labelMarginLeft, labelMarginTop, labelWidth, labelHeight)];
    myLable1.textAlignment = NSTextAlignmentLeft;
    myLable1.text = @"姓名: ";
    [self.view addSubview:myLable1];
    
    UITextField *text1 = [[UITextField alloc] initWithFrame:CGRectMake(labelMarginLeft+labelWidth, labelMarginTop, self.view.bounds.size.width-labelWidth, labelHeight )];
    text1.text = [self.onePerson valueForKey:@"name"];
    text1.delegate = self;
    text1.tag = 1;
    [text1 addTarget:self action:@selector(changeValue:) forControlEvents:UIControlEventEditingChanged];
    [self.view addSubview:text1];
    
    UILabel *myLable2 = [[UILabel alloc]initWithFrame:CGRectMake(labelMarginLeft, labelMarginTop+labelHeight, labelWidth, labelHeight)];
    myLable2.textAlignment = NSTextAlignmentLeft;
    myLable2.text = @"手机: ";
    [self.view addSubview:myLable2];
    
    UITextField *text2 = [[UITextField alloc] initWithFrame:CGRectMake(labelMarginLeft+labelWidth , labelMarginTop+labelHeight, self.view.bounds.size.width-labelWidth, labelHeight )];
    text2.text = [self.onePerson valueForKey:@"phone"];
    text2.delegate = self;
    text2.tag =  2;
    [text2 addTarget:self action:@selector(changeValue:) forControlEvents:UIControlEventEditingChanged];
    [self.view addSubview:text2];
    
    UILabel *myLable3 = [[UILabel alloc]initWithFrame:CGRectMake(labelMarginLeft, labelMarginTop+labelHeight*2, labelWidth, labelHeight)];
    myLable3.textAlignment = NSTextAlignmentLeft;
    myLable3.text = @"省份: ";
    [self.view addSubview:myLable3];
    
    UITextField *text3 = [[UITextField alloc] initWithFrame:CGRectMake(labelMarginLeft+labelWidth, labelMarginTop+labelHeight*2, self.view.bounds.size.width-labelWidth, labelHeight )];
    text3.text = [self.onePerson valueForKey:@"province"];
    text3.delegate = self;
    text3.tag = 3;
    [text3 addTarget:self action:@selector(changeValue:) forControlEvents:UIControlEventEditingChanged];
    [self.view addSubview:text3];
    
    UILabel *myLable4 = [[UILabel alloc]initWithFrame:CGRectMake(labelMarginLeft, labelMarginTop+labelHeight*3, labelWidth, labelHeight)];
    myLable4.textAlignment = NSTextAlignmentLeft;
    myLable4.text = @"email: ";
    [self.view addSubview:myLable4];
    
    UITextField *text4 = [[UITextField alloc] initWithFrame:CGRectMake(labelMarginLeft+labelWidth, labelMarginTop+labelHeight*3, self.view.bounds.size.width-labelWidth, labelHeight )];
    text4.text = [self.onePerson valueForKey:@"email"];
    text4.delegate = self;
    text4.tag = 4;
    [text4 addTarget:self action:@selector(changeValue:) forControlEvents:UIControlEventEditingChanged];
    [self.view addSubview:text4];
    
    UILabel *myLable5 = [[UILabel alloc]initWithFrame:CGRectMake(labelMarginLeft, labelMarginTop+labelHeight*4, labelWidth, labelHeight)];
    myLable5.textAlignment = NSTextAlignmentLeft;
    myLable5.text = @"地址: ";
    
    [self.view addSubview:myLable5];
    
    UITextField *text5 = [[UITextField alloc] initWithFrame:CGRectMake(labelMarginLeft+labelWidth, labelMarginTop+labelHeight*4, self.view.bounds.size.width-labelWidth, labelHeight )];
    text5.text = [self.onePerson valueForKey:@"address"];
    text5.delegate = self;
    text5.tag = 5;
    [text5 addTarget:self action:@selector(changeValue:) forControlEvents:UIControlEventEditingChanged];
    [self.view addSubview:text5];
}

- (void)submit{
    
    UIAlertController* alertController = [UIAlertController alertControllerWithTitle:@"提示" message:@"确认修改？" preferredStyle:UIAlertControllerStyleAlert];
    
    UIAlertAction* noAction = [UIAlertAction actionWithTitle:@"否" style:UIAlertActionStyleCancel handler:^(UIAlertAction* action){
        NSLog(@"Tap No Button");
    }];
    
    UIAlertAction* yesAction = [UIAlertAction actionWithTitle:@"是" style:UIAlertActionStyleDefault handler:^(UIAlertAction* action){
        NSLog(@"sub");
        NSFetchRequest *deleRequest = [NSFetchRequest fetchRequestWithEntityName:@"Person"];
        
        //删除条件
        NSPredicate *pre = [NSPredicate predicateWithFormat:@"name = %@", [self.onePerson valueForKey:@"name"]];
        deleRequest.predicate = pre;
        
        //返回需要删除的对象数组
        NSArray *deleArray = [_context executeFetchRequest:deleRequest error:nil];
        //从数据库中删除
        for (Person *per in deleArray) {
            if(name){
                per.name = name;
            }
            if(phone){
                per.phone = phone;
            }
            if(mail){
                per.email = mail;
            }
            if(province){
                per.province = province;
            }
            if(address){
                per.address = address;
            }
        }
        
        NSError *error = nil;
        //保存--记住保存
        if ([_context save:&error]) {
            //[self alertViewWithMessage:@"删除 age < 10 的数据"];
            NSLog(@"更改数据成功！");
            [self.navigationController popViewControllerAnimated:YES];
        }else{
            NSLog(@"更改数据失败, %@", error);
        }
        [self.navigationController popToRootViewControllerAnimated:YES];
    }];
    [alertController addAction:noAction];
    [alertController addAction:yesAction];
                                
    //显示
    [self presentViewController:alertController animated:YES completion:nil];
}

- (void)changeValue:(UITextField*)sender{
    NSLog(@"sender.tag%ld",(long)sender.tag);
    switch (sender.tag) {
        case 1:
            name = sender.text;
            break;
        case 2:
            phone = sender.text;
            break;
        case 3:
            mail = sender.text;
            break;
        case 4:
            province = sender.text;
            break;
        case 5:
            address = sender.text;
            break;
        default:
            break;
    }
}

- (void) nspress:(id)sender{
    [[NSNotificationCenter defaultCenter] postNotificationName:@"NOTIEF" object:self];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
}

@end

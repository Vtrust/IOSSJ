//
//  NewViewController.m
//  ViewSwitch
//
//  Created by vtrust on 2018/3/14.
//  Copyright © 2018年 vtrust. All rights reserved.
//

#import "NewViewController.h"
#import "changeView.h"

@interface NewViewController ()

@end

@implementation NewViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.

    
    
    self.view.backgroundColor = [UIColor whiteColor];
    UILabel *myLable1 = [[UILabel alloc]initWithFrame:CGRectMake(20, 65, self.view.bounds.size.width-20, 50)];
    myLable1.textAlignment = NSTextAlignmentLeft;
    myLable1.text = @"姓名";
    [self.view addSubview:myLable1];
    
    UILabel *myLable2 = [[UILabel alloc]initWithFrame:CGRectMake(20, 65+50*2, self.view.bounds.size.width-20, 50)];
    myLable2.textAlignment = NSTextAlignmentLeft;
    myLable2.text = @"手机";
    [self.view addSubview:myLable2];
    
    UILabel *myLable3 = [[UILabel alloc]initWithFrame:CGRectMake(20, 65+50*2*2, self.view.bounds.size.width-20, 50)];
    myLable3.textAlignment = NSTextAlignmentLeft;
    myLable3.text = @"省份";
    [self.view addSubview:myLable3];
    
    UILabel *myLable4 = [[UILabel alloc]initWithFrame:CGRectMake(20, 65+50*3*2, self.view.bounds.size.width-20, 50)];
    myLable4.textAlignment = NSTextAlignmentLeft;
    myLable4.text = @"email";
    [self.view addSubview:myLable4];
    
    UILabel *myLable5 = [[UILabel alloc]initWithFrame:CGRectMake(20, 65+50*4*2, self.view.bounds.size.width-20, 50)];
    myLable5.textAlignment = NSTextAlignmentLeft;
    myLable5.text = @"地址";
    [self.view addSubview:myLable5];
    
    
    
    NSLog(@"dsdsfs%@",[self.onePhone objectForKey:@"name"]);
    UIButton *myButton1 = [[UIButton alloc] initWithFrame:CGRectMake(0, 65+50, self.view.bounds.size.width, 50 )];
    //myButton1.backgroundColor = [UIColor whiteColor];
    [myButton1 setTitle:[self.onePhone objectForKey:@"name"] forState:UIControlStateNormal];
    [myButton1 setTitleColor:[UIColor blackColor] forState:UIControlStateNormal];
    [self.view addSubview:myButton1];
    
    UIButton *myButton2 = [[UIButton alloc] initWithFrame:CGRectMake(0, 65+50*3, self.view.bounds.size.width, 50 )];
    myButton2.backgroundColor = [UIColor whiteColor];
    [myButton2 setTitle:[self.onePhone objectForKey:@"手机"] forState:UIControlStateNormal];
    [myButton2 setTitleColor:[UIColor blackColor] forState:UIControlStateNormal];
    [self.view addSubview:myButton2];
    
    UIButton *myButton3 = [[UIButton alloc] initWithFrame:CGRectMake(0, 65+50*5, self.view.bounds.size.width, 50 )];
    //myButton3.backgroundColor = [UIColor whiteColor];
    [myButton3 setTitle:[self.onePhone objectForKey:@"省份"] forState:UIControlStateNormal];
    [myButton3 setTitleColor:[UIColor blackColor] forState:UIControlStateNormal];
    [self.view addSubview:myButton3];
    
    UIButton *myButton4 = [[UIButton alloc] initWithFrame:CGRectMake(0, 65+50*7, self.view.bounds.size.width, 50 )];
    //myButton4.backgroundColor = [UIColor whiteColor];
    [myButton4 setTitle:[self.onePhone objectForKey:@"email"] forState:UIControlStateNormal];
    [myButton4 setTitleColor:[UIColor blackColor] forState:UIControlStateNormal];
    [self.view addSubview:myButton4];
    
    UIButton *myButton5 = [[UIButton alloc] initWithFrame:CGRectMake(0, 65+50*9, self.view.bounds.size.width, 50 )];
    //myButton5.backgroundColor = [UIColor whiteColor];
    [myButton5 setTitle:[self.onePhone objectForKey:@"地址"] forState:UIControlStateNormal];
    [myButton5 setTitleColor:[UIColor blackColor] forState:UIControlStateNormal];
    [self.view addSubview:myButton5];
    //    for (NSObject *obj in self.onePhone){
//        NSLog(@"enumKey: %@", obj);
//    }
    
    UIButton *myButton6 = [[UIButton alloc] initWithFrame:CGRectMake(20, 65+50*11, self.view.bounds.size.width-40, 50 )];
    [myButton6 setTitle:@"更改" forState:UIControlStateNormal];
    [myButton6 setTitleColor:[UIColor blackColor] forState:UIControlStateNormal];
    myButton6.backgroundColor = [UIColor greenColor];
    [myButton6 addTarget:self action:@selector(editView:) forControlEvents:UIControlEventTouchUpInside];
    [self.view addSubview:myButton6];
    
    UIButton *myButton7 = [[UIButton alloc] initWithFrame:CGRectMake(20, 20+65+50*12, self.view.bounds.size.width-40, 50 )];
    [myButton7 setTitle:@"删除" forState:UIControlStateNormal];
    [myButton7 setTitleColor:[UIColor blackColor] forState:UIControlStateNormal];
    myButton7.backgroundColor = [UIColor redColor];
    [myButton7 addTarget:self action:@selector(alertView:) forControlEvents:UIControlEventTouchUpInside];
    [self.view addSubview:myButton7];
    
    UIButton *myButton8 = [[UIButton alloc] initWithFrame:CGRectMake(20, 20+65+50*13, self.view.bounds.size.width-40, 50 )];
    [myButton8 setTitle:@"通知测试" forState:UIControlStateNormal];
    [myButton8 setTitleColor:[UIColor blackColor] forState:UIControlStateNormal];
    [myButton8 addTarget:self action:@selector(nspress:) forControlEvents:UIControlEventTouchUpInside];
    [self.view addSubview:myButton8];
    
    
    [[NSNotificationCenter defaultCenter] addObserver:self selector:@selector(my1) name:@"NOTIEF" object:nil];

    
    
    
}

//-(void)add:(id)sender{
//    NSLog(@"Tap Add");
//}
- (void)my1{
    NSLog(@"1111111");
}

- (void) nspress:(id)sender{
    [[NSNotificationCenter defaultCenter] postNotificationName:@"NOTIEF" object:self];
}

- (void)switchButtonPressed:(id)sender {
    NSLog(@"myDemoButtonPressed");
    [self.navigationController popViewControllerAnimated:YES];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (void)alertView:(id)sender {
    UIAlertController* alertController = [UIAlertController alertControllerWithTitle:@"提示" message:@"确认删除改联系人？" preferredStyle:UIAlertControllerStyleAlert];
    
    UIAlertAction* noAction = [UIAlertAction actionWithTitle:@"否" style:UIAlertActionStyleCancel handler:^(UIAlertAction* action){
        NSLog(@"Tap No Button");
    }];
    
    UIAlertAction* yesAction = [UIAlertAction actionWithTitle:@"是" style:UIAlertActionStyleDefault handler:^(UIAlertAction* action){
        NSLog(@"Tap Yes Button");
    }];
    
    [alertController addAction:noAction];
    [alertController addAction:yesAction];
    
    //显示
    [self presentViewController:alertController animated:YES completion:nil];
}

//编辑按钮点击事件
- (void)editView:(id)sender {
    changeView *newView=[[changeView alloc] init];
//    NSMutableDictionary * dict2 = [NSMutableDictionary dictionaryWithCapacity:5];
//    [dict2 setObject:self.listTeam[selectedIndex] forKey:@"name"];
//    [dict2 addEntriesFromDictionary:dict];
//    newView.onePhone =dict2;
    newView.onePhone = self.onePhone;
    NSLog(@"Tap Edit");
    [self.navigationController pushViewController:newView animated:YES];
}


@end


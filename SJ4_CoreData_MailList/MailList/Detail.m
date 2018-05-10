//
//  Detail.m
//  MailList
//
//  Created by vtrust on 2018/3/28.
//  Copyright © 2018年 vtrust. All rights reserved.
//

#import "Detail.h"
#import "Edit.h"
#import "Person+CoreDataClass.h"

@interface Detail ()

@end

@implementation Detail

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    UIBarButtonItem* addButtonItem = [[UIBarButtonItem alloc]initWithBarButtonSystemItem:UIBarButtonSystemItemTrash target:self action:@selector(alertView:)];
    self.navigationItem.rightBarButtonItem = addButtonItem;
    
    UIScrollView *sview = [[UIScrollView alloc]initWithFrame:self.view.frame];
    //sview.contentSize = CGSizeMake(self.view.bounds.size.width, 20.0+65+50*15);
    
    int labelWidth = 60;
    int labelHeight = 50;
    int labelMarginLeft = 20;
    int labelMarginTop = 0;

    [self.view addSubview:sview];
    self.view.backgroundColor = [UIColor whiteColor];
    UILabel *myLable1 = [[UILabel alloc]initWithFrame:CGRectMake(labelMarginLeft, labelMarginTop, labelWidth, labelHeight)];
    myLable1.textAlignment = NSTextAlignmentLeft;
    myLable1.text = @"姓名: ";
    [sview addSubview:myLable1];
    
    UIButton *text1 = [[UIButton alloc] initWithFrame:CGRectMake(labelMarginLeft+labelWidth, labelMarginTop, self.view.bounds.size.width-labelWidth, labelHeight )];
    [text1 setTitle:[self.onePerson valueForKey:@"name"]forState:UIControlStateNormal];
    [text1 setTitleColor:[UIColor blackColor] forState:UIControlStateNormal];
    text1.contentHorizontalAlignment = UIControlContentHorizontalAlignmentLeft;
    [sview addSubview:text1];
    
    UILabel *myLable2 = [[UILabel alloc]initWithFrame:CGRectMake(labelMarginLeft, labelMarginTop+labelHeight, labelWidth, labelHeight)];
    myLable2.textAlignment = NSTextAlignmentLeft;
    myLable2.text = @"手机: ";
    [sview addSubview:myLable2];
    
    UIButton *text2 = [[UIButton alloc] initWithFrame:CGRectMake(labelMarginLeft+labelWidth , labelMarginTop+labelHeight, self.view.bounds.size.width-labelWidth, labelHeight )];
    [text2 setTitle:[self.onePerson valueForKey:@"phone"] forState:UIControlStateNormal];
    [text2 setTitleColor:[UIColor blackColor] forState:UIControlStateNormal];
    text2.contentHorizontalAlignment = UIControlContentHorizontalAlignmentLeft;
    [sview addSubview:text2];
    
    UILabel *myLable3 = [[UILabel alloc]initWithFrame:CGRectMake(labelMarginLeft, labelMarginTop+labelHeight*2, labelWidth, labelHeight)];
    myLable3.textAlignment = NSTextAlignmentLeft;
    myLable3.text = @"省份: ";
    [sview addSubview:myLable3];
    
    UIButton *text3 = [[UIButton alloc] initWithFrame:CGRectMake(labelMarginLeft+labelWidth, labelMarginTop+labelHeight*2, self.view.bounds.size.width-labelWidth, labelHeight )];
    [text3 setTitle:[self.onePerson valueForKey:@"province"] forState:UIControlStateNormal];
    [text3 setTitleColor:[UIColor blackColor] forState:UIControlStateNormal];
    text3.contentHorizontalAlignment = UIControlContentHorizontalAlignmentLeft;
    [sview addSubview:text3];
    
    UILabel *myLable4 = [[UILabel alloc]initWithFrame:CGRectMake(labelMarginLeft, labelMarginTop+labelHeight*3, labelWidth, labelHeight)];
    myLable4.textAlignment = NSTextAlignmentLeft;
    myLable4.text = @"email: ";
    [sview addSubview:myLable4];
    
    UIButton *text4 = [[UIButton alloc] initWithFrame:CGRectMake(labelMarginLeft+labelWidth, labelMarginTop+labelHeight*3, self.view.bounds.size.width-labelWidth, labelHeight )];
    [text4 setTitle:[self.onePerson valueForKey:@"email"] forState:UIControlStateNormal];
    [text4 setTitleColor:[UIColor blackColor] forState:UIControlStateNormal];
    text4.contentHorizontalAlignment = UIControlContentHorizontalAlignmentLeft;
    [sview addSubview:text4];
    
    UILabel *myLable5 = [[UILabel alloc]initWithFrame:CGRectMake(labelMarginLeft, labelMarginTop+labelHeight*4, labelWidth, labelHeight)];
    myLable5.textAlignment = NSTextAlignmentLeft;
    myLable5.text = @"地址: ";
    
    [sview addSubview:myLable5];
    
    UIButton *text5 = [[UIButton alloc] initWithFrame:CGRectMake(labelMarginLeft+labelWidth, labelMarginTop+labelHeight*4, self.view.bounds.size.width-labelWidth, labelHeight )];
    [text5 setTitle:[self.onePerson valueForKey:@"address"] forState:UIControlStateNormal];
    [text5 setTitleColor:[UIColor blackColor] forState:UIControlStateNormal];
    text5.contentHorizontalAlignment = UIControlContentHorizontalAlignmentLeft;
    [sview addSubview:text5];
    
//    self.view.backgroundColor = [UIColor whiteColor];
//    UILabel *myLable1 = [[UILabel alloc]initWithFrame:CGRectMake(20, 65, self.view.bounds.size.width-20, 50)];
//    myLable1.textAlignment = NSTextAlignmentLeft;
//    myLable1.text = @"姓名";
//    [sview addSubview:myLable1];
//
//    UILabel *myLable2 = [[UILabel alloc]initWithFrame:CGRectMake(20, 65+50*2, self.view.bounds.size.width-20, 50)];
//    myLable2.textAlignment = NSTextAlignmentLeft;
//    myLable2.text = @"手机";
//    [sview addSubview:myLable2];
//
//    UILabel *myLable3 = [[UILabel alloc]initWithFrame:CGRectMake(20, 65+50*2*2, self.view.bounds.size.width-20, 50)];
//    myLable3.textAlignment = NSTextAlignmentLeft;
//    myLable3.text = @"省份";
//    [sview addSubview:myLable3];
//
//    UILabel *myLable4 = [[UILabel alloc]initWithFrame:CGRectMake(20, 65+50*3*2, self.view.bounds.size.width-20, 50)];
//    myLable4.textAlignment = NSTextAlignmentLeft;
//    myLable4.text = @"email";
//    [sview addSubview:myLable4];
//
//    UILabel *myLable5 = [[UILabel alloc]initWithFrame:CGRectMake(20, 65+50*4*2, self.view.bounds.size.width-20, 50)];
//    myLable5.textAlignment = NSTextAlignmentLeft;
//    myLable5.text = @"地址";
//    [sview addSubview:myLable5];
//
//
//
//    UIButton *myButton1 = [[UIButton alloc] initWithFrame:CGRectMake(0, 65+50, self.view.bounds.size.width, 50 )];
//    [myButton1 setTitle:[self.onePerson valueForKey:@"name"] forState:UIControlStateNormal];
//    [myButton1 setTitleColor:[UIColor blackColor] forState:UIControlStateNormal];
//    [sview addSubview:myButton1];
//
//    UIButton *myButton2 = [[UIButton alloc] initWithFrame:CGRectMake(0, 65+50*3, self.view.bounds.size.width, 50 )];
//    myButton2.backgroundColor = [UIColor whiteColor];
//    [myButton2 setTitle:[self.onePerson valueForKey:@"phone"] forState:UIControlStateNormal];
//    [myButton2 setTitleColor:[UIColor blackColor] forState:UIControlStateNormal];
//    [sview addSubview:myButton2];
//
//    UIButton *myButton3 = [[UIButton alloc] initWithFrame:CGRectMake(0, 65+50*5, self.view.bounds.size.width, 50 )];
//    [myButton3 setTitle:[self.onePerson valueForKey:@"province"] forState:UIControlStateNormal];
//    [myButton3 setTitleColor:[UIColor blackColor] forState:UIControlStateNormal];
//    [sview addSubview:myButton3];
//
//    UIButton *myButton4 = [[UIButton alloc] initWithFrame:CGRectMake(0, 65+50*7, self.view.bounds.size.width, 50 )];
//    [myButton4 setTitle:[self.onePerson valueForKey:@"email"] forState:UIControlStateNormal];
//    [myButton4 setTitleColor:[UIColor blackColor] forState:UIControlStateNormal];
//    [sview addSubview:myButton4];
//
//    UIButton *myButton5 = [[UIButton alloc] initWithFrame:CGRectMake(0, 65+50*9, self.view.bounds.size.width, 50 )];
//    [myButton5 setTitle:[self.onePerson valueForKey:@"address"] forState:UIControlStateNormal];
//    [myButton5 setTitleColor:[UIColor blackColor] forState:UIControlStateNormal];
//    [sview addSubview:myButton5];
    
    UIButton *myButton6 = [[UIButton alloc] initWithFrame:CGRectMake(20, 65+50*4, self.view.bounds.size.width-40, 50 )];
    [myButton6 setTitle:@"更改" forState:UIControlStateNormal];
    [myButton6 setTitleColor:[UIColor blackColor] forState:UIControlStateNormal];
    myButton6.backgroundColor = [UIColor greenColor];
    [myButton6 addTarget:self action:@selector(editView:) forControlEvents:UIControlEventTouchUpInside];
    [sview addSubview:myButton6];


}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

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

- (void)alertView:(id)sender {
    UIAlertController* alertController = [UIAlertController alertControllerWithTitle:@"提示" message:@"确认删除改联系人？" preferredStyle:UIAlertControllerStyleAlert];
    
    UIAlertAction* noAction = [UIAlertAction actionWithTitle:@"否" style:UIAlertActionStyleCancel handler:^(UIAlertAction* action){
        NSLog(@"Tap No Button");
    }];
    
    UIAlertAction* yesAction = [UIAlertAction actionWithTitle:@"是" style:UIAlertActionStyleDefault handler:^(UIAlertAction* action){
        NSLog(@"Tap Yes Button");
        
        //创建删除请求
        NSFetchRequest *deleRequest = [NSFetchRequest fetchRequestWithEntityName:@"Person"];
        
        //删除条件
        NSPredicate *pre = [NSPredicate predicateWithFormat:@"name = %@", [self.onePerson valueForKey:@"name"]];
        deleRequest.predicate = pre;
        
        //返回需要删除的对象数组
        NSArray *deleArray = [_context executeFetchRequest:deleRequest error:nil];
        NSLog(@"--1--%@",deleArray);
        //从数据库中删除
        for (Person *per in deleArray) {
            NSLog(@"--2--%@",per);
            [_context deleteObject:per];
        }
        

        
        NSError *error = nil;
        //保存--记住保存
        if ([_context save:&error]) {
            //[self alertViewWithMessage:@"删除 age < 10 的数据"];
            NSLog(@"删除数据成功！");
            [self.navigationController popViewControllerAnimated:YES];
        }else{
            NSLog(@"删除数据失败, %@", error);
        }
    }];
    
    [alertController addAction:noAction];
    [alertController addAction:yesAction];
    
    //显示
    [self presentViewController:alertController animated:YES completion:nil];
}

//编辑按钮点击事件
- (void)editView:(id)sender {
    Edit *edit=[[Edit alloc] init];
    edit.onePerson = self.onePerson;
    edit.context = self.context;
    [self.navigationController pushViewController:edit animated:YES];
}

@end

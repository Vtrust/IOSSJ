//
//  changeView.m
//  ViewSwitch
//
//  Created by vtrust on 2018/3/19.
//  Copyright © 2018年 vtrust. All rights reserved.
//

#import "changeView.h"


@interface changeView ()

@end

@implementation changeView

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
    int labelWidth = 60;
    int labelHeight = 50;
    int labelMarginLeft = 20;
    int labelMarginTop = 65;

    
    self.view.backgroundColor = [UIColor whiteColor];
    UILabel *myLable1 = [[UILabel alloc]initWithFrame:CGRectMake(labelMarginLeft, labelMarginTop, labelWidth, labelHeight)];
    myLable1.textAlignment = NSTextAlignmentLeft;
    myLable1.text = @"姓名: ";
    [self.view addSubview:myLable1];
    
    UITextField *text1 = [[UITextField alloc] initWithFrame:CGRectMake(labelMarginLeft+labelWidth, labelMarginTop, self.view.bounds.size.width-labelWidth, labelHeight )];
    text1.text = [self.onePhone objectForKey:@"name"];
    text1.delegate = self;
    [self.view addSubview:text1];
    
    UILabel *myLable2 = [[UILabel alloc]initWithFrame:CGRectMake(labelMarginLeft, labelMarginTop+labelHeight, labelWidth, labelHeight)];
    myLable2.textAlignment = NSTextAlignmentLeft;
    myLable2.text = @"手机: ";
    [self.view addSubview:myLable2];
    
    UITextField *text2 = [[UITextField alloc] initWithFrame:CGRectMake(labelMarginLeft+labelWidth , labelMarginTop+labelHeight, self.view.bounds.size.width-labelWidth, labelHeight )];
    text2.text = [self.onePhone objectForKey:@"手机"];
    text2.delegate = self;
    [self.view addSubview:text2];
    
    UILabel *myLable3 = [[UILabel alloc]initWithFrame:CGRectMake(labelMarginLeft, labelMarginTop+labelHeight*2, labelWidth, labelHeight)];
    myLable3.textAlignment = NSTextAlignmentLeft;
    myLable3.text = @"省份: ";
    [self.view addSubview:myLable3];
    
    UITextField *text3 = [[UITextField alloc] initWithFrame:CGRectMake(labelMarginLeft+labelWidth, labelMarginTop+labelHeight*2, self.view.bounds.size.width-labelWidth, labelHeight )];
    text3.text = [self.onePhone objectForKey:@"省份"];
    text3.delegate = self;
    [self.view addSubview:text3];
    
    UILabel *myLable4 = [[UILabel alloc]initWithFrame:CGRectMake(labelMarginLeft, labelMarginTop+labelHeight*3, labelWidth, labelHeight)];
    myLable4.textAlignment = NSTextAlignmentLeft;
    myLable4.text = @"email: ";
    [self.view addSubview:myLable4];
    
    UITextField *text4 = [[UITextField alloc] initWithFrame:CGRectMake(labelMarginLeft+labelWidth, labelMarginTop+labelHeight*3, self.view.bounds.size.width-labelWidth, labelHeight )];
    text4.text = [self.onePhone objectForKey:@"email"];
    text4.delegate = self;
    [self.view addSubview:text4];
    
    UILabel *myLable5 = [[UILabel alloc]initWithFrame:CGRectMake(labelMarginLeft, labelMarginTop+labelHeight*4, labelWidth, labelHeight)];
    myLable5.textAlignment = NSTextAlignmentLeft;
    myLable5.text = @"地址: ";
    [self.view addSubview:myLable5];
    
    UITextField *text5 = [[UITextField alloc] initWithFrame:CGRectMake(labelMarginLeft+labelWidth, labelMarginTop+labelHeight*4, self.view.bounds.size.width-labelWidth, labelHeight )];
    text5.text = [self.onePhone objectForKey:@"地址"];
    text5.delegate = self;
    [self.view addSubview:text5];
    
    
    UIButton *myButton6 = [[UIButton alloc] initWithFrame:CGRectMake(20, labelMarginTop+labelHeight*6, self.view.bounds.size.width-40, 50 )];
    [myButton6 setTitle:@"更改" forState:UIControlStateNormal];
    [myButton6 setTitleColor:[UIColor blackColor] forState:UIControlStateNormal];
    myButton6.backgroundColor = [UIColor greenColor];
    [self.view addSubview:myButton6];
    
    UIButton *myButton8 = [[UIButton alloc] initWithFrame:CGRectMake(20, labelMarginTop+labelHeight*7, self.view.bounds.size.width-40, 50 )];
    [myButton8 setTitle:@"通知测试" forState:UIControlStateNormal];
    [myButton8 setTitleColor:[UIColor blackColor] forState:UIControlStateNormal];
    [myButton8 addTarget:self action:@selector(nspress:) forControlEvents:UIControlEventTouchUpInside];
    [self.view addSubview:myButton8];

     [[NSNotificationCenter defaultCenter] addObserver:self selector:@selector(my2) name:@"NOTIEF" object:nil];
}

- (void)my2{
    NSLog(@"22222");
}

- (void) nspress:(id)sender{
    [[NSNotificationCenter defaultCenter] postNotificationName:@"NOTIEF" object:self];
}
@end

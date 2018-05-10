//
//  ViewController.m
//  gbbg
//
//  Created by OurEDA on 2018/3/5.
//  Copyright © 2018年 OurEDA. All rights reserved.
//

#import "ViewController.h"


#define Height [[UIScreen mainScreen] bounds].size.height
#define Width [[UIScreen mainScreen] bounds].size.width

@interface ViewController ()

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
    
//    UIButton *myDemoBtn = [[UIButton alloc] initWithFrame:CGRectMake(50, 50, 100, 50)];
//    myDemoBtn.backgroundColor = [UIColor grayColor];
//    [myDemoBtn setTitle:@"BUTTON" forState:UIControlStateNormal];
//    [myDemoBtn setTitle:@"PRESED" forState:UIControlStateHighlighted];
//    [myDemoBtn addTarget:self action:@selector(btnPP:) forControlEvents:UIControlEventTouchUpInside];
//    [self.view addSubview:myDemoBtn];
    
    
//    UISegmentedControl *mySC = [[UISegmentedControl alloc] initWithItems:[[NSArray alloc] initWithObjects:@"1",@"2",@"3", nil]];
//    [mySC setFrame:CGRectMake(20, 300, 100, 50)];
//    mySC.backgroundColor = [UIColor grayColor];
//    [mySC setTitleTextAttributes:@{NSForegroundColorAttributeName:[UIColor whiteColor]} forState:UIControlStateSelected];
//    mySC.selectedSegmentIndex = 2;
//    [self.view addSubview:mySC];
//
//
//    myDemoSlider = [[UISlider alloc] initWithFrame:CGRectMake(50, 50, 300, 50)];
//
//    myDemoSlider.maximumValue = 100.0;
//    myDemoSlider.minimumValue = 0.0;
//    myDemoSlider.value = 20.0;
//    myDemoSlider.continuous = NO;
//    //UIImage *SliderImage = [UIImage imageNamed:@"timg.jpg"];
//    //[myDemoSlider setThumbImage:SliderImage forState:UIControlStateNormal];
//   [myDemoSlider addTarget:self action:@selector(myDemoSS:) forControlEvents:UIControlEventValueChanged];
//
//    [self.view addSubview:myDemoSlider];
//
//    UISwitch *myDemoSwitch = [[UISwitch alloc] initWithFrame:CGRectMake(20, 200, 1, 1)];
//    [myDemoSwitch setOn:YES];
//    [self.view addSubview:myDemoSwitch];
//
//    UIPageControl *myPC = [[UIPageControl alloc] initWithFrame:CGRectMake(20, 450, 200, 200)];
//    myPC.numberOfPages = 6;
//    myPC.currentPage = 3;
//    [myPC setBackgroundColor:[UIColor purpleColor]];
//    [self.view addSubview:myPC];
//
//    UIActionSheet *myActionSheet = [[UIActionSheet alloc]
//    initWithTitle:@"ActionSheet" delegate:self cancelButtonTitle:@"Cancel" destructiveButtonTitle:@"YES" otherButtonTitles:@"Other", nil];
//    [myActionSheet showInView:self.view];
    
//    CGSize screenSize = [[UIScreen mainScreen] bounds].size;
//    CGFloat width = screenSize.width;
//    CGFloat height = screenSize.height;
    
    
    scrollView = [[UIScrollView alloc] initWithFrame:CGRectMake(0, 0, Width, Height)];
    [scrollView setContentSize:CGSizeMake(Width*4, Height)];
    [scrollView setDelegate:self];
    scrollView.pagingEnabled = YES;
    
    UIImageView *imageView1 = [[UIImageView alloc] initWithFrame:CGRectMake(0, 0, Width, Height)];
    [imageView1 setImage:[UIImage imageNamed:@"001.jpg"]];
    imageView1.contentMode = UIViewContentModeScaleAspectFill;
    imageView1.clipsToBounds = YES;
    
    UIImageView *imageView2 = [[UIImageView alloc] initWithFrame:CGRectMake(Width, 0, Width, Height)];
    [imageView2 setImage:[UIImage imageNamed:@"002.jpg"]];
    imageView2.contentMode = UIViewContentModeScaleAspectFill;
    imageView2.clipsToBounds = YES;
    
    UIImageView *imageView3 = [[UIImageView alloc] initWithFrame:CGRectMake(Width*2, 0, Width, Height)];
    [imageView3 setImage:[UIImage imageNamed:@"003.jpg"]];
    imageView3.contentMode = UIViewContentModeScaleAspectFill;
    imageView3.clipsToBounds = YES;
    
    UIImageView *imageView4 = [[UIImageView alloc] initWithFrame:CGRectMake(Width*3, 0, Width, Height)];
    [imageView4 setImage:[UIImage imageNamed:@"004.jpg"]];
    imageView4.contentMode = UIViewContentModeScaleAspectFill;
    imageView4.clipsToBounds = YES;
    
    [scrollView addSubview:imageView1];
    [scrollView addSubview:imageView2];
    [scrollView addSubview:imageView3];
    [scrollView addSubview:imageView4];
    
    [self.view addSubview:scrollView];
    
    pageControl = [[UIPageControl alloc] initWithFrame:CGRectMake(0, Height-50, Width, 30)];
    pageControl.numberOfPages = 4;
    pageControl.currentPage = 0;
    [pageControl addTarget:self action:@selector(pageChanged:) forControlEvents:UIControlEventValueChanged];
    [self.view addSubview:pageControl];
}
- (void)btnPP:(id)sender{
    NSLog(@"PRESS");
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (void)myDemoSS:(id)sender{
    if(sender == myDemoSlider){
        NSLog(@"%f",myDemoSlider.value);
    }
}

- (void)scrollViewDidEndDecelerating:(UIScrollView *)scrollView{
    CGPoint offset = scrollView.contentOffset;
    CGRect bounds = scrollView.frame;
    [pageControl setCurrentPage:offset.x/bounds.size.width];
    NSLog(@"%ld",pageControl.currentPage);
}

- (void)pageChanged:(id)sender{
    CGSize viewSize = scrollView.frame.size;
    CGRect rectBounds = CGRectMake(pageControl.currentPage * viewSize.width, 0, viewSize.width, viewSize.height);
    [scrollView scrollRectToVisible:rectBounds animated:YES];
}




@end

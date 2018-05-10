//
//  ViewController.h
//  gbbg
//
//  Created by OurEDA on 2018/3/5.
//  Copyright © 2018年 OurEDA. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface ViewController : UIViewController<UIApplicationDelegate,UIScrollViewDelegate>
{
    UIScrollView *scrollView;
    UIPageControl *pageControl;
    UISlider *myDemoSlider;
    
}

@end


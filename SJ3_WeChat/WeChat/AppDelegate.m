//
//  AppDelegate.m
//  WeChat
//
//  Created by vtrust on 2018/3/21.
//  Copyright © 2018年 vtrust. All rights reserved.
//

#import "AppDelegate.h"

#import "ViewController1.h"
#import "ViewController2.h"
#import "ViewController3.h"
#import "ViewController4.h"

@interface AppDelegate ()

@end

@implementation AppDelegate


- (BOOL)application:(UIApplication *)application didFinishLaunchingWithOptions:(NSDictionary *)launchOptions {
    // Override point for customization after application launch.
    self.window = [[UIWindow alloc]initWithFrame:[[UIScreen mainScreen]bounds]];
    [self.window makeKeyAndVisible];
    
    UITabBarController* tabBarController = [[UITabBarController alloc]init];
    self.window.rootViewController = tabBarController;
    
    UIViewController *view1 = [[ViewController1 alloc]init];
    UIViewController *view2 = [[ViewController2 alloc]init];
    UIViewController *view3 = [[ViewController3 alloc]init];
    UIViewController *view4 = [[ViewController4 alloc]init];
    
    UINavigationController *nav1 = [[UINavigationController alloc] initWithRootViewController:view1];
    nav1.tabBarItem.title = @"微信";
    nav1.tabBarItem.image = [UIImage imageNamed:@"消息.png"];
    
    UINavigationController *nav2 = [[UINavigationController alloc] initWithRootViewController:view2];
    nav2.tabBarItem.title = @"通讯录";
    nav2.tabBarItem.image = [UIImage imageNamed:@"通讯录.png"];
    
    UINavigationController *nav3 = [[UINavigationController alloc] initWithRootViewController:view3];
    nav3.tabBarItem.title = @"发现";
    nav3.tabBarItem.image = [UIImage imageNamed:@"发现.png"];
    
    UINavigationController *nav4 = [[UINavigationController alloc] initWithRootViewController:view4];
    nav4.tabBarItem.title = @"我";
    nav4.tabBarItem.image = [UIImage imageNamed:@"我.png"];
    
    tabBarController.viewControllers = @[nav1,nav2,nav3,nav4];
    tabBarController.tabBar.tintColor = [UIColor colorWithRed:70.0/255 green:192.0/255 blue:27.0/255 alpha:1];

    
    
    return YES;
}


- (void)applicationWillResignActive:(UIApplication *)application {
    // Sent when the application is about to move from active to inactive state. This can occur for certain types of temporary interruptions (such as an incoming phone call or SMS message) or when the user quits the application and it begins the transition to the background state.
    // Use this method to pause ongoing tasks, disable timers, and invalidate graphics rendering callbacks. Games should use this method to pause the game.
}


- (void)applicationDidEnterBackground:(UIApplication *)application {
    // Use this method to release shared resources, save user data, invalidate timers, and store enough application state information to restore your application to its current state in case it is terminated later.
    // If your application supports background execution, this method is called instead of applicationWillTerminate: when the user quits.
}


- (void)applicationWillEnterForeground:(UIApplication *)application {
    // Called as part of the transition from the background to the active state; here you can undo many of the changes made on entering the background.
}


- (void)applicationDidBecomeActive:(UIApplication *)application {
    // Restart any tasks that were paused (or not yet started) while the application was inactive. If the application was previously in the background, optionally refresh the user interface.
}


- (void)applicationWillTerminate:(UIApplication *)application {
    // Called when the application is about to terminate. Save data if appropriate. See also applicationDidEnterBackground:.
}


@end

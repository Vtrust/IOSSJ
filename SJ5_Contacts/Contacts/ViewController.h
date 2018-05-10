//
//  ViewController.h
//  Contacts
//
//  Copyright © 2018年 Jiachi Xu. All rights reserved.
//

#import <UIKit/UIKit.h>
#import <BmobSDK/Bmob.h>
#import "Contacts.h"
#import "SpecInfoViewController.h"
#import "ContactTableViewCell.h"
//#import <ContactsUI/ContactsUI.h>
//#import <ContactsUI/CNContactViewController.h>
#import "Cntact+CoreDataClass.h"
#import <CoreData/CoreData.h>

@interface ViewController : UIViewController <UITableViewDelegate, UITableViewDataSource, UISearchBarDelegate, UISearchResultsUpdating> {
    
    //UISearchController *searchController;
    UITableView *tableView;
    
    NSMutableArray *indexArray;
    NSMutableArray *letterResultArr;
    
    UILabel *sectionTitleView;
    NSTimer *timer;
    
    // 下拉刷新
    UIRefreshControl *refreshControl;
    
    NSMutableArray *_infoMutableArray;
    NSMutableArray *_personsName;
    NSMutableArray *_tPersonsName;
    
    NSArray *personArray;
}

@property (strong, nonatomic)UISearchController *searchController;
@end


//
//  specInfoViewController.h
//  Contacts
//
//  Copyright © 2018年 Jiachi Xu. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "Cntact+CoreDataClass.h"
#import "Contacts.h"
#import "nameCell.h"
#import "PhoneCell.h"
#import "telPhoneCell.h"
#import "emailCell.h"
#import "OtherCell.h"

@interface SpecInfoViewController : UIViewController <UITableViewDelegate, UITableViewDataSource>{
    UITableView *detailInfoTable;
    
    NSString *name;
    NSString *phoneNum;
    NSString *telephone;
    NSString *email;
    NSString *department;
    NSString *office;
    
}

@property (nonatomic, strong) Contacts *contact;

// CoreData
@property (strong, nonatomic) Contacts *person;

@end

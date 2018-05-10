//
//  PhoneCell.h
//  Contacts
//
//  Copyright © 2018年 Jiachi Xu. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface PhoneCell : UITableViewCell

@property (strong, nonatomic) UILabel *phone;
@property (strong, nonatomic) UILabel *phoneNum;
@property (strong, nonatomic) UIButton *message;
@property (strong, nonatomic) UIButton *call;
@end

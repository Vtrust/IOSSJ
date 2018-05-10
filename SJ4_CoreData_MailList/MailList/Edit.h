//
//  Edit.h
//  MailList
//
//  Created by vtrust on 2018/3/28.
//  Copyright © 2018年 vtrust. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface Edit : UIViewController<UITextViewDelegate,UITextFieldDelegate>{
    NSString *name;
    NSString *phone;
    NSString *mail;
    NSString *province;
    NSString *address;
}

@property(nonatomic,strong)NSObject *onePerson;
@property(nonatomic,strong)NSManagedObjectContext *context;


@end

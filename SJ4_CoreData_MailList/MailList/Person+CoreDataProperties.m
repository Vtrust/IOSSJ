//
//  Person+CoreDataProperties.m
//  MailList
//
//  Created by vtrust on 2018/3/28.
//  Copyright © 2018年 vtrust. All rights reserved.
//
//

#import "Person+CoreDataProperties.h"

@implementation Person (CoreDataProperties)

+ (NSFetchRequest<Person *> *)fetchRequest {
	return [[NSFetchRequest alloc] initWithEntityName:@"Person"];
}

@dynamic name;
@dynamic phone;
@dynamic email;
@dynamic address;
@dynamic province;

@end

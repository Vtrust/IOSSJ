//
//  nameCell.m
//  Contacts
//
//  Copyright © 2018年 Jiachi Xu. All rights reserved.
//

#import "nameCell.h"

#define Width [[UIScreen mainScreen] bounds].size.width

@implementation nameCell

- (instancetype)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier{
    self = [super initWithStyle:style reuseIdentifier:reuseIdentifier];
    if (self){
        CGFloat imgViewHeight = 60;
        CGFloat imgViewWidth = 60;
        CGFloat imgViewLeft = 25;
        
        _img = [[UIImageView alloc] initWithFrame:CGRectMake(imgViewLeft, 20, imgViewWidth, imgViewHeight)];
        
        [self addSubview:_img];
        
        
        CGFloat nameWidth = 120;
        CGFloat nameHeight = 20;
        CGFloat nameLeft = 100;
        
        _name = [[UILabel alloc] initWithFrame:CGRectMake(nameLeft, 40, nameWidth, nameHeight)];
        
        [self addSubview:_name];
    }
    return self;
}

- (void)awakeFromNib {
    [super awakeFromNib];
    // Initialization code
}

- (void)setSelected:(BOOL)selected animated:(BOOL)animated {
    [super setSelected:selected animated:animated];

    // Configure the view for the selected state
}

@end

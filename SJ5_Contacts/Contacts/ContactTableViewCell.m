//
//  ContactTableViewCell.m
//  Contacts
//
//  Copyright © 2018年 Jiachi Xu. All rights reserved.
//

#import "ContactTableViewCell.h"

#define Width [[UIScreen mainScreen] bounds].size.width

@implementation ContactTableViewCell

- (instancetype)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier {
    self = [super initWithStyle:style reuseIdentifier:reuseIdentifier];
    if(self) {
        
        CGFloat imgHeight = 60;
        CGFloat imgWidth = 60;
        CGFloat imgLeft = 10;
        
        _img = [[UIImageView alloc] initWithFrame:CGRectMake(imgLeft, 10, imgWidth, imgHeight)];
        [self addSubview:_img];
        
        CGFloat nameLabelHeight = 22;
        CGFloat nameLabelWidth = Width - 90;
        CGFloat nameLabelLeft = 80;
        
        _nameLabel = [[UILabel alloc] initWithFrame:CGRectMake(nameLabelLeft, 10, nameLabelWidth, nameLabelHeight)];
        [self addSubview:_nameLabel];
        
        CGFloat phoneLabelHeight = 18;
        CGFloat phoneLabelWidth = Width - 90;
        CGFloat phoneLabelLeft = 80;
        
        _phoneNumLabel = [[UILabel alloc] initWithFrame:CGRectMake(phoneLabelLeft, 52, phoneLabelWidth, phoneLabelHeight)];
        [self addSubview:_phoneNumLabel];
    }
    
    return self;
}

- (void)awakeFromNib {
    [super awakeFromNib];
    // Initialization code
    
    self.img.layer.cornerRadius = 30;
    self.img.layer.masksToBounds = YES;
}

- (void)setSelected:(BOOL)selected animated:(BOOL)animated {
    [super setSelected:selected animated:animated];

    // Configure the view for the selected state
}

@end

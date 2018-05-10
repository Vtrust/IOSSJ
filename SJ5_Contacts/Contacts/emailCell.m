//
//  emailCell.m
//  Contacts
//
//  Copyright © 2018年 Jiachi Xu. All rights reserved.
//

#import "emailCell.h"

#define Width [[UIScreen mainScreen] bounds].size.width

@implementation emailCell

- (instancetype)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier {
    self = [super initWithStyle:style reuseIdentifier:reuseIdentifier];
    if (self) {
        
        CGFloat labelHeight = 15;
        CGFloat labelWidth = 60;
        CGFloat labelViewLeft = 25;
        
        _label = [[UILabel alloc] initWithFrame:CGRectMake(labelViewLeft, 15, labelWidth, labelHeight)];
        [_label setText:@"邮箱"];
        [_label setTextColor:[UIColor blueColor]];
        [self addSubview:_label];
        
        CGFloat labelheight2 = 20;
        CGFloat labelWidth2 = Width - 25;
        
        _email = [[UILabel alloc] initWithFrame:CGRectMake(labelViewLeft, 40, labelWidth2, labelheight2)];
        
        [self addSubview:_email];
        
//        CGFloat buttonHeight = 30;
//        CGFloat buttonWidth = 30;
//        CGFloat buttonLeft = Width - 50;
//
//        _call = [[UIButton alloc] initWithFrame:CGRectMake(buttonLeft, 22.5, buttonWidth, buttonHeight)];
//        [_call setBackgroundImage:[UIImage imageNamed:@"固话.png"] forState:UIControlStateNormal];
//        [self addSubview:_call];
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

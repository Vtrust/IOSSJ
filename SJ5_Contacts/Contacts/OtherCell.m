//
//  OtherCell.m
//  Contacts
//
//  Copyright © 2018年 Jiachi Xu. All rights reserved.
//

#import "OtherCell.h"

@implementation OtherCell

- (instancetype)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier {
    self = [super initWithStyle:style reuseIdentifier:reuseIdentifier];
    if(self) {
        
        
        CGFloat labelHeight = 15;
        CGFloat labelWidth = 60;
        CGFloat labelViewLeft = 25;
        
        _label1 = [[UILabel alloc] initWithFrame:CGRectMake(labelViewLeft, 15, labelWidth, labelHeight)];
        [_label1 setText:@"院系"];
        [_label1 setTextColor:[UIColor blueColor]];
        [self addSubview:_label1];
        
        CGFloat labelheight2 = 20;
        CGFloat labelWidth2 = 200;
        
        _department = [[UILabel alloc] initWithFrame:CGRectMake(labelViewLeft, 40, labelWidth2, labelheight2)];
        
        [self addSubview:_department];
        
        
        _label2 = [[UILabel alloc] initWithFrame:CGRectMake(labelViewLeft, 75, labelWidth, labelHeight)];
        [_label2 setText:@"办公室"];
        [_label2 setTextColor:[UIColor blueColor]];
        [self addSubview:_label2];
        
        _office = [[UILabel alloc] initWithFrame:CGRectMake(labelViewLeft, 100, labelWidth2, labelheight2)];
        [self addSubview:_office];
        
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

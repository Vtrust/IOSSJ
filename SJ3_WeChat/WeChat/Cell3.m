//
//  Cell3.m
//  WeChat
//
//  Created by vtrust on 2018/3/26.
//  Copyright © 2018年 vtrust. All rights reserved.
//

#import "Cell3.h"

@implementation Cell3

- (instancetype)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier{
    self = [super initWithStyle:style reuseIdentifier:reuseIdentifier];
    if(self){
        //单元格高度
        CGFloat cellH = self.frame.size.height;
        CGFloat imgW = 25;
        CGFloat imgH = 25;
        CGFloat imgVieLeVie = 5;
        
        self.myImageView = [[UIImageView alloc]initWithFrame:CGRectMake(imgVieLeVie, (cellH - imgH)/2, imgW, imgH)];
        
        [self addSubview:self.myImageView];
        
        //添加标签
        CGFloat labW = 120;
        CGFloat labH = 21;
        CGFloat labLeVie = 40;
        self.myLabel = [[UILabel alloc]initWithFrame:CGRectMake(labLeVie, (cellH-labH)/2, labW, labH)];
        [self addSubview:self.myLabel];
        
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

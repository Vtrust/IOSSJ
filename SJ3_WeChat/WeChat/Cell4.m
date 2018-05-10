//
//  Cell4.m
//  WeChat
//
//  Created by vtrust on 2018/3/28.
//  Copyright © 2018年 vtrust. All rights reserved.
//

#import "Cell4.h"

@implementation Cell4

- (instancetype)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier{
    self = [super initWithStyle:style reuseIdentifier:reuseIdentifier];
    if(self){
        //单元格高度
        //CGFloat cellH = self.frame.size.height;
        CGFloat cellW = self.frame.size.width;
//        CGFloat imgW = 25;
//        CGFloat imgH = 25;
//        CGFloat imgVieLeVie = 5;
//
//        self.myImageView = [[UIImageView alloc]initWithFrame:CGRectMake(imgVieLeVie, (cellH - imgH)/2, imgW, imgH)];
//
//        [self addSubview:self.myImageView];
//
//        //添加标签
//        CGFloat labW = 120;
//        CGFloat labH = 21;
//        CGFloat labLeVie = 40;
//        self.myLabel = [[UILabel alloc]initWithFrame:CGRectMake(labLeVie, (cellH-labH)/2, labW, labH)];
//        [self addSubview:self.myLabel];
        
        
        self.avator = [[UIImageView alloc]initWithFrame:CGRectMake(10, 10, 60, 60)];
        [self addSubview:self.avator];
        
        self.mName = [[UILabel alloc]initWithFrame:CGRectMake(80, 20, 100, 25)];
        self.mName.font = [UIFont systemFontOfSize:25];
        [self addSubview:self.mName];
        
        self.mNumber = [[UILabel alloc]initWithFrame:CGRectMake(80, 55, 200, 14)];
        self.mNumber.font = [UIFont systemFontOfSize:14];
        [self addSubview:self.mNumber];
        
        
        
        self.mQR = [[UIImageView alloc]initWithFrame:CGRectMake(cellW, 20, 25, 25)];
        [self addSubview:self.mQR];
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

//
//  Cell1.m
//  WeChat
//
//  Created by vtrust on 2018/3/21.
//  Copyright © 2018年 vtrust. All rights reserved.
//

#import "Cell1.h"

@implementation Cell1

- (instancetype)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier{
    self = [super initWithStyle:style reuseIdentifier:reuseIdentifier];
    if(self){
        //头像
        CGFloat cellH = 70;
        NSLog(@"%fhhhhhhhh",cellH);
        CGFloat imgW = 60;
        CGFloat imgH = 60;
        CGFloat imgVieLeVie = 10;
        
        self.img = [[UIImageView alloc]initWithFrame:CGRectMake(imgVieLeVie, (cellH - imgH)/2, imgW, imgH)];
        
        [self addSubview:self.img];
        
        //昵称
        CGFloat nlabW = 120;
        CGFloat nlabH = 22;
        CGFloat nlabLeVie = 80;
        self.name = [[UILabel alloc]initWithFrame:CGRectMake(nlabLeVie, 10, nlabW, nlabH)];
        self.name.font = [UIFont systemFontOfSize:20];
        [self addSubview:self.name];
        
        //消息
        CGFloat mlabW = 120;
        CGFloat mlabH = 21;
        CGFloat mlabLeVie = 80;
        self.msg = [[UILabel alloc]initWithFrame:CGRectMake(mlabLeVie, 34, mlabW, mlabH)];
        self.msg.font = [UIFont systemFontOfSize:16];
        [self addSubview:self.msg];
        
        //时间
        CGFloat tlabW = 50;
        CGFloat tlabH = 21;
        CGFloat tlabLeVie = self.frame.size.width;
        self.time = [[UILabel alloc]initWithFrame:CGRectMake(tlabLeVie, 10, tlabW, tlabH)];
        self.time.font = [UIFont systemFontOfSize:12];
        [self addSubview:self.time];
        
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

//
//  MMAlphaButton.m
//  StarWars検定
//
//  Created by 石部達也 on 2015/06/15.
//  Copyright (c) 2015年 石部達也. All rights reserved.
//

#import "MMAlphaButton.h"

@implementation MMAlphaButton

- (void)awakeFromNib {
    self.layer.cornerRadius = 5;
    self.clipsToBounds = true;
    UIColor *color_ = [UIColor darkGrayColor];
    UIColor *alphaColor_ = [color_ colorWithAlphaComponent:0.8];
    self.backgroundColor = alphaColor_;
}

@end

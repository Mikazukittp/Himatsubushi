//
//  MMUIButton.m
//  Manga
//
//  Created by 石部達也 on 2015/06/06.
//  Copyright (c) 2015年 石部達也. All rights reserved.
//

#import "MMUIButton.h"

@implementation MMUIButton

- (void)awakeFromNib {
    self.layer.cornerRadius = 5;
    self.clipsToBounds = true;
}

@end

//
//  MMQuestionEntity.h
//  Manga
//
//  Created by 石部達也 on 2015/06/07.
//  Copyright (c) 2015年 石部達也. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface MMQuestionEntity : NSObject

@property (nonatomic ,strong) NSString *sentence;
@property (nonatomic, strong) NSString *select_1;
@property (nonatomic, strong) NSString *select_2;
@property (nonatomic, strong) NSString *select_3;
@property (nonatomic, strong) NSString *select_4;
@property int correct_answer;

- (void)setPropertiesWithDictionary:(NSDictionary *) dict;

@end

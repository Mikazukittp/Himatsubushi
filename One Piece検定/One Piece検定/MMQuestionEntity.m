//
//  MMQuestionEntity.m
//  Manga
//
//  Created by 石部達也 on 2015/06/07.
//  Copyright (c) 2015年 石部達也. All rights reserved.
//

#import "MMQuestionEntity.h"

@implementation MMQuestionEntity

- (void)setPropertiesWithDictionary:(NSDictionary *) dict
{
    _sentence = [dict objectForKey:@"sentence"];
    _select_1 = [dict objectForKey:@"select_1"];
    _select_2 = [dict objectForKey:@"select_2"];
    _select_3 = [dict objectForKey:@"select_3"];
    _select_4 = [dict objectForKey:@"select_4"];
    _correct_answer = [[dict objectForKey:@"correct_answer"] intValue];
    _collectString = [dict objectForKey:[NSString stringWithFormat:@"select_%d",_correct_answer]];
}

@end

//
//  MMQuestionFetcher.m
//  Manga
//
//  Created by 石部達也 on 2015/06/07.
//  Copyright (c) 2015年 石部達也. All rights reserved.
//

#import "MMQuestionFetcher.h"
#import "MMQuestionEntity.h"
#import "MMAPIConst.h"

@implementation MMQuestionFetcher


- (id) init
{
    if (self = [super init]) {
        _questions = [[NSMutableArray alloc]init];
    }
    return self;
}

-(void)fetchQuestion:(successAction)success failedBlock:(failedAction)failed
{
    
    NSURL *url = [NSURL URLWithString:QUESTION_API_URL];
    
    NSMutableURLRequest *request = [[NSMutableURLRequest alloc]initWithURL:url];
    
    //urlをもとに非道的にデータを取得するメソッド、データ取得後ブロックオブジェクトを実行
    
    [self sendAsynchronousByUrl:request block:^(NSDictionary *questionData,NSError *error){
        if (!error) {
            NSArray *apiObject = [questionData objectForKey:@"question_array"];
            for (NSDictionary *dict  in apiObject) {
                MMQuestionEntity *entity = [[MMQuestionEntity alloc]init];
                [entity setPropertiesWithDictionary:dict];
                [_questions addObject:entity];  
            }
            success();
        }else{
            failed(error);
        }
    }];
}


@end

//
//  MMQuestionFetcher.m
//  Manga
//
//  Created by 石部達也 on 2015/06/07.
//  Copyright (c) 2015年 石部達也. All rights reserved.
//

#import "MMQuestionFetcher.h"
#import "MMQuestionEntity.h"

@implementation MMQuestionFetcher


- (id) init
{
    if (self = [super init]) {
//        _questionEntity = [[QPQuestionEntity alloc]init];
    }
    return self;
}

-(void)fetchQuestion:(successAction)success failedBlock:(failedAction)failed
{
    NSURL *url = [NSURL URLWithString:@"http://localhost:3000/api/v1/questions/1"];
    
    NSMutableURLRequest *request = [[NSMutableURLRequest alloc]initWithURL:url];
    
    //urlをもとに非道的にデータを取得するメソッド、データ取得後ブロックオブジェクトを実行
    [self sendAsynchronousByUrl:request block:^(NSArray *questionData,NSError *error){
        if (!error) {
            for (NSDictionary *dict in questionData) {
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

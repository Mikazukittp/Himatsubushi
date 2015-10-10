//
//  MMQuestionFetcher.h
//  Manga
//
//  Created by 石部達也 on 2015/06/07.
//  Copyright (c) 2015年 石部達也. All rights reserved.
//

#import "MMBaseFetcher.h"

@interface MMQuestionFetcher : MMBaseFetcher

/*!
 @brief 全検索数
 */
@property (nonatomic, strong) NSMutableArray *questions;


//県entity配列を作成し、ブロックオブジェクトを実行
-(void)fetchQuestion:(successAction)success failedBlock:(failedAction)failed;


@end

//
//  MMQuestionEntity.h
//  Manga
//
//  Created by 石部達也 on 2015/06/07.
//  Copyright (c) 2015年 石部達也. All rights reserved.
//

#import <Foundation/Foundation.h>

/*!
 @class MMQuestionEntity
 @brief 問題エンティティ
 @discussion 問題に関するプロパティを保持する
 @author ishibe tatsuya
 */


@interface MMQuestionEntity : NSObject

/*! @brief 問題文 */
@property (nonatomic ,strong) NSString *sentence;
/*! @brief 選択肢1 */
@property (nonatomic, strong) NSString *select_1;
/*! @brief 選択肢2 */
@property (nonatomic, strong) NSString *select_2;
/*! @brief 選択肢3 */
@property (nonatomic, strong) NSString *select_3;
/*! @brief 選択肢4 */
@property (nonatomic, strong) NSString *select_4;
/*! @brief 答えの番号 */
@property int correct_answer;

/*! @brief 答えの文 */
@property (nonatomic, strong)NSString *collectString;

- (void)setPropertiesWithDictionary:(NSDictionary *) dict;

@end

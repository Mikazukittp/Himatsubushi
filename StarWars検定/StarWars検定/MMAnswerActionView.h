//
//  MMAnswerActionView.h
//  Manga
//
//  Created by 石部達也 on 2015/06/09.
//  Copyright (c) 2015年 石部達也. All rights reserved.
//

#import <UIKit/UIKit.h>

typedef NS_ENUM(NSInteger, MMQuestionAnswerType) {
    MMQuestionAnswerTypeCollect = 0,       // 正解
    MMQuestionAnswerTypeFailed        // 不正解
};

@protocol MMNextQuestionDelegate <NSObject>
//ボタンが押された時のデリゲート
- (void)nextQuestion;
@end

/*!
 @class MMAnswerActionView
 @brief ユーザが回答したときに動作するView
 @author ishibe tatsuya
 */


@interface MMAnswerActionView : UIView

@property (nonatomic, assign) id<MMNextQuestionDelegate> delegate;

/*! @brief 正解/不正解のアニメーションを実装 */
- (void)showAnswerWith:(MMQuestionAnswerType)type collectString:(NSString *)collectString;
@end

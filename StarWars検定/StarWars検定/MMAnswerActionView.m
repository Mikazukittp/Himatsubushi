//
//  MMAnswerActionView.m
//  Manga
//
//  Created by 石部達也 on 2015/06/09.
//  Copyright (c) 2015年 石部達也. All rights reserved.
//

#import "MMAnswerActionView.h"

@interface MMAnswerActionView ()

@property (weak, nonatomic) IBOutlet UIButton *nextQuestionButton;
@property (weak, nonatomic) IBOutlet UILabel *collectAnswerLabel;
@property (weak, nonatomic) IBOutlet UIImageView *answerImageView;
@end

@implementation MMAnswerActionView

-(id)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    if(self){
        //xib ファイルのトップレベルオブジェクトを格納した array を返す
        NSArray *topLevelViews = [[NSBundle mainBundle] loadNibNamed:@"MMAnswerActionView"
                                                               owner:self
                                                             options:nil];
        UIView* customView = topLevelViews[0];
        self.userInteractionEnabled = YES;
        [self addSubview:customView];
        
        // レイヤーの作成
        CAGradientLayer *gradient = [CAGradientLayer layer];
        
        // レイヤーサイズをビューのサイズをそろえる
        gradient.frame = frame;

        
        gradient.colors = @[
                            // 開始色
                            (id)[UIColor colorWithRed:0.925 green:0.941 blue:0.945 alpha:0.8].CGColor,
                            // 終了色
                            (id)[UIColor colorWithRed:0.925 green:1.000 blue:0.945 alpha:0.8].CGColor
                            ];
        
        // レイヤーを追加
        [customView.layer insertSublayer:gradient atIndex:0];
        
        [self setPositions];
        [self showAnswerWith:MMQuestionAnswerTypeCollect collectString:@"aaa"];
        
    }
    return self;
}

- (void)showAnswerWith:(MMQuestionAnswerType)type collectString:(NSString *)collectString{
    _answerImageView.alpha = 0;
//    _nextQuestionButton.hidden = YES;
  
     
    if (type == MMQuestionAnswerTypeCollect) {
        _answerImageView.image = [UIImage imageNamed:@"Circle"];
        _collectAnswerLabel.hidden = YES;

    } else {
        _answerImageView.image = [UIImage imageNamed:@"Batsu"];
        _collectAnswerLabel.hidden = NO;
        _collectAnswerLabel.text = collectString;

    }
    
    [self showAnimation];
}

- (void)showAnimation {
    
    _answerImageView.alpha = 0.0;
    _collectAnswerLabel.alpha = 0.0;
    
    [UIView animateWithDuration:1.0 // 4秒かけてアニメーション
                     animations:^
    {
        _answerImageView.alpha = 1.0; // 透明にする
        _collectAnswerLabel.alpha = 1.0;
    }];
}

//オートレイアウトで○と☓のポジジョンを設定する
- (void)setPositions
{
    [self addConstraint:[NSLayoutConstraint constraintWithItem:_answerImageView
                                                     attribute:NSLayoutAttributeCenterX
                                                     relatedBy:NSLayoutRelationEqual
                                                        toItem:self
                                                     attribute:NSLayoutAttributeCenterX
                                                    multiplier:1.0f
                                                      constant:0.0f]];
    
    [self addConstraint:[NSLayoutConstraint constraintWithItem:_answerImageView
                                                     attribute:NSLayoutAttributeTop
                                                     relatedBy:NSLayoutRelationEqual
                                                        toItem:self
                                                     attribute:NSLayoutAttributeTop
                                                    multiplier:1.0f
                                                      constant:60.0f]];
   
    [self addConstraint:[NSLayoutConstraint constraintWithItem:_collectAnswerLabel
                                                     attribute:NSLayoutAttributeCenterX
                                                     relatedBy:NSLayoutRelationEqual
                                                        toItem:self
                                                     attribute:NSLayoutAttributeCenterX
                                                    multiplier:1.0f
                                                      constant:0.0f]];
    
    [self addConstraint:[NSLayoutConstraint constraintWithItem:_collectAnswerLabel
                                                     attribute:NSLayoutAttributeTop
                                                     relatedBy:NSLayoutRelationEqual
                                                        toItem:_answerImageView
                                                     attribute:NSLayoutAttributeBottom
                                                    multiplier:1.0f
                                                      constant:10.0f]];
    
    
    [self addConstraint:[NSLayoutConstraint constraintWithItem:_nextQuestionButton
                                                     attribute:NSLayoutAttributeCenterX
                                                     relatedBy:NSLayoutRelationEqual
                                                        toItem:self
                                                     attribute:NSLayoutAttributeCenterX
                                                    multiplier:1.0f
                                                      constant:0.0f]];
    
    [self addConstraint:[NSLayoutConstraint constraintWithItem:_nextQuestionButton
                                                     attribute:NSLayoutAttributeTop
                                                     relatedBy:NSLayoutRelationEqual
                                                        toItem:_collectAnswerLabel
                                                     attribute:NSLayoutAttributeBottom
                                                    multiplier:1.0f
                                                      constant:20.0f]];
    
}

- (IBAction)nextQuestionTapped:(id)sender {
    //デリゲートに処理をお願い
    if ([self.delegate respondsToSelector:@selector(nextQuestion)]) {
        [self.delegate nextQuestion];
    }
}




@end

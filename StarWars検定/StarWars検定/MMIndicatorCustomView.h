//
//  MMIndicatorCustomView.h
//  Manga
//
//  Created by 石部達也 on 2015/06/07.
//  Copyright (c) 2015年 石部達也. All rights reserved.
//

#import <UIKit/UIKit.h>

/*!
 @class MMIndicatorCustomView
 @brief インジケータを実装したview
 @discussion 角丸をカスタマイズした
 @author ishibe tatsuya
 */


@interface MMIndicatorCustomView : UIView

/*! @brief インジケータスタート */
- (void)startAnimation;
/*! @brief インジケータストップ */
- (void)stopAnimation;

@end

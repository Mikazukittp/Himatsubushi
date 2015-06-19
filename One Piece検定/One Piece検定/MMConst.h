//
//  MMConst.h
//  StarWars検定
//
//  Created by 石部達也 on 2015/06/14.
//  Copyright (c) 2015年 石部達也. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface MMConst : NSObject

#if DEBUG
#define ADMOB_TOP_ID @"/6499/example/banner"
#else
#define ADMOB_TOP_ID @"ca-app-pub-8668651775161815/8204447888"
#endif


#if DEBUG
#define ADMOB_QUESTION_BOTTOM_ID @"/6499/example/banner"
#else
#define ADMOB_QUESTION_BOTTOM_ID @"ca-app-pub-8668651775161815/2157914285"
#endif

#if DEBUG
#define ADMOB_QUESTION_HEAD_ID @"/6499/example/banner"
#else
#define ADMOB_QUESTION_HEAD_ID @"ca-app-pub-8668651775161815/9681181088"
#endif

#if DEBUG
#define ADMOB_RESULT_ID @"/6499/example/banner"
#else
#define ADMOB_RESULT_ID @"ca-app-pub-8668651775161815/3634647482"
#endif

@end

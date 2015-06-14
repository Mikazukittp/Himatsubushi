//
//  MMAPIConst.h
//  Manga
//
//  Created by 石部達也 on 2015/06/11.
//  Copyright (c) 2015年 石部達也. All rights reserved.
//

#import <Foundation/Foundation.h>


/*!
 @class MMAPIConst
 @brief APIの向き先を設定する
 @author ishibe tatsuya
 */

@interface MMAPIConst : NSObject
#if DEBUG
#define QUESTION_API_URL @"http://ec2-52-68-159-188.ap-northeast-1.compute.amazonaws.com/api/v1/questions/2"
#else
#define QUESTION_API_URL @"http://ec2-52-68-159-188.ap-northeast-1.compute.amazonaws.com/api/v1/questions/2"
#endif

@end

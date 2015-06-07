//
//  MMBaseFetcher.h
//  Manga
//
//  Created by 石部達也 on 2015/06/07.
//  Copyright (c) 2015年 石部達也. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface MMBaseFetcher : NSObject

//通信完了時のブロック
typedef void (^successAction)(void);

//通信失敗時のブロック
typedef void (^failedAction)(NSError *error);

typedef void (^setEntityArray)(NSArray *questionData,NSError *error);

-(void)sendAsynchronousByUrl:(NSURLRequest *)url block:(setEntityArray)block;


@end

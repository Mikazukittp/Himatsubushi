//
//  MMBaseFetcher.m
//  Manga
//
//  Created by 石部達也 on 2015/06/07.
//  Copyright (c) 2015年 石部達也. All rights reserved.
//

#import "MMBaseFetcher.h"

@implementation MMBaseFetcher


-(void)sendAsynchronousByUrl:(NSURLRequest *)request block:(setEntityArray)block
{
    //    NSURLRequest *request = [NSURLRequest requestWithURL:url];
    __block NSArray* questions;
    
    [NSURLConnection sendAsynchronousRequest:request
                                       queue:[NSOperationQueue currentQueue]
                           completionHandler:^(NSURLResponse *response, NSData *data, NSError *error) {
                               if(!error){
                                   questions =[NSJSONSerialization JSONObjectWithData:data options:NSJSONReadingAllowFragments error:&error];
                               }else{
                                   questions = nil;
                                   NSLog(@"%@",error);
                               }
                               block(questions,error);
                           }];
}


@end

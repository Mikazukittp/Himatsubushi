//
//  MMIndicatorCustomView.m
//  Manga
//
//  Created by 石部達也 on 2015/06/07.
//  Copyright (c) 2015年 石部達也. All rights reserved.
//

#import "MMIndicatorCustomView.h"
#import "MONActivityIndicatorView.h"

@interface MMIndicatorCustomView()
@property (strong, nonatomic) MONActivityIndicatorView *indicatorView;
@end

@implementation MMIndicatorCustomView

- (void)startAnimation
{
    [self.indicatorView startAnimating];
}
- (void)stopAnimation
{
    [self.indicatorView stopAnimating];
}

-(id)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    if(self){
        //xib ファイルのトップレベルオブジェクトを格納した array を返す
        NSArray *topLevelViews = [[NSBundle mainBundle] loadNibNamed:@"MMIndicatorCustomView"
                                                               owner:self
                                                             options:nil];
        UIView* customView = topLevelViews[0];
        [self addSubview:customView];
        
        
        _indicatorView = [[MONActivityIndicatorView alloc] init];
        _indicatorView.internalSpacing = 3;
        
        UIImage *backGroundImage = [UIImage imageNamed:@"BackGroundImage"];
        self.backgroundColor = [UIColor colorWithPatternImage:backGroundImage];


        [customView addSubview:_indicatorView];
        [self placeAtTheCenterWithView:_indicatorView];
    }
    return self;
}

- (void)placeAtTheCenterWithView:(UIView *)view
{
    [self addConstraint:[NSLayoutConstraint constraintWithItem:view
                                                          attribute:NSLayoutAttributeCenterX
                                                          relatedBy:NSLayoutRelationEqual
                                                             toItem:self
                                                          attribute:NSLayoutAttributeCenterX
                                                         multiplier:1.0f
                                                           constant:0.0f]];
    
    [self addConstraint:[NSLayoutConstraint constraintWithItem:view
                                                          attribute:NSLayoutAttributeCenterY
                                                          relatedBy:NSLayoutRelationEqual
                                                             toItem:self
                                                          attribute:NSLayoutAttributeCenterY
                                                         multiplier:1.0f
                                                           constant:0.0f]];
}

@end

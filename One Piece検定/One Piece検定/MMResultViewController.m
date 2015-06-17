//
//  MMResultViewController.m
//  Manga
//
//  Created by 石部達也 on 2015/06/01.
//  Copyright (c) 2015年 石部達也. All rights reserved.
//

#import "MMResultViewController.h"
#import "MMQuestionViewController.h"
#import "MMConst.h"

@import GoogleMobileAds;

@interface MMResultViewController ()
@property (weak, nonatomic) IBOutlet GADBannerView *bannerView;
@property (weak, nonatomic) IBOutlet UILabel *resultLabel;
@property (weak, nonatomic) IBOutlet UILabel *rankLabel;

@end

@implementation MMResultViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    if ([self respondsToSelector:@selector(edgesForExtendedLayout)])
        self.edgesForExtendedLayout = UIRectEdgeNone;
    
    self.title = @"結果";
    
    [self setRankLabelWithResultString];
    
    _resultLabel.layer.cornerRadius = 75;
    _resultLabel.clipsToBounds = true;
    _resultStr = [NSString stringWithFormat:@"正解率\n%@",_resultStr];
    _resultLabel.text = _resultStr;
    
    [self setBackGroundImage];
    [self adBannerView];

    // Do any additional setup after loading the view from its nib.
}

- (void)setBackGroundImage {
    UIImage *backGroundImage = [UIImage imageNamed:@"BackGroundImage"];
    self.view.backgroundColor = [UIColor colorWithPatternImage:backGroundImage];
}


- (void)adBannerView {
    
    self.bannerView.adUnitID = ADMOB_ID;
    self.bannerView.rootViewController = self;
    [self.bannerView loadRequest:[GADRequest request]];
    
}

- (void)setRankLabelWithResultString {
    NSInteger rank = [_resultStr integerValue];
    
    if (rank >= 90) {
        _rankLabel.text = @"ヨーダ";
    } else if(rank >= 70) {
        _rankLabel.text = @"ジェダイマスター";
    } else if(rank >= 50) {
        _rankLabel.text = @"ジェダイの騎士";
    } else if(rank >= 30) {
        _rankLabel.text = @"反乱軍エースパイロット";
    } else {
        _rankLabel.text = @"クローントルーパー";
    }
}

- (void)viewWillDisappear:(BOOL)animated
{
    if ([self.navigationController.viewControllers indexOfObject:self] == NSNotFound)
    {
        [self.navigationController popToRootViewControllerAnimated:NO];
    }
    [super viewWillDisappear:animated];

}

- (IBAction)topButtonTapped:(id)sender {
    
    [self.navigationController popToRootViewControllerAnimated:NO];
}



@end

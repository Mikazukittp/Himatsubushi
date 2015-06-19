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
@property (weak, nonatomic) IBOutlet UIView *resultView;
@property (weak, nonatomic) IBOutlet UILabel *detailLabel;

@end

@implementation MMResultViewController

- (void)viewDidLoad {
    [super viewDidLoad];
        
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
    UIImage *backGroundImage = [UIImage imageNamed:@"ResultImage"];
    self.view.backgroundColor = [UIColor colorWithPatternImage:backGroundImage];
    
    UIColor *color = [UIColor whiteColor];
    _resultView.backgroundColor =  [color colorWithAlphaComponent:0.2];
    _resultView.layer.cornerRadius = 5;
    _resultView.clipsToBounds = true;
    
    _resultLabel.backgroundColor =[color colorWithAlphaComponent:0.9];

}

- (void)adBannerView {
    
    self.bannerView.adUnitID = ADMOB_RESULT_ID;
    self.bannerView.rootViewController = self;
    [self.bannerView loadRequest:[GADRequest request]];
    
}

- (void)setRankLabelWithResultString {
    NSInteger rank = [_resultStr integerValue];
    
    if (rank >= 90) {
        _rankLabel.text = @"海賊王クラス";
        _detailLabel.text = @"今日から海賊王と名乗るが良い";
    } else if(rank >= 70) {
        _rankLabel.text = @"四皇クラス";
        _detailLabel.text = @"君はシャンクスと肩を並べている";
    } else if(rank >= 50) {
        _rankLabel.text = @"3000万ベリークラス";
        _detailLabel.text = @"まだまだ新世界は遠い";
    } else if(rank >= 30) {
        _rankLabel.text = @"イーストブルークラス";
        _detailLabel.text = @"まだまだグランドラインは遠い";
    } else {
        _rankLabel.text = @"海軍雑用クラス";
        _detailLabel.text = @"まだまだだね";
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

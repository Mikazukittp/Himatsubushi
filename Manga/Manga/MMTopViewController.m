//
//  MMTopViewController.m
//  Manga
//
//  Created by 石部達也 on 2015/05/31.
//  Copyright (c) 2015年 石部達也. All rights reserved.
//

#import "MMTopViewController.h"
#import "MMQuestionViewController.h"
#import "MMUIButton.h"

@import GoogleMobileAds;

@interface MMTopViewController ()

@property (weak, nonatomic) IBOutlet GADBannerView *bannerView;
@end

@implementation MMTopViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    [self adBannerView];
    
    // Do any additional setup after loading the view from its nib.
}

- (void)adBannerView {
    
    self.bannerView.adUnitID = @"ca-app-pub-3940256099942544/2934735716";
    self.bannerView.rootViewController = self;
    [self.bannerView loadRequest:[GADRequest request]];

}

- (IBAction)startButtonTapped:(id)sender {
    
    MMQuestionViewController *vc = [MMQuestionViewController new];
    [self.navigationController pushViewController:vc animated:YES];
    
}

@end

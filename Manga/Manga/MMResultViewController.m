//
//  MMResultViewController.m
//  Manga
//
//  Created by 石部達也 on 2015/06/01.
//  Copyright (c) 2015年 石部達也. All rights reserved.
//

#import "MMResultViewController.h"
#import "MMQuestionViewController.h"

@import GoogleMobileAds;

@interface MMResultViewController ()
@property (weak, nonatomic) IBOutlet GADBannerView *bannerView;
@property (weak, nonatomic) IBOutlet UILabel *resultLabel;

@end

@implementation MMResultViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    if ([self respondsToSelector:@selector(edgesForExtendedLayout)])
        self.edgesForExtendedLayout = UIRectEdgeNone;
    
    self.title = @"結果";
    
    _resultLabel.layer.cornerRadius = 75;
    _resultLabel.clipsToBounds = true;
    _resultLabel.text = _resultStr;
    
    [self adBannerView];

    // Do any additional setup after loading the view from its nib.
}

- (void)adBannerView {
    
    self.bannerView.adUnitID = @"ca-app-pub-3940256099942544/2934735716";
    self.bannerView.rootViewController = self;
    [self.bannerView loadRequest:[GADRequest request]];
    
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

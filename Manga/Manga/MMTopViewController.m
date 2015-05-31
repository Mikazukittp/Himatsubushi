//
//  MMTopViewController.m
//  Manga
//
//  Created by 石部達也 on 2015/05/31.
//  Copyright (c) 2015年 石部達也. All rights reserved.
//

#import "MMTopViewController.h"
#import "MMQuestionViewController.h"

@interface MMTopViewController ()

@end

@implementation MMTopViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view from its nib.
}

- (IBAction)startButtonTapped:(id)sender {
    
    MMQuestionViewController *vc = [MMQuestionViewController new];
    [self.navigationController pushViewController:vc animated:YES];
    
}

@end

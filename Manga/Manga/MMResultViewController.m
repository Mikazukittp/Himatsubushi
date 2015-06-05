//
//  MMResultViewController.m
//  Manga
//
//  Created by 石部達也 on 2015/06/01.
//  Copyright (c) 2015年 石部達也. All rights reserved.
//

#import "MMResultViewController.h"
#import "MMQuestionViewController.h"

@interface MMResultViewController ()

@end

@implementation MMResultViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    self.title = @"結果";

    // Do any additional setup after loading the view from its nib.
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

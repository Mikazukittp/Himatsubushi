//
//  MMInfoViewController.m
//  Manga
//
//  Created by 石部達也 on 2015/06/13.
//  Copyright (c) 2015年 石部達也. All rights reserved.
//

#import "MMInfoViewController.h"

@interface MMInfoViewController ()
@property (weak, nonatomic) IBOutlet UITextView *textView;

@end

@implementation MMInfoViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    self.title = @"Copyright";
    self.textView.editable = NO;
}

@end

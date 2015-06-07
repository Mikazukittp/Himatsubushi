//
//  MMQuestionViewController.m
//  MangeMeigen
//
//  Created by 石部達也 on 2015/05/31.
//  Copyright (c) 2015年 石部達也. All rights reserved.
//

#import "MMQuestionViewController.h"
#import "MMQuestionSentenceView.h"
#import "MMResultViewController.h"
#import "MMUIButton.h"
#import "MMQuestionFetcher.h"
#import "MMQuestionEntity.h"

@import GoogleMobileAds;


@interface MMQuestionViewController () {
    int currentQuestionNumber;
    float answerPoint;
}
@property (nonatomic, strong)NSMutableArray *questions;
@property (weak, nonatomic) IBOutlet UIView *questionView;
@property (weak, nonatomic) IBOutlet UILabel *questionSentence;
@property (weak, nonatomic) IBOutlet MMUIButton *answer1Button;
@property (weak, nonatomic) IBOutlet MMUIButton *answer2Button;
@property (weak, nonatomic) IBOutlet MMUIButton *answer3Button;
@property (weak, nonatomic) IBOutlet MMUIButton *answer4Button;
@property (weak, nonatomic) IBOutlet GADBannerView *bannerView;

@end

@implementation MMQuestionViewController

- (void)viewDidLoad {
    [super viewDidLoad];

    self.title = @"問題";
    
    if ([self respondsToSelector:@selector(edgesForExtendedLayout)])
        self.edgesForExtendedLayout = UIRectEdgeNone;
        
    //データ作成
    [self fetchData];
    
//    [self setAnswerButtonSentence];
//    [self adBannerView];
}

- (void)adBannerView {
    
    self.bannerView.adUnitID = @"ca-app-pub-3940256099942544/2934735716";
    self.bannerView.rootViewController = self;
    [self.bannerView loadRequest:[GADRequest request]];
    
}


- (void)fetchData {
    
    NSBundle* bundle = [NSBundle mainBundle];
    //読み込むファイルパスを指定
    NSString* path = [bundle pathForResource:@"OnePiece" ofType:@"plist"];
    _questions = [[NSMutableArray arrayWithContentsOfFile:path] objectAtIndex:0];
    
    __weak MMQuestionViewController *weakSelf = self;
    
    MMQuestionFetcher *fetcher = [[MMQuestionFetcher alloc]init];
    [fetcher fetchQuestion:^(){
        _questions = fetcher.questions;
        [weakSelf setAnswerButtonSentence];
        [weakSelf adBannerView];
    }failedBlock:^(NSError *error){
        NSLog(@"%@",error);
    }];
    
    
    currentQuestionNumber = 0;
}

- (NSDictionary *)currentQuestionDictionary {
    return [_questions objectAtIndex:currentQuestionNumber];
}

- (void)setAnswerButtonSentence
{
    NSDictionary *question = [self currentQuestionDictionary];
    _questionSentence.text = [question objectForKey:@"question"];

    NSArray *choice =  [question objectForKey:@"choice"];
    
    [_answer1Button setTitle:[choice objectAtIndex:0] forState:UIControlStateNormal];
    [_answer2Button setTitle:[choice objectAtIndex:1] forState:UIControlStateNormal];
    [_answer3Button setTitle:[choice objectAtIndex:2] forState:UIControlStateNormal];
    [_answer4Button setTitle:[choice objectAtIndex:3] forState:UIControlStateNormal];

    _answer1Button.tag = 1;
    _answer2Button.tag = 2;
    _answer3Button.tag = 3;
    _answer4Button.tag = 4;
    
}


- (IBAction)answerButtonTapped:(id)sender {
    MMUIButton *selectButton = (MMUIButton *)sender;
    
    NSInteger choiceNumber = selectButton.tag;
    NSDictionary *question = [self currentQuestionDictionary];
    NSInteger answerNumber = [[question objectForKey:@"answer"] integerValue];
    
    if (choiceNumber == answerNumber) {
        NSLog(@"正解");
        answerPoint ++;
    }else {
        NSLog(@"不正解");
    }
    currentQuestionNumber ++;

    if (currentQuestionNumber >= _questions.count) {
        MMResultViewController *vc = [MMResultViewController new];
        
        float answerPer = answerPoint / _questions.count * 100;
        NSString *cnv = [NSString stringWithFormat:@"%.f", answerPer];
        vc.resultStr = [NSString stringWithFormat:@"%@%@",cnv,@"%"];
        
        [self.navigationController pushViewController:vc animated:YES];
    }else {
         [self setAnswerButtonSentence];
    }
    
}

@end

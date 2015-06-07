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
#import "MMIndicatorCustomView.h"
#import "MONActivityIndicatorView.h"

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
@property (nonatomic, strong) MMIndicatorCustomView *indicatorView;

@end

@implementation MMQuestionViewController

- (void)viewDidLoad {
    [super viewDidLoad];

    self.title = @"問題";
    
    if ([self respondsToSelector:@selector(edgesForExtendedLayout)])
        self.edgesForExtendedLayout = UIRectEdgeNone;
    
    UIScreen* screen = [UIScreen mainScreen];
    
    //全画面の大きさで生成
    _indicatorView = [[MMIndicatorCustomView alloc]initWithFrame:CGRectMake(0, 0, screen.bounds.size.width,screen.bounds.size.height)];
    
    [self.view addSubview:_indicatorView];
    [_indicatorView startAnimation];
    
    //データ作成
    [self fetchData];
}

- (void)adBannerView {
    
    self.bannerView.adUnitID = @"ca-app-pub-3940256099942544/2934735716";
    self.bannerView.rootViewController = self;
    [self.bannerView loadRequest:[GADRequest request]];
    
}

- (void)netWorkError {
    
    if ([UIAlertController class]) {
        // iOS バージョンが 8 以上で、UIAlertController クラスが利用できる場合
        UIAlertController *alertController =
        [UIAlertController alertControllerWithTitle:@"通信エラー"
                                            message:@"通信に失敗しました。再度お試しください。"
                                     preferredStyle:UIAlertControllerStyleAlert];
        // Close ボタンを表示する
        UIAlertAction *alertAction =
        [UIAlertAction actionWithTitle:@"了解"
                                 style:UIAlertActionStyleCancel
                               handler:nil];
        [alertController addAction:alertAction];
        
        [self presentViewController:alertController animated:YES completion:nil];
    } else {
        // iOS バージョンが 8 未満で、UIAlertController クラスが利用できない場合
        UIAlertView *alertView =
        [[UIAlertView alloc] initWithTitle:@"通信エラー"
                                   message:@"通信に失敗しました。再度お試しください。e"
                                  delegate:nil
                         cancelButtonTitle:@"了解"
                         otherButtonTitles:nil];
        [alertView show];
    }
}



- (void)fetchData {
    
//    NSBundle* bundle = [NSBundle mainBundle];
//    //読み込むファイルパスを指定
//    NSString* path = [bundle pathForResource:@"OnePiece" ofType:@"plist"];
//    _questions = [[NSMutableArray arrayWithContentsOfFile:path] objectAtIndex:0];
//    
    __weak MMQuestionViewController *weakSelf = self;
    
    MMQuestionFetcher *fetcher = [[MMQuestionFetcher alloc]init];
    [fetcher fetchQuestion:^(){
        _questions = fetcher.questions;
        [weakSelf setAnswerButtonSentence];
        [weakSelf adBannerView];
        weakSelf.indicatorView.hidden = NO;
        [weakSelf.indicatorView stopAnimation];
    }failedBlock:^(NSError *error){
        NSLog(@"%@",error);
        [weakSelf.indicatorView stopAnimation];
        [weakSelf netWorkError];
    }];
    
    
    currentQuestionNumber = 0;
}

- (MMQuestionEntity *)currentQuestionDictionary {
    return [_questions objectAtIndex:currentQuestionNumber];
}

- (void)setAnswerButtonSentence
{
   MMQuestionEntity *question = [self currentQuestionDictionary];
    _questionSentence.text = question.sentence;

//    NSArray *choice =  [question objectForKey:@"choice"];
    
    [_answer1Button setTitle:question.select_1 forState:UIControlStateNormal];
    [_answer2Button setTitle:question.select_2 forState:UIControlStateNormal];
    [_answer3Button setTitle:question.select_3 forState:UIControlStateNormal];
    [_answer4Button setTitle:question.select_4 forState:UIControlStateNormal];

    _answer1Button.tag = 1;
    _answer2Button.tag = 2;
    _answer3Button.tag = 3;
    _answer4Button.tag = 4;
    
}


- (IBAction)answerButtonTapped:(id)sender {
    MMUIButton *selectButton = (MMUIButton *)sender;
    
    NSInteger choiceNumber = selectButton.tag;
    MMQuestionEntity *question = [self currentQuestionDictionary];
    NSInteger answerNumber = question.correct_answer;
    
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

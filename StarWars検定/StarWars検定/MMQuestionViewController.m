//
//  MMQuestionViewController.m
//  MangeMeigen
//
//  Created by 石部達也 on 2015/05/31.
//  Copyright (c) 2015年 石部達也. All rights reserved.
//

#import "MMQuestionViewController.h"
#import "MMResultViewController.h"
#import "MMUIButton.h"
#import "MMQuestionFetcher.h"
#import "MMQuestionEntity.h"
#import "MMIndicatorCustomView.h"
#import "MONActivityIndicatorView.h"
#import "MMAnswerActionView.h"
#import "MMConst.h"

@import GoogleMobileAds;


@interface MMQuestionViewController () <MMNextQuestionDelegate>{
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
@property (weak, nonatomic) IBOutlet GADBannerView *bannerView2;
@property (weak, nonatomic) IBOutlet GADBannerView *bannerView1;
@property (nonatomic, strong) MMIndicatorCustomView *indicatorView;
@property (nonatomic, strong) MMAnswerActionView *answerQuestionView;

@end

@implementation MMQuestionViewController

- (void)viewDidLoad {
    [super viewDidLoad];

    self.title = @"問題";
    
    //navigationBarの高さ分viewを下げる
    if ([self respondsToSelector:@selector(edgesForExtendedLayout)])
        self.edgesForExtendedLayout = UIRectEdgeNone;

    [self setBackGroundImage];
    
    UIScreen* screen = [UIScreen mainScreen];
    
    //全画面の大きさで生成
    _indicatorView = [[MMIndicatorCustomView alloc]initWithFrame:CGRectMake(0, 0, screen.bounds.size.width,screen.bounds.size.height)];
    _answerQuestionView = [[MMAnswerActionView alloc]initWithFrame:CGRectMake(0, 0, screen.bounds.size.width,screen.bounds.size.height)];
    _answerQuestionView.delegate = self;

    [self.view addSubview:_indicatorView];
    [self.view addSubview:_answerQuestionView];
    _answerQuestionView.hidden = YES;
    
    [_indicatorView startAnimation];
    
    //データ作成
    [self fetchData];
    [self adBannerView];

}

//背景画像の設定
- (void)setBackGroundImage {
    UIImage *backGroundImage = [UIImage imageNamed:@"BackGroundImage"];
    self.view.backgroundColor = [UIColor colorWithPatternImage:backGroundImage];
}

//Googleの広告設定
- (void)adBannerView {
    
    self.bannerView1.adUnitID = ADMOB_ID;
    self.bannerView1.rootViewController = self;
    [self.bannerView1 loadRequest:[GADRequest request]];
    
    self.bannerView2.adUnitID = ADMOB_ID;
    self.bannerView2.rootViewController = self;
    [self.bannerView2 loadRequest:[GADRequest request]];
    
}

- (void)netWorkError {
    
    if ([UIAlertController class]) {
        // iOS バージョンが 8 以上で、UIAlertController クラスが利用できる場合
        UIAlertController *alertController =
        [UIAlertController alertControllerWithTitle:@"通信エラー"
                                            message:@"通信状況の良い所で試してくれってばよ"
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
                                   message:@"通信状況の良い所で試してくれってばよ"
                                  delegate:nil
                         cancelButtonTitle:@"了解"
                         otherButtonTitles:nil];
        [alertView show];
    }
}


//APIからデータをとってviewの表示
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
        weakSelf.indicatorView.hidden = YES;
        [weakSelf.indicatorView stopAnimation];
    }failedBlock:^(NSError *error){
        NSLog(@"%@",error);
        [weakSelf.indicatorView stopAnimation];
        [weakSelf netWorkError];
    }];
}

- (MMQuestionEntity *)currentQuestionDictionary {
    return [_questions objectAtIndex:currentQuestionNumber];
}


- (void)setAnswerButtonSentence
{
   MMQuestionEntity *question = [self currentQuestionDictionary];
    _questionSentence.text = question.sentence;
    
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
    
    currentQuestionNumber ++;

    if (currentQuestionNumber >= _questions.count) {
        MMResultViewController *vc = [MMResultViewController new];
        
        answerPoint++;
        float answerPer = answerPoint / _questions.count * 100;
        NSString *cnv = [NSString stringWithFormat:@"%.f", answerPer];
        vc.resultStr = [NSString stringWithFormat:@"%@%@",cnv,@"%"];
        
        [self.navigationController pushViewController:vc animated:YES];
    }else {
        
        if (choiceNumber == answerNumber) {
            answerPoint ++;
            [_answerQuestionView showAnswerWith:MMQuestionAnswerTypeCollect collectString:question.collectString];
        } else {
            [_answerQuestionView showAnswerWith:MMQuestionAnswerTypeFailed collectString:question.collectString];
        }
        
         [self setAnswerButtonSentence];
    }
    
    _answerQuestionView.hidden = NO;
}

- (void)nextQuestion {
    _answerQuestionView.hidden = YES;
    [self setAnswerButtonSentence];
    
}
@end

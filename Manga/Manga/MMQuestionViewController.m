//
//  MMQuestionViewController.m
//  MangeMeigen
//
//  Created by 石部達也 on 2015/05/31.
//  Copyright (c) 2015年 石部達也. All rights reserved.
//

#import "MMQuestionViewController.h"
#import "MMTopTableViewCell.h"
#import "MMQuestionSentenceView.h"
#import "MMResultViewController.h"

@interface MMQuestionViewController () {
    int currentQuestionNumber;
}
@property (weak, nonatomic) IBOutlet UITableView *tableView;
@property (nonatomic, strong)NSMutableArray *questions;
@property (weak, nonatomic) IBOutlet UIView *questionView;
@property (weak, nonatomic) IBOutlet UILabel *questionSentence;

@end

@implementation MMQuestionViewController

- (void)viewDidLoad {
    [super viewDidLoad];

    self.title = @"問題";
    
    self.navigationController.delegate = self;
    
    //データ作成
    [self fetchData];
    
    UINib *nib = [UINib nibWithNibName:@"MMTopTableViewCell" bundle:nil];
    [_tableView registerNib:nib forCellReuseIdentifier:@"MMTopTableViewCell"];
    
    [self.tableView reloadData];

    
    // Do any additional setup after loading the view from its nib.
}

- (void)fetchData {
    
    NSBundle* bundle = [NSBundle mainBundle];
    //読み込むファイルパスを指定
    NSString* path = [bundle pathForResource:@"OnePiece" ofType:@"plist"];
    _questions = [[NSMutableArray arrayWithContentsOfFile:path] objectAtIndex:0];
    
    currentQuestionNumber = 0;
}

- (NSDictionary *)currentQuestionDictionary {
    return [_questions objectAtIndex:currentQuestionNumber];
}

#pragma mark - UITableViewDataSource

- (NSInteger) tableView: (UITableView *) tableView numberOfRowsInSection:(NSInteger) section {
    
    return 4;
    
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    NSDictionary *question = [self currentQuestionDictionary];
    
    static NSString *CellIdentifier = @"MMTopTableViewCell";
    MMTopTableViewCell *cell = [_tableView dequeueReusableCellWithIdentifier:CellIdentifier];
    _questionSentence.text = [question objectForKey:@"question"];
    
    NSArray *choice = [question objectForKey:@"choice"];
    
    cell.name.text = [choice objectAtIndex:indexPath.row];
    return  (UITableViewCell *)cell;
    
}

#pragma mark - UITableViewDelegate

- (void) tableView: (UITableView *) tableView didSelectRowAtIndexPath: (NSIndexPath *) indexPath
{

    [_tableView deselectRowAtIndexPath:indexPath animated:YES]; // 選択状態の解除
    currentQuestionNumber++;
    
    if (currentQuestionNumber >= _questions.count) {
        MMResultViewController *vc = [MMResultViewController new];
        [self.navigationController pushViewController:vc animated:YES];
    }else {
        [self.tableView reloadData];
    }

}

- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath{
    return 50;
}

- (void)pushViewController:(UIViewController *)viewController animated:(BOOL)animated
{
    
    [self.navigationController popToRootViewControllerAnimated:YES];
}


@end

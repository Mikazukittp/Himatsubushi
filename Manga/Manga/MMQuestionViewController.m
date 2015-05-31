//
//  MMQuestionViewController.m
//  MangeMeigen
//
//  Created by 石部達也 on 2015/05/31.
//  Copyright (c) 2015年 石部達也. All rights reserved.
//

#import "MMQuestionViewController.h"
#import "MMTopTableViewCell.h"

@interface MMQuestionViewController ()
@property (weak, nonatomic) IBOutlet UITableView *tableView;
@property (nonatomic, strong)NSMutableArray *questions;

@end

@implementation MMQuestionViewController

- (void)viewDidLoad {
    [super viewDidLoad];
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
    NSDictionary* dic = [NSDictionary dictionaryWithContentsOfFile:path];
    _questions = [NSMutableArray arrayWithArray:[dic objectForKey:@"New item"]];
}


#pragma mark - UITableViewDataSource

- (NSInteger) tableView: (UITableView *) tableView numberOfRowsInSection:(NSInteger) section {
    
    return 4;
    
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    static NSString *CellIdentifier = @"MMTopTableViewCell";
    MMTopTableViewCell *cell = [_tableView dequeueReusableCellWithIdentifier:CellIdentifier];
//    NSDictionary *dict = [_mugiwaraEntitys objectAtIndex:indexPath.row];
//    cell.name.text = [dict objectForKey:@"name"];
    return  (UITableViewCell *)cell;
    
}

#pragma mark - UITableViewDelegate

- (void) tableView: (UITableView *) tableView didSelectRowAtIndexPath: (NSIndexPath *) indexPath
{
    
//    [self performSegueWithIdentifier:@"MMDetailViewController" sender:nil];
    
}

- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath{
    return 100;
}

@end

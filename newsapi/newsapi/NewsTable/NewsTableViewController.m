//
//  NewsTableViewController.m
//  newsapi
//
//  Created by Sam Mazniker on 19/03/2020.
//  Copyright © 2020 Sam Mazniker. All rights reserved.
//

#import "NewsTableViewController.h"

@interface NewsTableViewController ()

@end

@implementation NewsTableViewController

- (void)viewWillAppear:(BOOL)animated{
    [super viewWillAppear:animated];
    _headlineTable = [[UITableView alloc] initWithFrame:[UIScreen mainScreen].bounds style:UITableViewStyleGrouped];
    [_headlineTable registerClass:[ArticleTableViewCell self] forCellReuseIdentifier:@"article"];
    [_headlineTable setRowHeight:500.0];
    _headlineTable.dataSource = self;
    [self.view addSubview:_headlineTable];
}

- (void)viewDidLoad {
    [super viewDidLoad];
    [self.view setBackgroundColor:[UIColor greenColor]];
    // Do any additional setup after loading the view.
}

-(instancetype) initWithData:(NSMutableArray *)articles{
    self = [super init];
    self.articles = [[NSMutableArray alloc] initWithArray:articles];
    return self;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section{
    return self.articles.count;
}

- (UITableViewCell*)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath{
    ArticleTableViewCell* newCell = [tableView dequeueReusableCellWithIdentifier:@"article"];
    if(!newCell){
        newCell = [[ArticleTableViewCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:@"article"];
    }
    Article* tmp = [[Article alloc] initFromData:[_articles objectAtIndex:indexPath.row]];
    [newCell.headline setText:tmp.title];
    [newCell.publishedAt setText:tmp.publishedAt];
    
    dispatch_queue_t mainQueue = dispatch_get_main_queue();
    NetworkManager* handler = [[NetworkManager alloc] init];
    [handler requestImageAt:tmp.imageURL with:^(UIImage* IMG) {
        dispatch_async(mainQueue, ^{
            [newCell.image setImage:IMG];
        });
    }];
    
    return newCell;
}


/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

@end

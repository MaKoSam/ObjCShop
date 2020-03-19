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

/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

@end

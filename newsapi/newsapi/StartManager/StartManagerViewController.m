//
//  StartManagerViewController.m
//  newsapi
//
//  Created by Sam Mazniker on 18/03/2020.
//  Copyright © 2020 Sam Mazniker. All rights reserved.
//

#import "StartManagerViewController.h"

@interface StartManagerViewController ()

@property (nonatomic, strong) UIActivityIndicatorView* indicator;

@end

@implementation StartManagerViewController
- (void)viewWillAppear:(BOOL)animated{
    [super viewWillAppear:animated];
    //View Setup
    [self.view setBackgroundColor:[UIColor darkGrayColor]];
    [self.navigationController navigationBar].hidden = YES;
    
    //ActivityIndicator Setup
    _indicator = [[UIActivityIndicatorView alloc] initWithActivityIndicatorStyle:UIActivityIndicatorViewStyleLarge];
    [_indicator setColor:[UIColor whiteColor]];
    _indicator.hidesWhenStopped = YES;
    _indicator.translatesAutoresizingMaskIntoConstraints = NO;
    
    NSLayoutConstraint* indicatorX = [NSLayoutConstraint constraintWithItem:_indicator attribute:NSLayoutAttributeCenterX relatedBy:NSLayoutRelationEqual toItem:self.view attribute:NSLayoutAttributeCenterX multiplier:1.0 constant:0];
    NSLayoutConstraint* indicatorY = [NSLayoutConstraint constraintWithItem:_indicator attribute:NSLayoutAttributeCenterY relatedBy:NSLayoutRelationEqual toItem:self.view attribute:NSLayoutAttributeCenterY multiplier:1.0 constant:0];
    [self.view addSubview:_indicator];
    [self.view addConstraints:@[indicatorX, indicatorY]];
    [_indicator startAnimating];
}

- (void)viewDidLoad {
    [super viewDidLoad];
    
    
    dispatch_queue_t mainQueue = dispatch_get_main_queue();
    NetworkManager* handler = [[NetworkManager alloc] init];
    [handler requestNewsHeadLine:^(NSMutableArray* articles){
        dispatch_async(mainQueue, ^{
            [_indicator stopAnimating];
            [self succesfullyLoaded];
        });
    }];
    
    // Do any additional setup after loading the view.
}

-(void)succesfullyLoaded{
    NewsTableViewController* newsHeadline = [[NewsTableViewController alloc] init];
    [self.navigationController pushViewController:newsHeadline animated:YES];
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

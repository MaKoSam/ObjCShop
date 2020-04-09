//
//  SearchViewController.m
//  TripPlaner
//
//  Created by Sam Mazniker on 08/04/2020.
//  Copyright © 2020 Sam Mazniker. All rights reserved.
//

#import "SearchViewController.h"

@interface SearchViewController ()

@property (nonatomic, strong) UIImageView* LaunchBackgroundView;

@end

@implementation SearchViewController
- (void)viewWillAppear:(BOOL)animated{
    [super viewWillAppear: animated];
    CGFloat width = [self.view bounds].size.width;
    CGFloat height = [self.view bounds].size.height;
    
    _LaunchBackgroundView = [[UIImageView alloc] initWithFrame:[self.view bounds]];
    [_LaunchBackgroundView setImage:[UIImage imageNamed:@"LaunchScreen.png"]];
    
    CGRect frame = CGRectMake(0, height, width, height + height);
    _SearchBackgroundView = [[UIImageView alloc] initWithFrame: frame];
    [_SearchBackgroundView setImage:[UIImage imageNamed:@"SearchScreen.png"]];
}

- (void)viewDidLoad {
    [super viewDidLoad];
    CGFloat width = [self.view bounds].size.width;
    CGFloat height = [self.view bounds].size.height;
    
    [UIView animateWithDuration:2.0 animations:^{
//        [self->_LaunchBackgroundView setFrame: CGRectMake(0, -height, width, height)];
        [self->_SearchBackgroundView setFrame: CGRectMake(0, 0, width, height)];
    }];
}

@end

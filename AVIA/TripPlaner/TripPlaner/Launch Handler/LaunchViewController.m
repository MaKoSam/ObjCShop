//
//  LaunchViewController.m
//  TripPlaner
//
//  Created by Sam Mazniker on 07/04/2020.
//  Copyright © 2020 Sam Mazniker. All rights reserved.
//

#import "LaunchViewController.h"

@interface LaunchViewController ()

@property (nonatomic, strong) UIActivityIndicatorView* indicator;

@end

@implementation LaunchViewController
- (void)viewWillAppear:(BOOL)animated{
    [super viewWillAppear: animated];
#pragma mark - Initial UI SetUp
    [self.navigationController setNavigationBarHidden:YES];
    
    if(!self.LaunchBackgroundView){
        _LaunchBackgroundView = [[UIImageView alloc] initWithFrame:[self.view bounds]];
    }
    [_LaunchBackgroundView setImage:[UIImage imageNamed:@"LaunchScreen.png"]];
    [self.view addSubview: _LaunchBackgroundView];
    
#pragma mark - Load Indicator SetUp
    _indicator = [[UIActivityIndicatorView alloc] initWithActivityIndicatorStyle:UIActivityIndicatorViewStyleLarge];
    [_indicator setColor:[UIColor whiteColor]];
    _indicator.hidesWhenStopped = YES;
    _indicator.translatesAutoresizingMaskIntoConstraints = NO;
    
    NSLayoutConstraint* indicatorX = [NSLayoutConstraint constraintWithItem:_indicator attribute:NSLayoutAttributeCenterX relatedBy:NSLayoutRelationEqual toItem:self.view attribute:NSLayoutAttributeCenterX multiplier:1.0 constant:0];
    
    NSLayoutConstraint* indicatorY = [NSLayoutConstraint constraintWithItem:_indicator attribute:NSLayoutAttributeCenterY relatedBy:NSLayoutRelationEqual toItem:self.view attribute:NSLayoutAttributeCenterY multiplier:1.0 constant:50.0];
    
    [self.view addSubview: _indicator];
    [self.view addConstraints:@[indicatorX, indicatorY]];
    
    [_indicator startAnimating];
}

- (void)viewDidLoad {
    [super viewDidLoad];
    [ActiveSession.sharedInstance.settings fetchSettingsFromCache];
    
    dispatch_queue_t mainQueue = dispatch_get_main_queue();
    DestinationsRequestManager* manager = [[DestinationsRequestManager alloc] init];
    [manager requsetAllDestinations:^(){
        dispatch_async(mainQueue, ^(){
            [self->_indicator stopAnimating];
            [self launchNormal];
        });
    }];
#pragma mark - Fetch SettingsMO from CoreData and send to settings page if none
#pragma mark - Fetch Airport / City / Country Data
#pragma mark - Fetch Current Location
    
}

-(void) launchNormal {
    dispatch_queue_t mainQueue = dispatch_get_main_queue();
    SearchViewController* searchController = [[SearchViewController alloc] init];
    dispatch_async(mainQueue, ^(){
        [self.navigationController pushViewController:searchController animated:YES];
    });
}

@end

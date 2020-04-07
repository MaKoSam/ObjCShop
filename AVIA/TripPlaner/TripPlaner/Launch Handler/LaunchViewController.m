//
//  LaunchViewController.m
//  TripPlaner
//
//  Created by Sam Mazniker on 07/04/2020.
//  Copyright © 2020 Sam Mazniker. All rights reserved.
//

#import "LaunchViewController.h"

@interface LaunchViewController ()

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
}

- (void)viewDidLoad {
    [super viewDidLoad];
#pragma mark - Fetch SettingsMO from CoreData and send to settings page if none
#pragma mark - Fetch Airport / City / Country Data
#pragma mark - Fetch Current Location
    
}

@end

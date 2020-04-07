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
    [self.navigationController setNavigationBarHidden:YES];
    if(!self.LaunchBackgroundView){
        _LaunchBackgroundView = [[UIImageView alloc] initWithFrame:[self.view bounds]];
    }
    
    [_LaunchBackgroundView setImage:[UIImage imageNamed:@"LaunchScreen.png"]];
    
    [self.view addSubview: _LaunchBackgroundView];
//    NSLog(@"View will appear");
}

- (void)viewDidLoad {
    [super viewDidLoad];
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

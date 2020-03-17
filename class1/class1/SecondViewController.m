//
//  SecondViewController.m
//  class1
//
//  Created by Sam Mazniker on 16/03/2020.
//  Copyright © 2020 Sam Mazniker. All rights reserved.
//

#import "SecondViewController.h"

@interface SecondViewController ()

@property (nonatomic, strong) UISegmentedControl* controller;
@property (nonatomic, strong) UIButton* updateView;
@property (nonatomic, strong) UILabel* themeName;

@end

@implementation SecondViewController

- (void)viewWillAppear:(BOOL)animated{
    [super viewWillAppear:animated];
    
    _controller = [[UISegmentedControl alloc] initWithItems:@[@"Default", @"Dark"]];;
    CGRect nameFrame = CGRectMake(20, 20, 300, 100);
    _themeName = [[UILabel alloc] initWithFrame:nameFrame];
    
    [self.view setBackgroundColor:[ThemeManager Theme].currentTheme.mainColor];
    
    [_themeName setFont:ThemeManager.Theme.currentTheme.mainFont];
    [_themeName setText:ThemeManager.Theme.currentTheme.themeName];
    [_themeName setTextColor:ThemeManager.Theme.currentTheme.fontColor];
    
    CGRect controllerFrame = CGRectMake(20, 200, 300, 100);
    _controller.frame = controllerFrame;
    _controller.selectedSegmentTintColor = [UIColor redColor];
    
    [self.view addSubview: _themeName];
    [self.view addSubview: _controller];
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

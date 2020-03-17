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
@property (nonatomic, strong) UIButton* checkAllThemes;
@property (nonatomic, strong) UILabel* themeName;

@end

@implementation SecondViewController

- (void)viewWillAppear:(BOOL)animated{
    [super viewWillAppear:animated];
    //Init view setup
    [self.view setBackgroundColor:[ThemeManager Theme].currentTheme.mainColor];
    
    //UISegmentController Init - For switching between Themes
    CGRect controllerFrame = CGRectMake(20, 200, 300, 100);
    _controller = [[UISegmentedControl alloc] initWithItems:@[@"Default", @"Dark"]];
    _controller.frame = controllerFrame;
    _controller.selectedSegmentTintColor = [UIColor redColor];
    _controller.selectedSegmentIndex = 0;
    [self.view addSubview: _controller];
    
    //UILabel Init - To show current Theme name
    CGRect nameFrame = CGRectMake(20, 20, 300, 100);
    _themeName = [[UILabel alloc] initWithFrame:nameFrame];
    [_themeName setFont:ThemeManager.Theme.currentTheme.mainFont];
    [_themeName setText:ThemeManager.Theme.currentTheme.themeName];
    [_themeName setTextColor:ThemeManager.Theme.currentTheme.fontColor];
    [self.view addSubview: _themeName];
    
    //UIButton Init - Transfer to TableView with all Themes && Constraints
    _checkAllThemes = [UIButton buttonWithType: UIButtonTypeRoundedRect];
    _checkAllThemes.translatesAutoresizingMaskIntoConstraints = NO;
    [_checkAllThemes setTitle:@"Check All Themes >" forState:UIControlStateNormal];
    [_checkAllThemes setBackgroundColor: [UIColor grayColor]];
    [_checkAllThemes addTarget:self action:@selector(transfer:) forControlEvents:UIControlEventTouchUpInside];
    
    NSLayoutConstraint* buttonTop = [NSLayoutConstraint constraintWithItem:_checkAllThemes attribute:NSLayoutAttributeTop relatedBy:NSLayoutRelationEqual toItem:_controller attribute:NSLayoutAttributeTop multiplier:1.0F constant:150.0F];
    NSLayoutConstraint* buttonX = [NSLayoutConstraint constraintWithItem:_checkAllThemes attribute:NSLayoutAttributeCenterX relatedBy:NSLayoutRelationEqual toItem:self.view attribute:NSLayoutAttributeCenterX multiplier:1.0F constant:0.0F];
    
    [self.view addSubview:_checkAllThemes];
    [self.view addConstraints:@[buttonX, buttonTop]];
    
}

- (void)viewDidLoad {
    [super viewDidLoad];
}

-(void)transfer:(id)sender{
    TableViewController* nextController = [[TableViewController alloc] init];
    [self.navigationController pushViewController:nextController animated:NO];
    
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

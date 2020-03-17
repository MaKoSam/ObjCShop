//
//  SecondViewController.m
//  class1
//
//  Created by Sam Mazniker on 16/03/2020.
//  Copyright © 2020 Sam Mazniker. All rights reserved.
//

#import "SecondViewController.h"

@interface SecondViewController ()

@end

@implementation SecondViewController

- (void)viewWillAppear:(BOOL)animated{
    [super viewWillAppear:animated];
    
    UISegmentedControl* controller = [[UISegmentedControl alloc] initWithItems:@[@"Default", @"Dark"]];;
    UILabel* themeName = [[UILabel alloc] init];
    
    self.view.backgroundColor = ThemeManager.Theme.mainColor;;
    CGRect nameFrame = CGRectMake(20, 20, 300, 100);
    
    [themeName setFont:ThemeManager.Theme.mainFont];
    [themeName setText:ThemeManager.Theme.themeName];
    [themeName setTextColor:ThemeManager.Theme.fontColor];
    themeName.frame = nameFrame;
    
    CGRect controllerFrame = CGRectMake(20, 200, 300, 100);
    controller.frame = controllerFrame;
    controller.selectedSegmentIndex = 0;
    controller.selectedSegmentTintColor = [UIColor redColor];
    
    [self.view addSubview:themeName];
    [self.view addSubview:controller];
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

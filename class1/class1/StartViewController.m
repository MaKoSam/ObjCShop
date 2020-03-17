//
//  ViewController.m
//  class1
//
//  Created by Sam Mazniker on 16/03/2020.
//  Copyright © 2020 Sam Mazniker. All rights reserved.
//

#import "StartViewController.h"

@interface StartViewController ()

@property (nonatomic, strong) UIButton* nextView;

@end

@implementation StartViewController

- (void)viewWillAppear:(BOOL)animated {
    [super viewWillAppear: animated];
    UIView* superview = self.view;
    _nextView = [UIButton buttonWithType: UIButtonTypeRoundedRect];
    _nextView.translatesAutoresizingMaskIntoConstraints = NO;
    [_nextView setBackgroundColor:[UIColor grayColor]];
    [_nextView setTitle:@"Press to next ViewController" forState: UIControlStateNormal];
    [_nextView addTarget: self action:@selector(transfer:) forControlEvents: UIControlEventTouchUpInside];
    [self.view addSubview:_nextView];
    
    NSLayoutConstraint* buttonCentreX = [NSLayoutConstraint constraintWithItem:_nextView attribute:NSLayoutAttributeCenterX relatedBy:NSLayoutRelationEqual toItem:superview attribute:NSLayoutAttributeCenterX multiplier:1.0F constant:0.0F];
    NSLayoutConstraint* buttonCentreY = [NSLayoutConstraint constraintWithItem:_nextView attribute:NSLayoutAttributeCenterY relatedBy:NSLayoutRelationEqual toItem:superview attribute:NSLayoutAttributeCenterY multiplier:1.0F constant:0.0F];
    
    [superview addConstraints:@[buttonCentreY, buttonCentreX]];

}

- (void)viewDidLoad {
    [super viewDidLoad];
    self.view.backgroundColor = [UIColor whiteColor];
}

-(void)transfer:(id)sender{
    SecondViewController* second = [[SecondViewController alloc] init];
    [self.navigationController pushViewController: second animated: YES];
}


@end

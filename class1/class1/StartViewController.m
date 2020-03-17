//
//  ViewController.m
//  class1
//
//  Created by Sam Mazniker on 16/03/2020.
//  Copyright © 2020 Sam Mazniker. All rights reserved.
//

#import "StartViewController.h"

@interface StartViewController ()

@end

@implementation StartViewController

- (void)viewWillAppear:(BOOL)animated {
    [super viewWillAppear: animated];
    
    UIButton* nextView = [[UIButton alloc] init];
    CGRect buttonFrame = CGRectMake(20, 50, 300, 100);
    nextView.frame = buttonFrame;
    
    [nextView setBackgroundColor:[UIColor grayColor]];
    [nextView setTitle:@"Press to next ViewController" forState: UIControlStateNormal];
    
    [nextView addTarget: self action:@selector(transfer:) forControlEvents: UIControlEventTouchUpInside];
    [self.view addSubview:nextView];

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

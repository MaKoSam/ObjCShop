//
//  StartManagerViewController.m
//  newsapi
//
//  Created by Sam Mazniker on 18/03/2020.
//  Copyright © 2020 Sam Mazniker. All rights reserved.
//

#import "StartManagerViewController.h"

@interface StartManagerViewController ()

@end

@implementation StartManagerViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    [self.view setBackgroundColor:[UIColor yellowColor]];
    NetworkManager* handler = [[NetworkManager alloc] init];
    handler.requestNewsHeadLine;
    // Do any additional setup after loading the view.
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

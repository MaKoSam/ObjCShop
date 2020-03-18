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
    dispatch_queue_t mainQueue = dispatch_get_main_queue();
    [self.view setBackgroundColor:[UIColor yellowColor]];
    NetworkManager* handler = [[NetworkManager alloc] init];
    [handler requestNewsHeadLine:^(NSMutableArray* articles){
        dispatch_async(mainQueue, ^{
            [self succesfullyLoaded];
        });
    }];
    
    // Do any additional setup after loading the view.
}

-(void)succesfullyLoaded{
    NewsTableViewController* newsHeadline = [[NewsTableViewController alloc] init];
    NSLog(@"Presenting - newsHeadline");
    [self.navigationController pushViewController:newsHeadline animated:YES];
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

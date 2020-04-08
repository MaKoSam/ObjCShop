//
//  SearchViewController.m
//  TripPlaner
//
//  Created by Sam Mazniker on 08/04/2020.
//  Copyright © 2020 Sam Mazniker. All rights reserved.
//

#import "SearchViewController.h"

@interface SearchViewController ()

@end

@implementation SearchViewController
- (void)viewWillAppear:(BOOL)animated{
    [super viewWillAppear: animated];
    [self.view setBackgroundColor:[UIColor yellowColor]];
}

- (void)viewDidLoad {
    [super viewDidLoad];
    
    if(!self.Sercher){
        _Sercher = [[SearchEngine alloc] init];
    }
    
    NSArray* results = [[NSArray alloc] initWithArray: [_Sercher findPlaceByKey:@"Вашингтон"]];
    
    if([results count] != 0){
        for(Airport* items in results){
            NSLog(@"%@ - %@\n", items.name, items.code);
        }
    } else {
        NSLog(@"Not found\n");
    }
    
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

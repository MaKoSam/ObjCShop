//
//  LoadingViewController.m
//  TripPlaner
//
//  Created by Sam Mazniker on 10/04/2020.
//  Copyright © 2020 Sam Mazniker. All rights reserved.
//

#import "LoadingViewController.h"

@interface LoadingViewController ()

@end

@implementation LoadingViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    [self.view setBackgroundColor:[UIColor greenColor]];
    dispatch_queue_t mainQueue = dispatch_get_main_queue();
    FlightRequest* Requester = [[FlightRequest alloc] init];
    [Requester flightsFromSearchRequest:[ActiveSession sharedInstance].search :^(NSArray* Data){
        [[TicketManager sharedInstance] uploadTicketsFromSearch:Data];
        dispatch_async(mainQueue, ^(){
            [self jumpToTickets];
        });
    }];
    
    // Do any additional setup after loading the view.
}



-(void)jumpToTickets{
    PresentViewController* newController = [[PresentViewController alloc] init];
    [self.navigationController pushViewController:newController animated:YES];
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

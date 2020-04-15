//
//  PresentViewController.m
//  TripPlaner
//
//  Created by Sam Mazniker on 13/04/2020.
//  Copyright © 2020 Sam Mazniker. All rights reserved.
//

#import "PresentViewController.h"

@interface PresentViewController ()

@property (nonatomic, strong) UIColor* mainTheme;

@end

@implementation PresentViewController

- (void)viewWillAppear:(BOOL)animated{
    [super viewWillAppear:animated];
    if(!self.mainTheme){
        _mainTheme = [UIColor colorWithRed:0.15 green:0.09 blue:0.14 alpha:1.0];
    }
    [self.view setBackgroundColor:_mainTheme];
    
    if(!self.tickets){
        _tickets = [[NSArray alloc] init];
        _tickets = [[TicketManager sharedInstance] getTickets];
    }
    
    if(!self.presentingTable){
        _presentingTable = [[UITableView alloc] init];
        _presentingTable.translatesAutoresizingMaskIntoConstraints = NO;
    }
    [_presentingTable registerClass:[TicketViewCell self] forCellReuseIdentifier:@"ticket"];
    [_presentingTable setRowHeight:600.0];
    _presentingTable.dataSource = self;
    [self setUpViews];
}

- (void)viewDidLoad {
    [super viewDidLoad];
}

-(NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section{
    return [self.tickets count];
}

-(UITableViewCell*)tableView:(UITableView *)tableView cellForRowAtIndexPath:(nonnull NSIndexPath *)indexPath{
    TicketViewCell* newCell = [_presentingTable dequeueReusableCellWithIdentifier:@"ticket"];
    if(!newCell){
        newCell = [[TicketViewCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:@"ticket"];
    }
    [newCell updateForFlight:[_tickets objectAtIndex:[indexPath row]]];
    return newCell;
}

- (void)setUpViews{
    UIView* headerView = [[UIView alloc] init];
    headerView.translatesAutoresizingMaskIntoConstraints = NO;
    [headerView setBackgroundColor:[UIColor whiteColor]];
    [[headerView layer] setCornerRadius:15.0];
    [self.view addSubview: headerView];
    
    NSLayoutConstraint* headerViewTop = [NSLayoutConstraint constraintWithItem:headerView attribute:NSLayoutAttributeTop relatedBy:NSLayoutRelationEqual toItem:self.view attribute:NSLayoutAttributeTop multiplier:1.0 constant:30.0];
    NSLayoutConstraint* headerViewLead = [NSLayoutConstraint constraintWithItem:headerView attribute:NSLayoutAttributeLeading relatedBy:NSLayoutRelationEqual toItem:self.view attribute:NSLayoutAttributeLeading multiplier:1.0 constant:10.0];
    NSLayoutConstraint* headerViewTrail = [NSLayoutConstraint constraintWithItem:headerView attribute:NSLayoutAttributeTrailing relatedBy:NSLayoutRelationEqual toItem:self.view attribute:NSLayoutAttributeTrailing multiplier:1.0 constant:-30.0];
    NSLayoutConstraint* headerViewHeight = [NSLayoutConstraint  constraintWithItem:headerView attribute:NSLayoutAttributeHeight relatedBy:NSLayoutRelationEqual toItem:nil attribute:NSLayoutAttributeNotAnAttribute multiplier:1.0 constant:60];
    
    [self.view addConstraints:@[headerViewTop, headerViewLead, headerViewTrail, headerViewHeight]];
    
    if(!self.header){
        _header = [[UILabel alloc] init];
        _header.translatesAutoresizingMaskIntoConstraints = NO;
    }
    [_header setText:@"Авиабилеты"];
    [_header setTextAlignment: NSTextAlignmentCenter];
    [_header setTextColor:_mainTheme];
    
    [self.view addSubview:_header];
    
    NSLayoutConstraint* headerTop = [NSLayoutConstraint constraintWithItem:_header attribute:NSLayoutAttributeTop relatedBy:NSLayoutRelationEqual toItem:self.view attribute:NSLayoutAttributeTop multiplier:1.0 constant:30.0];
    NSLayoutConstraint* headerLead = [NSLayoutConstraint constraintWithItem:_header attribute:NSLayoutAttributeLeading relatedBy:NSLayoutRelationEqual toItem:self.view attribute:NSLayoutAttributeLeading multiplier:1.0 constant:30.0];
    NSLayoutConstraint* headerTrail = [NSLayoutConstraint constraintWithItem:_header attribute:NSLayoutAttributeTrailing relatedBy:NSLayoutRelationEqual toItem:self.view attribute:NSLayoutAttributeTrailing multiplier:1.0 constant:-30.0];
    NSLayoutConstraint* headerHeight = [NSLayoutConstraint  constraintWithItem:_header attribute:NSLayoutAttributeHeight relatedBy:NSLayoutRelationEqual toItem:nil attribute:NSLayoutAttributeNotAnAttribute multiplier:1.0 constant:60];
    
    [self.view addConstraints:@[headerTop, headerLead, headerTrail, headerHeight]];
    
    [_presentingTable setBackgroundColor:_mainTheme];
    [self.view addSubview:_presentingTable];
    
    NSLayoutConstraint* presentTop = [NSLayoutConstraint constraintWithItem:_presentingTable attribute:NSLayoutAttributeTop relatedBy:NSLayoutRelationEqual toItem:_header attribute:NSLayoutAttributeBottom multiplier:1.0 constant:10.0];
    NSLayoutConstraint* presentLead = [NSLayoutConstraint constraintWithItem:_presentingTable attribute:NSLayoutAttributeLeading relatedBy:NSLayoutRelationEqual toItem:self.view attribute:NSLayoutAttributeLeading multiplier:1.0 constant:0.0];
    NSLayoutConstraint* presentTrail = [NSLayoutConstraint constraintWithItem:_presentingTable attribute:NSLayoutAttributeTrailing relatedBy:NSLayoutRelationEqual toItem:self.view attribute:NSLayoutAttributeTrailing multiplier:1.0 constant:0.0];
    NSLayoutConstraint* presentBottom = [NSLayoutConstraint constraintWithItem:_presentingTable attribute:NSLayoutAttributeBottom relatedBy:NSLayoutRelationEqual toItem:self.view attribute:NSLayoutAttributeBottom multiplier:1.0 constant:0.0];
    [self.view addConstraints:@[presentTop, presentLead, presentTrail, presentBottom]];
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

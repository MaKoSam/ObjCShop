//
//  PresentViewController.h
//  TripPlaner
//
//  Created by Sam Mazniker on 13/04/2020.
//  Copyright © 2020 Sam Mazniker. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "TicketManager.h"
#import "ActiveSession.h"
#import "Airport.h"
#import "TicketViewCell.h"
#import "MapViewCell.h"

NS_ASSUME_NONNULL_BEGIN

@interface PresentViewController : UIViewController <UITableViewDataSource>

@property (nonatomic, strong) UILabel* header;
@property (nonatomic, strong) UIButton* SearchButton;
@property (nonatomic, strong) UITableView* presentingTable;

@property (nonatomic, strong) NSArray* tickets;
@property (nonatomic, strong) Airport* origin;
@property (nonatomic, strong) Airport* destination;



@end

NS_ASSUME_NONNULL_END

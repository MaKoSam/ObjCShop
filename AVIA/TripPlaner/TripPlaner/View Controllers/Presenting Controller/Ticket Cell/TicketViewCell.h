//
//  TicketViewCell.h
//  TripPlaner
//
//  Created by Sam Mazniker on 14/04/2020.
//  Copyright © 2020 Sam Mazniker. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "ActiveSession.h"
#import "Flight.h"

NS_ASSUME_NONNULL_BEGIN

@interface TicketViewCell : UITableViewCell

@property (nonatomic, strong) UIColor* mainTheme;

@property (nonatomic, strong) Flight* flight;

@property (nonatomic, strong) UIView* backView;
@property (nonatomic, strong) UIView* dropView;

@property (nonatomic, strong) UILabel* price;

@property (nonatomic, strong) UILabel* origin;
@property (nonatomic, strong) UILabel* dest;
@property (nonatomic, strong) UIImageView* icon;

@property (nonatomic, strong) UILabel* changes;

@property (nonatomic, strong) UILabel* flightDepDate;
@property (nonatomic, strong) UILabel* flightDepLabel;
@property (nonatomic, strong) UILabel* flightArrDate;
@property (nonatomic, strong) UILabel* flightArrLabel;

@property (nonatomic, strong) UILabel* flightLength;
@property (nonatomic, strong) UILabel* flightTime;

-(void)updateForFlight:(Flight*)superFlight;


@end

NS_ASSUME_NONNULL_END

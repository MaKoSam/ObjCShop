//
//  PlaceTableCell.h
//  TripPlaner
//
//  Created by Sam Mazniker on 09/04/2020.
//  Copyright © 2020 Sam Mazniker. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "SearchEngine.h"
#import "Airport.h"

NS_ASSUME_NONNULL_BEGIN

@interface PlaceTableCell : UITableViewCell

@property (nonatomic, strong) SearchEngine* search;

@property (nonatomic, strong) Airport* airport;

@property (nonatomic, strong) UILabel* code;
@property (nonatomic, strong) UILabel* name;
@property (nonatomic, strong) UILabel* city_code;
@property (nonatomic, strong) UILabel* country_code;

-(void) setAirport:(Airport * _Nonnull)airport;


@end

NS_ASSUME_NONNULL_END

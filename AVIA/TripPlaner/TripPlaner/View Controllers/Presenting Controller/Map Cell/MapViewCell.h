//
//  MapViewCell.h
//  TripPlaner
//
//  Created by Sam Mazniker on 15/04/2020.
//  Copyright © 2020 Sam Mazniker. All rights reserved.
//

#import <UIKit/UIKit.h>
#import <MapKit/MapKit.h>
#import "City.h"
#import "SearchEngine.h"

NS_ASSUME_NONNULL_BEGIN

@interface MapViewCell : UITableViewCell

@property (nonatomic, strong) City* originCity;
@property (nonatomic, strong) City* destCity;

@property (nonatomic, strong) MKMapView* originCityView;
@property (nonatomic, strong) MKMapView* destCityView;


-(void)updateCitiesWithOrigin:(NSString*)originName Destination:(NSString*)destinationName;

@end

NS_ASSUME_NONNULL_END

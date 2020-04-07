//
//  City.h
//  TripPlaner
//
//  Created by Sam Mazniker on 07/04/2020.
//  Copyright © 2020 Sam Mazniker. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <MapKit/MapKit.h>

NS_ASSUME_NONNULL_BEGIN

@interface City : NSObject

@property (nonatomic, strong) NSString* name;
@property (nonatomic, strong) NSString* time_zone;
@property (nonatomic, strong) NSString* country_code;
@property (nonatomic, strong) NSString* code;
@property (nonatomic, strong) NSDictionary* translations;
@property (nonatomic) CLLocationCoordinate2D coordinates;

-(instancetype) initWithDictionary:(NSDictionary*) dictionary;

@end

NS_ASSUME_NONNULL_END

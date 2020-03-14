//
//  CityClass.h
//  AviaTickets
//
//  Created by Sam Mazniker on 14/03/2020.
//  Copyright © 2020 Sam Mazniker. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <MapKit/MapKit.h>

NS_ASSUME_NONNULL_BEGIN

@interface CityClass : NSObject

@property (nonatomic, strong) NSString* name;
@property (nonatomic, strong) NSString* timeZone;
@property (nonatomic, strong) NSString* countryCode;
@property (nonatomic, strong) NSDictionary* translations;
@property (nonatomic, strong) NSString* code;
@property (nonatomic) CLLocationCoordinate2D coordinates;

-(instancetype) initForDictionary: (NSDictionary*) dictionary;

@end

NS_ASSUME_NONNULL_END

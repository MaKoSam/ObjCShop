//
//  AirportClass.m
//  AviaTickets
//
//  Created by Sam Mazniker on 14/03/2020.
//  Copyright © 2020 Sam Mazniker. All rights reserved.
//

#import "AirportClass.h"

@implementation AirportClass

-(instancetype) initForDictionary:(NSDictionary *)dictionary {
    self = [super init];
    if(self != nil) {
        self.name = [dictionary valueForKey:@"name"];
        self.code = [dictionary valueForKey:@"code"];
        self.cityCode = [dictionary valueForKey:@"city_code"];
        self.countryCode = [dictionary valueForKey:@"country_code"];
        self.timeZone = [dictionary valueForKey:@"time_zone"];
        self.translations = [dictionary valueForKey:@"name_translations"];
        self.flightAble = [dictionary valueForKey:@"flightable"];
        NSDictionary* tmpCoordinates = [dictionary valueForKey:@"coordinates"];
        
        if(tmpCoordinates && ![tmpCoordinates isEqual:[NSNull null]]){
            NSNumber *tmpLon = [tmpCoordinates valueForKey:@"lon"];
            NSNumber *tmpLat = [tmpCoordinates valueForKey:@"lat"];
            
            if(![tmpLat isEqual:[NSNull null]] && ![tmpLon isEqual:[NSNull null]]){
                self.coordinates = CLLocationCoordinate2DMake([tmpLat doubleValue], [tmpLon doubleValue]);
            }
        }
    }
    return self;
}

@end

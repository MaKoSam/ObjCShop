//
//  CityClass.m
//  AviaTickets
//
//  Created by Sam Mazniker on 14/03/2020.
//  Copyright © 2020 Sam Mazniker. All rights reserved.
//

#import "CityClass.h"

@implementation CityClass

-(instancetype)initForDictionary:(NSDictionary *)dictionary {
    self = [super init];
    if(![self isEqual:[NSNull null]]){
        self.name = [dictionary valueForKey:@"name"];
        self.countryCode = [dictionary valueForKey:@"country_code"];
        self.timeZone = [dictionary valueForKey:@"time_zone"];
        self.translations = [dictionary valueForKey:@"name_translations"];
        NSDictionary* tmpCoordinates = [dictionary valueForKey:@"coordinates"];
        
        if(tmpCoordinates && ![tmpCoordinates isEqual:[NSNull null]]){
            NSNumber* tmpLon = [tmpCoordinates valueForKey:@"lon"];
            NSNumber* tmpLat = [tmpCoordinates valueForKey:@"lat"];
            
            if(![tmpLon isEqual:[NSNull null]] && ![tmpLat isEqual:[NSNull null]]){
                self.coordinates = CLLocationCoordinate2DMake([tmpLat doubleValue], [tmpLon doubleValue]);
            }
        }
    }
    return self;
}

@end

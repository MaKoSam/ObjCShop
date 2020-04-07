//
//  Airport.m
//  TripPlaner
//
//  Created by Sam Mazniker on 07/04/2020.
//  Copyright © 2020 Sam Mazniker. All rights reserved.
//

#import "Airport.h"

@implementation Airport

-(instancetype) initWithDictionary:(NSDictionary *)dictionary{
    self = [super init];
    if(self){
        _code = [dictionary valueForKey:@"code"];
        _name = [dictionary valueForKey:@"name"];
        _time_zone = [dictionary valueForKey:@"time_zone"];
        _translations = [dictionary valueForKey:@"name_translations"];
        _country_code = [dictionary valueForKey:@"country_code"];
        _city_code = [dictionary valueForKey:@"city_code"];
        @try {
            NSDictionary* tmp = [[NSDictionary alloc] initWithDictionary:[dictionary valueForKey:@"coordinates"]];
            if(tmp && ![tmp isEqual:[NSNull null]]){
                NSNumber* lon = [tmp valueForKey:@"lon"];
                NSNumber* lat = [tmp valueForKey:@"lat"];
                if(![lon isEqual:[NSNull null]] && ![lat isEqual:[NSNull null]]){
                    self.coordinates = CLLocationCoordinate2DMake([lat doubleValue], [lon doubleValue]);
                }
            }
        }
        @catch(id anException) {
#pragma mark - Caught exception, because Airport has no Coordinates
        }
    }
    return self;
}

@end

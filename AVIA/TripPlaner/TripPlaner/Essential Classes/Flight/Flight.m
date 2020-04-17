//
//  Flight.m
//  TripPlaner
//
//  Created by Sam Mazniker on 13/04/2020.
//  Copyright © 2020 Sam Mazniker. All rights reserved.
//

#import "Flight.h"

@implementation Flight

-(instancetype)initWithDictionary:(NSDictionary *)dictionary{
    self = [super init];
    if(self){
        _depart_date = [dictionary valueForKey:@"depart_date"];
        _destination = [dictionary valueForKey:@"destination"];
        _distance = [dictionary valueForKey:@"distance"];
        _duration = [dictionary valueForKey:@"duration"];
        _found_at = [dictionary valueForKey:@"found_at"];
        _gate = [dictionary valueForKey:@"gate"];
        _changes = [dictionary valueForKey:@"number_of_changes"];
        _origin = [dictionary valueForKey:@"origin"];
        @try {
            _returnDate = [dictionary valueForKey:@"return_date"];
        } @catch (NSException *exception) { }
        _trip_class = [dictionary valueForKey:@"trip_class"];
        _value = [dictionary valueForKey:@"value"];
    }
    return self;
}

@end

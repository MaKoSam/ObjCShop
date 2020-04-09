//
//  SearchRequest.m
//  TripPlaner
//
//  Created by Sam Mazniker on 08/04/2020.
//  Copyright © 2020 Sam Mazniker. All rights reserved.
//

#import "SearchRequest.h"

@implementation SearchRequest

-(instancetype) initDefault{
    self = [super init];
    _origin = @"notset";
    _destination = @"notset";
    _currency = @"rub";
    _period_type = @"month";
    _one_way = @"false";
    _trip_duration = @"1";
    return self;
}

@end

//
//  SearchEngine.m
//  TripPlaner
//
//  Created by Sam Mazniker on 08/04/2020.
//  Copyright © 2020 Sam Mazniker. All rights reserved.
//

#import "SearchEngine.h"

@implementation SearchEngine

-(NSArray*) findPlaceByKey:(NSString *)key{
    NSString* countryCode = [[NSString alloc] initWithString:[self findCountryByKey:key]];
    NSArray* cityCodeSearch = [[NSArray alloc] initWithArray:[self findCityByKey:key orCountryCode: countryCode]];
    
    return [self findAirpotByKey:key orCityCode:cityCodeSearch];
}

-(NSString*) findCountryByKey:(NSString *)key {
    for(Country* items in [DestinationsManager sharedInstance].countries){
        if([items.code isEqual:key] || [items.name isEqual:key] || [[items.translations valueForKey:[ActiveSession sharedInstance].settings.activeSettings.language] isEqual: key]){
            return items.code;
        }
    }
    return @"NULL";
}

-(NSArray*) findCityByKey:(NSString *)key orCountryCode:(NSString *)countryCode {
    NSMutableArray* results = [[NSMutableArray alloc] init];
    if([countryCode isEqual: @"NULL"]){
        for(City* items in [DestinationsManager sharedInstance].cities){
            if([items.code isEqual:key] || [items.name isEqual:key] || [[items.translations valueForKey:[ActiveSession sharedInstance].settings.activeSettings.language] isEqual:key]){
                [results addObject: items.code];
            }
        }
    } else {
        for(City* items in [DestinationsManager sharedInstance].cities){
            if([items.country_code isEqual:countryCode]){
                [results addObject: items.code];
            }
        }
    }
    
    if([results count] == 0) {
        [results addObject:@"NULL"];
    }
    
    return results;
}

-(NSArray*) findAirpotByKey:(NSString *)key orCityCode:(NSArray *)cityCode {
    NSMutableArray* result = [[NSMutableArray alloc] init];
    if([[cityCode objectAtIndex:0] isEqual:@"NULL"]){
        for(Airport* items in [DestinationsManager sharedInstance].airports){
            if([items.code isEqual:key] || [items.name isEqual:key] || [[items.translations valueForKey:[ActiveSession sharedInstance].settings.activeSettings.language] isEqual:key]){
                [result addObject:items];
            }
        }
    } else {
        for(NSString* code in cityCode){
            for(Airport* items in [DestinationsManager sharedInstance].airports){
                if([items.city_code isEqual:code]){
                    [result addObject:items];
                }
            }
        }
    }
    return result;
}

-(NSString*) findCityByKeyReturnName:(NSString*)key{
    for(City* items in [DestinationsManager sharedInstance].cities){
        if([items.code isEqual:key]){
            return items.name;
        }
    }
    return @"NULL";
}

-(NSString*) findCountryByKeyReturnName:(NSString*)key{
    for(Country* items in [DestinationsManager sharedInstance].countries){
        if([items.code isEqual:key]){
            return items.name;
        }
    }
    return @"NULL";
}

@end

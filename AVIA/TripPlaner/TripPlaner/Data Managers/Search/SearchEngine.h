//
//  SearchEngine.h
//  TripPlaner
//
//  Created by Sam Mazniker on 08/04/2020.
//  Copyright © 2020 Sam Mazniker. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "DestinationsManager.h"
#import "ActiveSession.h"

NS_ASSUME_NONNULL_BEGIN

@interface SearchEngine : NSObject

-(NSArray*) findPlaceByKey:(NSString*)key;

-(NSString*) findCountryByKey:(NSString*)key;
-(NSArray*) findCityByKey:(NSString*)key orCountryCode:(NSString*) countryCode;
-(NSArray*) findAirpotByKey:(NSString*)key orCityCode:(NSArray*) cityCode;

@end

NS_ASSUME_NONNULL_END

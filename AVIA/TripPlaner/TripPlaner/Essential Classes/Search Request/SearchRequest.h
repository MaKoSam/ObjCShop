//
//  SearchRequest.h
//  TripPlaner
//
//  Created by Sam Mazniker on 08/04/2020.
//  Copyright © 2020 Sam Mazniker. All rights reserved.
//

#import <Foundation/Foundation.h>

NS_ASSUME_NONNULL_BEGIN

@interface SearchRequest : NSObject

@property (nonatomic, strong) NSString* currency; //from Settings
@property (nonatomic, strong) NSString* origin;
@property (nonatomic, strong) NSString* destination;
@property (nonatomic, strong) NSString* beginning_of_period;
@property (nonatomic, strong) NSString* period_type; // = month
@property (nonatomic, strong) NSString* one_way;//BOOL'true' or 'false'
@property (nonatomic, strong) NSString* trip_duration; //Int
@property (nonatomic, strong) NSString* BeginPeriod; //For formatting

//For UI
@property (nonatomic, strong) NSString* originCity;
@property (nonatomic, strong) NSString* originCountry;
@property (nonatomic, strong) NSString* destCity;
@property (nonatomic, strong) NSString* destCountry;


-(instancetype) initDefault;

-(BOOL) readyToSearch;

@end

NS_ASSUME_NONNULL_END

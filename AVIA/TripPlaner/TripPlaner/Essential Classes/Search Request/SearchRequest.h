//
//  SearchRequest.h
//  TripPlaner
//
//  Created by Sam Mazniker on 08/04/2020.
//  Copyright © 2020 Sam Mazniker. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "ActiveSession.h"

NS_ASSUME_NONNULL_BEGIN

@interface SearchRequest : NSObject

@property (nonatomic, strong) NSString* currency; //from Settings
@property (nonatomic, strong) NSString* origin;
@property (nonatomic, strong) NSString* destination;
@property (nonatomic, strong) NSString* beginning_of_period;
@property (nonatomic, strong) NSString* period_type; // = month
@property (nonatomic, strong) NSString* one_way;//BOOL'true' or 'false'
@property (nonatomic, strong) NSString* trip_duration; //Int

-(instancetype) initDefault;

@end

NS_ASSUME_NONNULL_END

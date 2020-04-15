//
//  Flight.h
//  TripPlaner
//
//  Created by Sam Mazniker on 13/04/2020.
//  Copyright © 2020 Sam Mazniker. All rights reserved.
//

#import <Foundation/Foundation.h>

NS_ASSUME_NONNULL_BEGIN

@interface Flight : NSObject

@property (nonatomic, strong) NSString* depart_date;
@property (nonatomic, strong) NSString* destination;
@property (nonatomic, strong) NSNumber* distance;
@property (nonatomic, strong) NSNumber* duration;
@property (nonatomic, strong) NSString* found_at;
@property (nonatomic, strong) NSString* gate;
@property (nonatomic, strong) NSNumber* changes;
@property (nonatomic, strong) NSString* origin;
@property (nonatomic, strong) NSString* returnDate;
@property (nonatomic, strong) NSNumber* trip_class;
@property (nonatomic, strong) NSNumber* value;

-(instancetype)initWithDictionary:(NSDictionary* )dictionary;

@end

NS_ASSUME_NONNULL_END

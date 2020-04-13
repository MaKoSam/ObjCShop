//
//  FlightRequest.h
//  TripPlaner
//
//  Created by Sam Mazniker on 10/04/2020.
//  Copyright © 2020 Sam Mazniker. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "ActiveSession.h"

NS_ASSUME_NONNULL_BEGIN

@interface FlightRequest : NSObject

-(void)flightsFromSearchRequest:(SearchRequest*)request :(void(^)(NSArray*))completionHandler;

-(NSString*)generateApiFromRequest:(SearchRequest*)request;

@end

NS_ASSUME_NONNULL_END

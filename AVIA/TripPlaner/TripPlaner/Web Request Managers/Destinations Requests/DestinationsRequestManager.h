//
//  DestinationsRequestManager.h
//  TripPlaner
//
//  Created by Sam Mazniker on 07/04/2020.
//  Copyright © 2020 Sam Mazniker. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "DestinationsManager.h"

NS_ASSUME_NONNULL_BEGIN

@interface DestinationsRequestManager : NSObject

-(void)requsetAllDestinations:(void(^)(void))completionHandler;


#pragma mark - Private Request Functions operated from All-Dest.
-(void)requestAirportDestinations:(void(^)(void))completionHandler;
-(void)requestCityDestinations:(void(^)(void))completionHandler;
-(void)requestCountryDestinations:(void(^)(void))completionHandler;


@end

NS_ASSUME_NONNULL_END

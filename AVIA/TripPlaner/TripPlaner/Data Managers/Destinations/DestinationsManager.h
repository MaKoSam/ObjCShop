//
//  DestinationsManager.h
//  TripPlaner
//
//  Created by Sam Mazniker on 07/04/2020.
//  Copyright © 2020 Sam Mazniker. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "Airport.h"
#import "City.h"
#import "Country.h"

NS_ASSUME_NONNULL_BEGIN

@interface DestinationsManager : NSObject

@property (nonatomic, strong) NSMutableArray* countries;
@property (nonatomic, strong) NSMutableArray* cities;
@property (nonatomic, strong) NSMutableArray* airports;

+(instancetype)sharedInstance;

-(void) uploadDataFrom:(NSArray*)json ofType:(int)type; 

@end

NS_ASSUME_NONNULL_END

//
//  ActiveSession.h
//  TripPlaner
//
//  Created by Sam Mazniker on 08/04/2020.
//  Copyright © 2020 Sam Mazniker. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "SettingsManager.h"

NS_ASSUME_NONNULL_BEGIN

@interface ActiveSession : NSObject

@property (nonatomic, strong) SettingsManager* settings;
//TravelPayouts API-token
@property (nonatomic, strong) NSString* apiToken;

-(instancetype) initDefault;

+(instancetype)sharedInstance;


@end

NS_ASSUME_NONNULL_END

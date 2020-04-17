//
//  SettingsManager.h
//  TripPlaner
//
//  Created by Sam Mazniker on 08/04/2020.
//  Copyright © 2020 Sam Mazniker. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "UserSettings.h"

NS_ASSUME_NONNULL_BEGIN

@interface SettingsManager : NSObject

@property (nonatomic, strong) UserSettings* activeSettings;

-(instancetype) initDefault;

-(void)fetchSettingsFromCache;
-(void)saveSettingsToCache;

-(void)updateSettings:(NSString*)user withLanguage:(NSString*)lang withCurrency:(NSString*)curr;

@end

NS_ASSUME_NONNULL_END

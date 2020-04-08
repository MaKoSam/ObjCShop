//
//  SettingsManager.m
//  TripPlaner
//
//  Created by Sam Mazniker on 08/04/2020.
//  Copyright © 2020 Sam Mazniker. All rights reserved.
//

#import "SettingsManager.h"

@implementation SettingsManager

-(instancetype) initDefault {
    self = [super init];
    if(self){
        _activeSettings = [[UserSettings alloc] initDefaultSets];
    }
    return self;
}

-(BOOL) fetchSettingsFromCache {
    //Try to fetch data from file manager
    //Return YES - if success
    //Return NO - if fail
    return NO;
}

-(void) saveSettingsToCache {
    //Try to save data to file manager
}

-(void) updateSettings:(NSString *)user withLanguage:(NSString *)lang withCurrency:(NSString *)curr {
    if(!self.activeSettings){
        _activeSettings = [[UserSettings alloc] initDefaultSets];
    }
    _activeSettings.user_name = user;
    _activeSettings.language = lang;
    _activeSettings.currency = curr;
    
    //Dispatch Background queue and save sets to cache
    [self saveSettingsToCache];
}

@end

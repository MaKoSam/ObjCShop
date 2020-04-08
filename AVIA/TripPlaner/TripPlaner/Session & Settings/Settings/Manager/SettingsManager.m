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

-(void) fetchSettingsFromCache {
    NSArray* path = NSSearchPathForDirectoriesInDomains(NSCachesDirectory, NSUserDomainMask, YES);
    NSString* cacheDirectory = [path objectAtIndex:0];
    NSString* settingCacheFilePath = [cacheDirectory stringByAppendingString:@"settings.txt"];
    @try {
        NSError* error;
        NSData* settingsData = [[NSFileManager defaultManager] contentsAtPath:settingCacheFilePath];
        NSDictionary* settingsDictionary = [NSKeyedUnarchiver unarchivedObjectOfClass:[NSDictionary self] fromData:settingsData error:&error];
            [self updateSettings:[settingsDictionary valueForKey:@"name"] withLanguage:[settingsDictionary valueForKey:@"language"] withCurrency:[settingsDictionary valueForKey:@"currency"]];
    }
    @catch(id anExeption) {
        NSLog(@"Warning. Failed downloading settings data from Cache.\n");
    }
}

-(void) saveSettingsToCache {
    dispatch_queue_t backgroundPriorityQueue = dispatch_get_global_queue(DISPATCH_QUEUE_PRIORITY_BACKGROUND, 0);
    dispatch_async(backgroundPriorityQueue, ^(){
        NSArray* path = NSSearchPathForDirectoriesInDomains(NSCachesDirectory, NSUserDomainMask, YES);
        NSString* cacheDirectory = [path objectAtIndex:0];
        NSString* settingCacheFilePath = [cacheDirectory stringByAppendingString:@"settings.txt"];
        @try{
            NSMutableDictionary*settingsDictionary = [[NSMutableDictionary alloc] init];
            [settingsDictionary setValue:self->_activeSettings.user_name forKey:@"name"];
            [settingsDictionary setValue:self->_activeSettings.language forKey:@"language"];
            [settingsDictionary setValue:self->_activeSettings.currency forKey:@"currency"];
            NSError *error;
            NSData* settingsData = [NSKeyedArchiver archivedDataWithRootObject:settingsDictionary requiringSecureCoding:NO error: &error];
            [settingsData writeToFile:settingCacheFilePath atomically:YES];
        }
        @catch (id anException){
            NSLog(@"Warning.Failed to save settings data to Caches.\n");
        }
    });
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

//
//  ActiveSession.m
//  TripPlaner
//
//  Created by Sam Mazniker on 08/04/2020.
//  Copyright © 2020 Sam Mazniker. All rights reserved.
//

#import "ActiveSession.h"

@implementation ActiveSession

+(instancetype)sharedInstance{
    static ActiveSession* session;
    static dispatch_once_t onceToken;
    dispatch_once(&onceToken, ^{
        session = [[ActiveSession alloc] initDefault];
    });
    return session;
}

-(instancetype) initDefault {
    self = [super init];
    if(self){
        self.apiToken = @"92f6997c76c68140e274c5aed1bd7885";
        self.settings = [[SettingsManager alloc] initDefault];
    }
    return self;
}

@end

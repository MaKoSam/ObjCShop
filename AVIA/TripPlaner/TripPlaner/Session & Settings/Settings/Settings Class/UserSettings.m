//
//  UserSettings.m
//  TripPlaner
//
//  Created by Sam Mazniker on 08/04/2020.
//  Copyright © 2020 Sam Mazniker. All rights reserved.
//

#import "UserSettings.h"

@implementation UserSettings

-(instancetype) initDefaultSets {
    self = [super init];
    if(self){
        _user_name = @"Not set";
        _language = @"ru";
        _currency = @"rub";
    }
    return self;
}

@end

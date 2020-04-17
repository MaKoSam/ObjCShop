//
//  DestinationsManager.m
//  TripPlaner
//
//  Created by Sam Mazniker on 07/04/2020.
//  Copyright © 2020 Sam Mazniker. All rights reserved.
//


//Develop: Should have an itentity saved to the device-cache folder

#import "DestinationsManager.h"

@implementation DestinationsManager

+(instancetype)sharedInstance{
    static DestinationsManager* instance;
    static dispatch_once_t onceToken;
    dispatch_once(&onceToken, ^{
        instance = [[DestinationsManager alloc] init];
    });
    return instance;
}



-(void) uploadDataFrom:(NSArray *)json ofType:(int)type{
    if(!DestinationsManager.sharedInstance.airports){
        DestinationsManager.sharedInstance.airports = [[NSMutableArray alloc] init];
    }
    if(!DestinationsManager.sharedInstance.cities){
        DestinationsManager.sharedInstance.cities = [[NSMutableArray alloc] init];
    }
    if(!DestinationsManager.sharedInstance.countries){
        DestinationsManager.sharedInstance.countries = [[NSMutableArray alloc] init];
    }
    
    switch (type) {
        case 1: //Country
            for(NSDictionary* items in json){
                Country* new = [[Country alloc] initWithDictionary: items];
                [DestinationsManager.sharedInstance.countries addObject: new];
            }
            break;
        case 2: //City
            for(NSDictionary* items in json){
                City* new = [[City alloc] initWithDictionary: items];
                [DestinationsManager.sharedInstance.cities addObject: new];
            }
            break;
        case 3: //Airport
            for(NSDictionary* items in json){
                Airport* new = [[Airport alloc] initWithDictionary: items];
                //Filtering Non-Existing or Non-Flightable
                if(![new.name isEqual:[NSNull null]] && ![new.code isEqual:[NSNull null]] && [new.flightable isEqual:@"YES"]){
                    [DestinationsManager.sharedInstance.airports addObject: new];
                }
            }
            break;
        default:
            NSLog(@"Warning! Undefined type detected while decoding data from JSON-response");
            break;
    }
}

@end

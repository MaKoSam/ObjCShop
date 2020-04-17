//
//  TicketManager.m
//  TripPlaner
//
//  Created by Sam Mazniker on 13/04/2020.
//  Copyright © 2020 Sam Mazniker. All rights reserved.
//

#import "TicketManager.h"

@implementation TicketManager

+(instancetype)sharedInstance{
    static TicketManager* instance;
    static dispatch_once_t onceToken;
    dispatch_once(&onceToken, ^{
        instance = [[TicketManager alloc] init];
    });
    return instance;
}

-(void)uploadTicketsFromSearch:(NSArray *)JSON{
    if(!self.tickets){
        _tickets = [[NSMutableArray alloc] init];
    }
    
    for(NSDictionary* item in JSON){
        Flight* new = [[Flight alloc] initWithDictionary:item];
        [_tickets addObject: new];
    }
}

-(NSArray*)getTickets{
    if(self.tickets){
        return _tickets;
    }
    return NULL;
}

@end

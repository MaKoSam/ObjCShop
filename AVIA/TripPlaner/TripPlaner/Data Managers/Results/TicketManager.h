//
//  TicketManager.h
//  TripPlaner
//
//  Created by Sam Mazniker on 13/04/2020.
//  Copyright © 2020 Sam Mazniker. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "Flight.h"

NS_ASSUME_NONNULL_BEGIN

@interface TicketManager : NSObject

@property (nonatomic, strong) NSMutableArray* tickets;

+(instancetype)sharedInstance;
-(void)uploadTicketsFromSearch:(NSArray*)JSON;
-(NSArray*)getTickets;

@end

NS_ASSUME_NONNULL_END

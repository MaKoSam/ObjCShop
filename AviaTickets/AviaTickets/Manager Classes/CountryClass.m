//
//  CountryClass.m
//  AviaTickets
//
//  Created by Sam Mazniker on 14/03/2020.
//  Copyright © 2020 Sam Mazniker. All rights reserved.
//

#import "CountryClass.h"

@implementation CountryClass

-(instancetype) initFromDictionary:(NSDictionary *)dictionary {
    self = [super init];
    if(self != nil){
        self.name = [dictionary valueForKey:@"name"];
        self.currency = [dictionary valueForKey:@"currency"];
        self.translations = [dictionary objectForKey:@"name_translations"];
        self.code = [dictionary valueForKey:@"code"];
    }
    return self;
}

@end

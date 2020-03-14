//
//  CountryClass.h
//  AviaTickets
//
//  Created by Sam Mazniker on 14/03/2020.
//  Copyright © 2020 Sam Mazniker. All rights reserved.
//

#import <Foundation/Foundation.h>

NS_ASSUME_NONNULL_BEGIN

@interface CountryClass : NSObject

@property (nonatomic, strong) NSString* name;
@property (nonatomic, strong) NSString* currency;
@property (nonatomic, strong) NSDictionary* translations;
@property (nonatomic, strong) NSString* code;

-(instancetype) initFromDictionary: (NSDictionary*) dictionary;

@end

NS_ASSUME_NONNULL_END

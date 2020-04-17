//
//  Country.h
//  TripPlaner
//
//  Created by Sam Mazniker on 07/04/2020.
//  Copyright © 2020 Sam Mazniker. All rights reserved.
//

#import <Foundation/Foundation.h>

NS_ASSUME_NONNULL_BEGIN

@interface Country : NSObject

@property (nonatomic, strong) NSString* name;
@property (nonatomic, strong) NSString* currency;
@property (nonatomic, strong) NSString* code;
@property (nonatomic, strong) NSDictionary* translations;

-(instancetype)initWithDictionary:(NSDictionary*)dictionary;

@end

NS_ASSUME_NONNULL_END

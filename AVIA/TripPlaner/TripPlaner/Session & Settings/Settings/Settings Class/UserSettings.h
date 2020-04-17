//
//  UserSettings.h
//  TripPlaner
//
//  Created by Sam Mazniker on 08/04/2020.
//  Copyright © 2020 Sam Mazniker. All rights reserved.
//

#import <Foundation/Foundation.h>

NS_ASSUME_NONNULL_BEGIN

@interface UserSettings : NSObject

@property (nonatomic, strong) NSString* user_name;
@property (nonatomic, strong) NSString* language;
@property (nonatomic, strong) NSString* currency;

-(instancetype)initDefaultSets;

@end

NS_ASSUME_NONNULL_END

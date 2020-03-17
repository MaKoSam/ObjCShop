//
//  ThemeManager.h
//  class1
//
//  Created by Sam Mazniker on 16/03/2020.
//  Copyright © 2020 Sam Mazniker. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <UIKit/UIKit.h>
#import "Theme.h"

NS_ASSUME_NONNULL_BEGIN

@interface ThemeManager : NSObject

@property (nonatomic, strong) Theme* currentTheme;
@property (nonatomic, strong) NSArray* themeDataBase;

+(instancetype)Theme;
-(void)changeThemeTo:(ThemeStyle) style;

@end

NS_ASSUME_NONNULL_END

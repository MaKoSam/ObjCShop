//
//  ThemeManager.h
//  class1
//
//  Created by Sam Mazniker on 16/03/2020.
//  Copyright © 2020 Sam Mazniker. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <UIKit/UIKit.h>

NS_ASSUME_NONNULL_BEGIN

typedef enum {
    Default,
    Dark
} ThemeStyle;

@interface ThemeManager : NSObject

@property (nonatomic, strong) UIColor* mainColor;
@property (nonatomic, strong) UIFont* mainFont;
@property (nonatomic, strong) UIColor* fontColor;
@property (nonatomic, strong) NSString* themeName;


+(instancetype)Theme;
-(void)changeThemeTo:(ThemeStyle) style;

@end

NS_ASSUME_NONNULL_END

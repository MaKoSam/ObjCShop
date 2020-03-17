//
//  Theme.h
//  class1
//
//  Created by Sam Mazniker on 17/03/2020.
//  Copyright © 2020 Sam Mazniker. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <UIKit/UIKit.h>

NS_ASSUME_NONNULL_BEGIN

typedef enum {
    Default,
    Dark,
    Blue,
    Yellow,
    Gray,
    Green
} ThemeStyle;

@interface Theme : NSObject

@property (nonatomic) ThemeStyle style;
@property (nonatomic, strong) UIColor* mainColor;
@property (nonatomic, strong) UIFont* mainFont;
@property (nonatomic, strong) UIColor* fontColor;
@property (nonatomic, strong) NSString* themeName;

-(instancetype)initTheme:(ThemeStyle)style withName:(NSString*)name font:(UIFont*)font fontColor:(UIColor*)fontColor backGroundColor:(UIColor*)color;

@end

NS_ASSUME_NONNULL_END

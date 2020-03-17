//
//  Theme.m
//  class1
//
//  Created by Sam Mazniker on 17/03/2020.
//  Copyright © 2020 Sam Mazniker. All rights reserved.
//

#import "Theme.h"

@implementation Theme

-(instancetype)initTheme:(ThemeStyle)style withName:(NSString *)name font:(UIFont *)font fontColor:(UIColor *)fontColor backGroundColor:(UIColor *)color{
    self = [super init];
    _style = style;
    _themeName = name;
    _mainFont = font;
    _fontColor = fontColor;
    _mainColor = color;
    return self;
}

@end

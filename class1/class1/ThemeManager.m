//
//  ThemeManager.m
//  class1
//
//  Created by Sam Mazniker on 16/03/2020.
//  Copyright © 2020 Sam Mazniker. All rights reserved.
//

#import "ThemeManager.h"

@implementation ThemeManager

+(instancetype)Theme {
    static ThemeManager* Theme = nil;
    if(Theme == nil) {
        Theme = [[ThemeManager alloc] init];
        [Theme changeThemeTo:Default];
    }
    return Theme;
}

-(void) changeThemeTo:(ThemeStyle)style {
    switch (style) {
        case Default: {
            ThemeManager.Theme.mainColor = [UIColor whiteColor];
            UIFont* defaultFont = [UIFont fontWithName:@"Helvetica-Bold" size:14.0];
            ThemeManager.Theme.mainFont = defaultFont;
            ThemeManager.Theme.fontColor = [UIColor blackColor];
            ThemeManager.Theme.themeName = @"Default";
        }
            break;
        case Dark: {
            ThemeManager.Theme.mainColor = [UIColor blackColor];
            UIFont* darkFont = [UIFont fontWithName:@"Helvetica" size:20.0];
            ThemeManager.Theme.mainFont = darkFont;
            ThemeManager.Theme.fontColor = [UIColor whiteColor];
            ThemeManager.Theme.themeName = @"Dark";
        }
            break;
    }
    
}

@end

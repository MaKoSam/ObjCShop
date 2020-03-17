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
    static ThemeManager* theme = nil;
    //Theme Style Base
    theme.themeDataBase = @[ [[Theme alloc] initTheme:Default withName:@"Default" font:[UIFont fontWithName:@"Helvetica" size:14.0] fontColor:[UIColor blackColor] backGroundColor:[UIColor whiteColor]],
    [[Theme alloc] initTheme:Dark withName:@"Dark" font:[UIFont fontWithName:@"Helvetica-Bold" size:14.0] fontColor:[UIColor whiteColor] backGroundColor:[UIColor blackColor]],
    [[Theme alloc] initTheme:Blue withName:@"Blue" font:[UIFont fontWithName:@"Helvetica-Bold" size:14.0] fontColor:[UIColor whiteColor] backGroundColor:[UIColor blueColor]],
    [[Theme alloc] initTheme:Yellow withName:@"Yellow" font:[UIFont fontWithName:@"Helvetica" size:16.0] fontColor:[UIColor blackColor] backGroundColor:[UIColor yellowColor]],
    [[Theme alloc] initTheme:Green withName:@"Green" font:[UIFont fontWithName:@"Helvetica" size:16.0] fontColor:[UIColor whiteColor] backGroundColor:[UIColor greenColor]],
    [[Theme alloc] initTheme:Gray withName:@"Gray" font:[UIFont fontWithName:@"Helvetica" size:16.0] fontColor:[UIColor blackColor] backGroundColor:[UIColor grayColor]] ];
    
    if(theme == nil) {
        theme = [[ThemeManager alloc] init];
        [theme changeThemeTo: Default];
    }
    return theme;
}



-(void) changeThemeTo:(ThemeStyle)style {
    switch (style) {
        case Default:
            [ThemeManager Theme].currentTheme = [[ThemeManager Theme].themeDataBase objectAtIndex:0];
            break;
        case Dark:
            [ThemeManager Theme].currentTheme = [[ThemeManager Theme].themeDataBase objectAtIndex:1];
            break;
        case Blue:
            [ThemeManager Theme].currentTheme = [[ThemeManager Theme].themeDataBase objectAtIndex:2];
            break;
        case Yellow:
            [ThemeManager Theme].currentTheme = [[ThemeManager Theme].themeDataBase objectAtIndex:3];
            break;
        case Gray:
            [ThemeManager Theme].currentTheme = [[ThemeManager Theme].themeDataBase objectAtIndex:5];
            break;
        case Green:
            [ThemeManager Theme].currentTheme = [[ThemeManager Theme].themeDataBase objectAtIndex:4];
            break;
    }

}
    

@end

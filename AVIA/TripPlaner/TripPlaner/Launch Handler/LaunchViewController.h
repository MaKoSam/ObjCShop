//
//  LaunchViewController.h
//  TripPlaner
//
//  Created by Sam Mazniker on 07/04/2020.
//  Copyright © 2020 Sam Mazniker. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "DestinationsRequestManager.h"
#import "SearchViewController.h"

NS_ASSUME_NONNULL_BEGIN

@interface LaunchViewController : UIViewController

@property (nonatomic, strong) UIImageView* LaunchBackgroundView;

-(void) launchNormal;

@end

NS_ASSUME_NONNULL_END

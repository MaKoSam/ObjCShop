//
//  SearchViewController.h
//  TripPlaner
//
//  Created by Sam Mazniker on 08/04/2020.
//  Copyright © 2020 Sam Mazniker. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "SearchRequest.h"

NS_ASSUME_NONNULL_BEGIN

@interface SearchViewController : UIViewController

@property (nonatomic, strong) SearchRequest* searchRequest;

@property (nonatomic, strong) UIImageView* SearchBackgroundView;

@end

NS_ASSUME_NONNULL_END

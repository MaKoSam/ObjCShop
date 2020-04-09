//
//  SearchViewController.h
//  TripPlaner
//
//  Created by Sam Mazniker on 08/04/2020.
//  Copyright © 2020 Sam Mazniker. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "PlaceViewController.h"
#import "ActiveSession.h"

NS_ASSUME_NONNULL_BEGIN

@interface SearchViewController : UIViewController

@property (nonatomic, strong) UIView* PlacesView;
@property (nonatomic, strong) UIButton* originSelect;
@property (nonatomic, strong) UIButton* destinationSelect;

@property (nonatomic, strong) UIView* AdditionalView;
@property (nonatomic, strong) UIButton* datePickerButton;
@property (nonatomic, strong) UIButton* searchButton;
@property (nonatomic, strong) UISegmentedControl* typePickerControl;

-(void)setUpPlacesView;
-(void)setUPSelectors;
-(void)setUpLabels;


@end

NS_ASSUME_NONNULL_END

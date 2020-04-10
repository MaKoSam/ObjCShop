//
//  SearchViewController.h
//  TripPlaner
//
//  Created by Sam Mazniker on 08/04/2020.
//  Copyright © 2020 Sam Mazniker. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "PlaceViewController.h"
#import "DateViewController.h"
#import "ActiveSession.h"

NS_ASSUME_NONNULL_BEGIN

@interface SearchViewController : UIViewController

@property (nonatomic, strong) UIView* PlacesView; //Selector
@property (nonatomic, strong) UIButton* originSelect; //Selector
@property (nonatomic, strong) UIButton* destinationSelect; //Selector

@property (nonatomic, strong) UIView* PickerView; //Picker
@property (nonatomic, strong) UIButton* datePickerButton; //Picker
@property (nonatomic, strong) UISegmentedControl* typePickerControl; //Picker

@property (nonatomic, strong) UIButton* searchButton;


-(void)setUpPlacesView;
-(void)setUpSelectors;
-(void)setUpLabels;

-(void)setUpPickerView;
-(void)setUpPickers;


@end

NS_ASSUME_NONNULL_END

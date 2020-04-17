//
//  SearchViewController.m
//  TripPlaner
//
//  Created by Sam Mazniker on 08/04/2020.
//  Copyright © 2020 Sam Mazniker. All rights reserved.
//

#import "SearchViewController.h"

@interface SearchViewController ()

@property (nonatomic, strong) UIColor* mainTheme;
@property (nonatomic, strong) UILabel* fromLabel; //Labels
@property (nonatomic, strong) UILabel* toLabel; //Labels

@end

@implementation SearchViewController
- (void)viewWillAppear:(BOOL)animated{
    [super viewWillAppear: animated];
    if(!self.mainTheme){
        _mainTheme = [UIColor colorWithRed:0.15 green:0.09 blue:0.14 alpha:1.0];
    }
    [self.navigationController setNavigationBarHidden:YES];
    [self.view setBackgroundColor: _mainTheme];
    
    //SetUp UI
    [self setUpHeader];
    [self setUpPlacesView];
    [self setUpLabels];
    [self setUpSelectors];
    [self setUpCities];
    [self setUpIcons];
    [self setUpPickerView];
    [self setUpPickers];
    [self setUpButton];
}

- (void)viewDidLoad {
    [super viewDidLoad];
    [self.navigationController setNavigationBarHidden:YES];
    
}

-(void) StartSearching:(id)sender{
    if([ActiveSession sharedInstance].search.readyToSearch){
        LoadingViewController* newController = [[LoadingViewController alloc] init];
        [self.navigationController pushViewController:newController animated:YES];
    } else {
        [self performAlert];
    }
}

-(void)performAlert{
    UIAlertController* alert = [[UIAlertController alloc] init];
    [alert setTitle:@"Ошибка"];
    [alert setMessage:@"Не заполнено одно из необходимых полей."];
    UIAlertAction* alertAction = [UIAlertAction actionWithTitle:@"Ок" style:UIAlertActionStyleDefault handler:^(UIAlertAction * _Nonnull action){
        
    }];
    [alert addAction:alertAction];
    [self presentViewController:alert animated:YES completion:nil];
}

-(void) typeChanged:(id)sender{
    if([_typePickerControl selectedSegmentIndex] == 0){
        [[ActiveSession sharedInstance].search setOne_way:@"true"];
    } else {
        [[ActiveSession sharedInstance].search setOne_way:@"false"];
    }
}

-(void) selectOrigin:(id)sender{
    PlaceViewController* newController = [[PlaceViewController alloc] initSearchOfType:@"origin"];
    [self.navigationController pushViewController: newController animated:YES];
}

-(void) selectDestination:(id)sender{
    PlaceViewController* newController = [[PlaceViewController alloc] initSearchOfType:@"dest"];
    [self.navigationController pushViewController: newController animated:YES];
}

-(void) selectDate:(id)sender{
    NSString* type = [[NSString alloc] init];
    if((long)[_typePickerControl selectedSegmentIndex] == (long)0){
        type = @"oneway";
    } else {
        type = @"return";
    }
    
    DateViewController* newController = [[DateViewController alloc] initWithTripType: type];
    [self.navigationController pushViewController: newController animated:YES];
}



#pragma mark - Header


- (void)setUpHeader {
    if(!self.lableView){
        _lableView = [[UIView alloc] init];
        _lableView.translatesAutoresizingMaskIntoConstraints = NO;
    }
    if(!self.label){
        _label = [[UILabel alloc] init];
        _label.translatesAutoresizingMaskIntoConstraints = NO;
    }
    [_lableView setBackgroundColor:[UIColor whiteColor]];
    [[_lableView layer] setCornerRadius: 15.0];
    [_label setText:@"Поиск Авиабилетов"];
    [_label setFont:[UIFont fontWithName:@"Helvetica-Bold" size:30.0]];
    [_label setAdjustsFontSizeToFitWidth:YES];
    [_label setTextColor:_mainTheme];
    [_label setTextAlignment:NSTextAlignmentCenter];
    
    [self.view addSubview:_lableView];
    [self.view addSubview:_label];
    
    NSLayoutConstraint* viewTop = [NSLayoutConstraint
                                   constraintWithItem:_lableView
                                   attribute:NSLayoutAttributeTop
                                   relatedBy:NSLayoutRelationEqual
                                   toItem:self.view
                                   attribute:NSLayoutAttributeTop
                                   multiplier:1.0 constant:50.0];
    NSLayoutConstraint* viewLead = [NSLayoutConstraint
                                    constraintWithItem:_lableView
                                    attribute:NSLayoutAttributeLeading
                                    relatedBy:NSLayoutRelationEqual
                                    toItem:self.view
                                    attribute:NSLayoutAttributeLeading
                                    multiplier:1.0 constant:30.0];
    NSLayoutConstraint* viewTrail = [NSLayoutConstraint
                                     constraintWithItem:_lableView
                                     attribute:NSLayoutAttributeTrailing
                                     relatedBy:NSLayoutRelationEqual
                                     toItem:self.view
                                     attribute:NSLayoutAttributeTrailing
                                     multiplier:1.0 constant:-30.0];
    NSLayoutConstraint* viewHeight = [NSLayoutConstraint
                                      constraintWithItem:_lableView
                                      attribute:NSLayoutAttributeHeight
                                      relatedBy:NSLayoutRelationEqual
                                      toItem:nil
                                      attribute:NSLayoutAttributeNotAnAttribute
                                      multiplier:1.0 constant:60.0];
    [self.view addConstraints:@[viewTop, viewLead, viewTrail, viewHeight]];
     
     NSLayoutConstraint* labelTop = [NSLayoutConstraint constraintWithItem:_label attribute:NSLayoutAttributeTop relatedBy:NSLayoutRelationEqual toItem:_lableView attribute:NSLayoutAttributeTop multiplier:1.0 constant:5.0];
     NSLayoutConstraint* labelLead = [NSLayoutConstraint constraintWithItem:_label attribute:NSLayoutAttributeLeading relatedBy:NSLayoutRelationEqual toItem:_lableView attribute:NSLayoutAttributeLeading multiplier:1.0 constant:5.0];
    NSLayoutConstraint* labelTrail = [NSLayoutConstraint constraintWithItem:_label attribute:NSLayoutAttributeTrailing relatedBy:NSLayoutRelationEqual toItem:_lableView attribute:NSLayoutAttributeTrailing multiplier:1.0 constant:-5.0];
    NSLayoutConstraint* labelBottom = [NSLayoutConstraint constraintWithItem:_label attribute:NSLayoutAttributeBottom relatedBy:NSLayoutRelationEqual toItem:_lableView attribute:NSLayoutAttributeBottom multiplier:1.0 constant:-5.0];
    
    [self.view addConstraints:@[labelTop, labelLead, labelTrail, labelBottom]];
}

#pragma mark - Labels

- (void)setUpLabels{
    if (!self.fromLabel) {
        _fromLabel = [[UILabel alloc] init];
        _fromLabel.translatesAutoresizingMaskIntoConstraints = NO;
    }
    if (!self.toLabel) {
        _toLabel = [[UILabel alloc] init];
        _toLabel.translatesAutoresizingMaskIntoConstraints = NO;
    }
    [_fromLabel setText:@"Откуда"];
    [_toLabel setText:@"Куда"];
    
    [_fromLabel setTextAlignment:NSTextAlignmentCenter];
    [_toLabel setTextAlignment:NSTextAlignmentCenter];
    
    [_fromLabel setTextColor:_mainTheme];
    [_toLabel setTextColor:_mainTheme];
    
    [self.view addSubview:_fromLabel];
    [self.view addSubview:_toLabel];
    
    NSLayoutConstraint* fromTop = [NSLayoutConstraint
                                   constraintWithItem:_fromLabel
                                   attribute:NSLayoutAttributeTop
                                   relatedBy:NSLayoutRelationEqual
                                   toItem:_PlacesView
                                   attribute:NSLayoutAttributeTop
                                   multiplier:1.0
                                   constant:5.0];
    NSLayoutConstraint* fromLead = [NSLayoutConstraint
                                    constraintWithItem:_fromLabel
                                    attribute:NSLayoutAttributeLeading
                                    relatedBy:NSLayoutRelationEqual
                                    toItem:_PlacesView
                                    attribute:NSLayoutAttributeLeading
                                    multiplier:1.0
                                    constant:5.0];
    NSLayoutConstraint* fromTrail = [NSLayoutConstraint
                                     constraintWithItem:_fromLabel
                                     attribute:NSLayoutAttributeTrailing
                                     relatedBy:NSLayoutRelationEqual
                                     toItem:_PlacesView
                                     attribute:NSLayoutAttributeCenterX
                                     multiplier:1.0
                                     constant:-10.0];
    NSLayoutConstraint* fromHeight = [NSLayoutConstraint
                                      constraintWithItem:_fromLabel
                                      attribute:NSLayoutAttributeHeight
                                      relatedBy:NSLayoutRelationEqual
                                      toItem:nil
                                      attribute:NSLayoutAttributeNotAnAttribute
                                      multiplier:1.0
                                      constant:30.0];
    [self.view addConstraints:@[fromTop, fromLead, fromTrail, fromHeight]];
    
    NSLayoutConstraint* toTop = [NSLayoutConstraint
                                   constraintWithItem:_toLabel
                                   attribute:NSLayoutAttributeTop
                                   relatedBy:NSLayoutRelationEqual
                                   toItem:_PlacesView
                                   attribute:NSLayoutAttributeTop
                                   multiplier:1.0
                                   constant:5.0];
    NSLayoutConstraint* toLead = [NSLayoutConstraint
                                    constraintWithItem:_toLabel
                                    attribute:NSLayoutAttributeLeading
                                    relatedBy:NSLayoutRelationEqual
                                    toItem:_PlacesView
                                    attribute:NSLayoutAttributeCenterX
                                    multiplier:1.0
                                    constant:10.0];
    NSLayoutConstraint* toTrail = [NSLayoutConstraint
                                     constraintWithItem:_toLabel
                                     attribute:NSLayoutAttributeTrailing
                                     relatedBy:NSLayoutRelationEqual
                                     toItem:_PlacesView
                                     attribute:NSLayoutAttributeTrailing
                                     multiplier:1.0
                                     constant:-5.0];
    NSLayoutConstraint* toHeight = [NSLayoutConstraint
                                      constraintWithItem:_toLabel
                                      attribute:NSLayoutAttributeHeight
                                      relatedBy:NSLayoutRelationEqual
                                      toItem:nil
                                      attribute:NSLayoutAttributeNotAnAttribute
                                      multiplier:1.0
                                      constant:30.0];
    [self.view addConstraints:@[toTop, toLead, toTrail, toHeight]];
}

#pragma mark - Cities

- (void)setUpCities{
    if(!self.originCity){
        _originCity = [[UILabel alloc] init];
        _originCity.translatesAutoresizingMaskIntoConstraints = NO;
    }
    if(!self.destCity){
        _destCity = [[UILabel alloc] init];
        _destCity.translatesAutoresizingMaskIntoConstraints = NO;
    }
    [_originCity setTextColor:_mainTheme];
    [_destCity setTextColor:_mainTheme];
    
    [_originCity setTextAlignment:NSTextAlignmentCenter];
    [_destCity setTextAlignment:NSTextAlignmentCenter];
    
    if(![[ActiveSession sharedInstance].search.origin isEqualToString:@"notset"]){
        [_originCity setAlpha:1.0];
        NSString* orig = [[NSString alloc] init];
        orig = [NSString stringWithFormat:@"%@, %@", [ActiveSession sharedInstance].search.originCity, [ActiveSession sharedInstance].search.originCountry];
        [_originCity setText:orig];
    } else {
        [_originCity setAlpha: 0.0];
    }
    
    if(![[ActiveSession sharedInstance].search.destination isEqualToString:@"notset"]){
        [_destCity setAlpha:1.0];
        NSString* dest = [[NSString alloc] init];
        dest = [NSString stringWithFormat:@"%@, %@", [ActiveSession sharedInstance].search.destCity, [ActiveSession sharedInstance].search.destCountry];
        [_destCity setText:dest];
        
    } else {
        [_destCity setAlpha: 0.0];
    }
    
    [self.view addSubview:_originCity];
    [self.view addSubview:_destCity];
    
    NSLayoutConstraint* originTop = [NSLayoutConstraint constraintWithItem:_originCity attribute:NSLayoutAttributeTop relatedBy:NSLayoutRelationEqual toItem:_originSelect attribute:NSLayoutAttributeBottom multiplier:1.0 constant:5.0];
    NSLayoutConstraint* originLead = [NSLayoutConstraint constraintWithItem:_originCity attribute:NSLayoutAttributeLeading relatedBy:NSLayoutRelationEqual toItem:_PlacesView attribute:NSLayoutAttributeLeading multiplier:1.0 constant:5.0];
    NSLayoutConstraint* originTrail = [NSLayoutConstraint constraintWithItem:_originCity attribute:NSLayoutAttributeTrailing relatedBy:NSLayoutRelationEqual toItem:_PlacesView attribute:NSLayoutAttributeCenterX multiplier:1.0 constant:-10.0];
    NSLayoutConstraint* originBottom = [NSLayoutConstraint constraintWithItem:_originCity attribute:NSLayoutAttributeBottom relatedBy:NSLayoutRelationEqual toItem:_PlacesView attribute:NSLayoutAttributeBottom multiplier:1.0 constant:-5.0];
    [self.view addConstraints:@[originTop, originLead, originTrail, originBottom]];

    NSLayoutConstraint* destTop = [NSLayoutConstraint constraintWithItem:_destCity attribute:NSLayoutAttributeTop relatedBy:NSLayoutRelationEqual toItem:_destinationSelect attribute:NSLayoutAttributeBottom multiplier:1.0 constant:5.0];
    NSLayoutConstraint* destLead = [NSLayoutConstraint constraintWithItem:_destCity attribute:NSLayoutAttributeLeading relatedBy:NSLayoutRelationEqual toItem:_PlacesView attribute:NSLayoutAttributeCenterX multiplier:1.0 constant:10.0];
    NSLayoutConstraint* destTrail = [NSLayoutConstraint constraintWithItem:_destCity attribute:NSLayoutAttributeTrailing relatedBy:NSLayoutRelationEqual toItem:_PlacesView attribute:NSLayoutAttributeTrailing multiplier:1.0 constant:-5.0];
    NSLayoutConstraint* destBottom = [NSLayoutConstraint constraintWithItem:_destCity attribute:NSLayoutAttributeBottom relatedBy:NSLayoutRelationEqual toItem:_PlacesView attribute:NSLayoutAttributeBottom multiplier:1.0 constant:-5.0];
    [self.view addConstraints:@[destTop, destLead, destTrail, destBottom]];
}

#pragma mark - Icons

- (void)setUpIcons{
    if(!self.flight){
        _flight = [[UIImageView alloc] initWithImage:[UIImage imageNamed:@"plane.png"]];
        _flight.translatesAutoresizingMaskIntoConstraints = NO;
    }
    
    [self.view addSubview:_flight];
    
    NSLayoutConstraint* flightTop = [NSLayoutConstraint constraintWithItem:_flight attribute:NSLayoutAttributeTop relatedBy:NSLayoutRelationEqual toItem:_fromLabel attribute:NSLayoutAttributeBottom multiplier:1.0 constant:30.0];
    NSLayoutConstraint* flightBottom = [NSLayoutConstraint constraintWithItem:_flight attribute:NSLayoutAttributeBottom relatedBy:NSLayoutRelationEqual toItem:_originCity attribute:NSLayoutAttributeTop multiplier:1.0 constant:-30];
    NSLayoutConstraint* flightLead = [NSLayoutConstraint constraintWithItem:_flight attribute:NSLayoutAttributeLeading relatedBy:NSLayoutRelationEqual toItem:_originSelect attribute:NSLayoutAttributeTrailing multiplier:1.0 constant:30.0];
    NSLayoutConstraint* flightTrail = [NSLayoutConstraint constraintWithItem:_flight attribute:NSLayoutAttributeTrailing relatedBy:NSLayoutRelationEqual toItem:_destinationSelect attribute:NSLayoutAttributeLeading multiplier:1.0 constant:-30.0];
    [self.view addConstraints:@[flightTop, flightLead, flightTrail, flightBottom]];
}

#pragma mark - Selectors

- (void)setUpSelectors{
    if(!self.originSelect){
        _originSelect = [[UIButton alloc] init];
        _originSelect.translatesAutoresizingMaskIntoConstraints = NO;
    }
    if(!self.destinationSelect){
        _destinationSelect = [[UIButton alloc] init];
        _destinationSelect.translatesAutoresizingMaskIntoConstraints = NO;
    }
    
    [_originSelect addTarget:self action:@selector(selectOrigin:) forControlEvents:UIControlEventTouchUpInside];
    [_destinationSelect addTarget:self action:@selector(selectDestination:) forControlEvents:UIControlEventTouchUpInside];
    
    [[_originSelect titleLabel] setTextAlignment:NSTextAlignmentCenter];
    [[_destinationSelect titleLabel] setTextAlignment:NSTextAlignmentCenter];
    
    [_originSelect setTitleColor:[UIColor whiteColor] forState:UIControlStateNormal];
    [_destinationSelect setTitleColor:[UIColor whiteColor] forState:UIControlStateNormal];
    
    [[_originSelect layer] setCornerRadius:5.0];
    [[_destinationSelect layer] setCornerRadius:5.0];
    
    [_originSelect setBackgroundColor:_mainTheme];
    [_destinationSelect setBackgroundColor:_mainTheme];
    
    if(![[ActiveSession sharedInstance].search.origin isEqualToString:@"notset"]){
        [_originSelect setTitle:[ActiveSession sharedInstance].search.origin forState:UIControlStateNormal];
        [[_originSelect titleLabel] setFont:[UIFont fontWithName:@"Helvetica-Bold" size:30.0]];
    } else {
        [_originSelect setTitle:@"Выбрать" forState:UIControlStateNormal];
    }
    if(![[ActiveSession sharedInstance].search.destination isEqualToString:@"notset"]){
        [_destinationSelect setTitle:[ActiveSession sharedInstance].search.destination forState:UIControlStateNormal];
        [[_destinationSelect titleLabel] setFont:[UIFont fontWithName:@"Helvetica-Bold" size:30.0]];
    } else {
        [_destinationSelect setTitle:@"Выбрать" forState:UIControlStateNormal];
    }
    
    [self.view addSubview:_originSelect];
    [self.view addSubview:_destinationSelect];
    
    NSLayoutConstraint* originTop = [NSLayoutConstraint
                                     constraintWithItem:_originSelect
                                     attribute:NSLayoutAttributeTop
                                     relatedBy:NSLayoutRelationEqual
                                     toItem:_fromLabel
                                     attribute:NSLayoutAttributeBottom
                                     multiplier:1.0
                                     constant:5.0];
    NSLayoutConstraint* originLead = [NSLayoutConstraint
                                      constraintWithItem:_originSelect
                                      attribute:NSLayoutAttributeLeading
                                      relatedBy:NSLayoutRelationEqual
                                      toItem:_PlacesView
                                      attribute:NSLayoutAttributeLeading
                                      multiplier:1.0
                                      constant:40.0];
    NSLayoutConstraint* originTrail = [NSLayoutConstraint
                                       constraintWithItem:_originSelect
                                       attribute:NSLayoutAttributeTrailing
                                       relatedBy:NSLayoutRelationEqual
                                       toItem:_PlacesView
                                       attribute:NSLayoutAttributeCenterX
                                       multiplier:1.0
                                       constant:-40.0];
    NSLayoutConstraint* originHeight = [NSLayoutConstraint
                                        constraintWithItem:_originSelect
                                        attribute:NSLayoutAttributeHeight
                                        relatedBy:NSLayoutRelationEqual
                                        toItem:nil
                                        attribute:NSLayoutAttributeNotAnAttribute
                                        multiplier:1.0
                                        constant:70.0];
    [self.view addConstraints:@[originTop, originLead, originTrail, originHeight]];
    
    NSLayoutConstraint* destTop = [NSLayoutConstraint
                                   constraintWithItem:_destinationSelect
                                   attribute:NSLayoutAttributeTop
                                   relatedBy:NSLayoutRelationEqual
                                   toItem:_toLabel
                                   attribute:NSLayoutAttributeBottom
                                   multiplier:1.0
                                   constant:5.0];
    NSLayoutConstraint* destHeight = [NSLayoutConstraint
                                   constraintWithItem:_destinationSelect
                                   attribute:NSLayoutAttributeHeight
                                   relatedBy:NSLayoutRelationEqual
                                   toItem:nil
                                   attribute:NSLayoutAttributeNotAnAttribute
                                   multiplier:1.0
                                   constant:70.0];
    NSLayoutConstraint* destLead = [NSLayoutConstraint
                                      constraintWithItem:_destinationSelect
                                      attribute:NSLayoutAttributeLeading
                                      relatedBy:NSLayoutRelationEqual
                                      toItem:_PlacesView
                                      attribute:NSLayoutAttributeCenterX
                                      multiplier:1.0
                                      constant:40.0];
    NSLayoutConstraint* destTrail = [NSLayoutConstraint
                                       constraintWithItem:_destinationSelect
                                       attribute:NSLayoutAttributeTrailing
                                       relatedBy:NSLayoutRelationEqual
                                       toItem:_PlacesView
                                       attribute:NSLayoutAttributeTrailing
                                       multiplier:1.0
                                       constant:-40.0];
    [self.view addConstraints:@[destTop, destLead, destTrail, destHeight]];
    
}

#pragma mark - PlacesView

- (void)setUpPlacesView{
    if(!self.PlacesView){
        _PlacesView = [[UIView alloc] init];
        _PlacesView.translatesAutoresizingMaskIntoConstraints = NO;
    }
    _PlacesView.backgroundColor = [UIColor whiteColor];
    [[_PlacesView layer] setCornerRadius:15.0];
    [self.view addSubview:_PlacesView];
    
    NSLayoutConstraint* placeTop = [NSLayoutConstraint
                                    constraintWithItem:_PlacesView
                                    attribute:NSLayoutAttributeTop
                                    relatedBy:NSLayoutRelationEqual
                                    toItem:_lableView
                                    attribute:NSLayoutAttributeBottom
                                    multiplier:1.0
                                    constant:20.0];

    NSLayoutConstraint* placeHeight = [NSLayoutConstraint
                                       constraintWithItem:_PlacesView
                                       attribute:NSLayoutAttributeHeight
                                       relatedBy:NSLayoutRelationEqual
                                       toItem:nil
                                       attribute:NSLayoutAttributeNotAnAttribute
                                       multiplier:1.0
                                       constant:150.0];
    NSLayoutConstraint* placeLeading = [NSLayoutConstraint
                                        constraintWithItem:_PlacesView
                                        attribute:NSLayoutAttributeLeading
                                        relatedBy:NSLayoutRelationEqual
                                        toItem:self.view
                                        attribute:NSLayoutAttributeLeading
                                        multiplier:1.0
                                        constant:30.0];
    NSLayoutConstraint* placeTrailing = [NSLayoutConstraint
                                         constraintWithItem:_PlacesView
                                         attribute:NSLayoutAttributeTrailing
                                         relatedBy:NSLayoutRelationEqual
                                         toItem:self.view
                                         attribute:NSLayoutAttributeTrailing
                                         multiplier:1.0
                                         constant:-30.0];
    
    [self.view addConstraints:@[placeLeading, placeTrailing, placeTop, placeHeight]];
}

#pragma mark - PickerView

-(void)setUpPickerView{
    if(!self.PickerView){
        _PickerView = [[UIView alloc] init];
        _PickerView.translatesAutoresizingMaskIntoConstraints = NO;
    }
    [_PickerView setBackgroundColor:[UIColor whiteColor]];
    [[_PickerView layer] setCornerRadius:15.0];
    [self.view addSubview: _PickerView];
    
    NSLayoutConstraint* pickerTop = [NSLayoutConstraint
                                     constraintWithItem:_PickerView
                                     attribute:NSLayoutAttributeTop
                                     relatedBy:NSLayoutRelationEqual
                                     toItem:_PlacesView
                                     attribute:NSLayoutAttributeBottom
                                     multiplier:1.0
                                     constant:20.0];
    NSLayoutConstraint* pickerLead = [NSLayoutConstraint
                                      constraintWithItem:_PickerView
                                      attribute:NSLayoutAttributeLeading
                                      relatedBy:NSLayoutRelationEqual
                                      toItem:self.view
                                      attribute:NSLayoutAttributeLeading
                                      multiplier:1.0
                                      constant:30.0];
    NSLayoutConstraint* pickerTrail = [NSLayoutConstraint
                                       constraintWithItem:_PickerView
                                       attribute:NSLayoutAttributeTrailing
                                       relatedBy:NSLayoutRelationEqual
                                       toItem:self.view
                                       attribute:NSLayoutAttributeTrailing
                                       multiplier:1.0
                                       constant:-30.0];
    NSLayoutConstraint* pickerHeight = [NSLayoutConstraint
                                        constraintWithItem:_PickerView
                                        attribute:NSLayoutAttributeHeight
                                        relatedBy:NSLayoutRelationEqual
                                        toItem:nil
                                        attribute:NSLayoutAttributeNotAnAttribute
                                        multiplier:1.0
                                        constant:160.0];
    [self.view addConstraints:@[pickerTop, pickerLead, pickerTrail, pickerHeight]];
}

#pragma mark - Pickers

-(void)setUpPickers{
    if (!self.typePickerControl) {
        _typePickerControl = [[UISegmentedControl alloc] initWithItems: @[@"В одну сторону", @"Tуда - Обратно"]];
        _typePickerControl.translatesAutoresizingMaskIntoConstraints = NO;
    }
    if(!self.datePickerButton) {
        _datePickerButton = [[UIButton alloc] init];
        _datePickerButton.translatesAutoresizingMaskIntoConstraints = NO;
    }
    if([[ActiveSession sharedInstance].search.beginning_of_period isEqualToString:@"notset"]){
        [_datePickerButton setTitle:@"Выберите даты поездки" forState:UIControlStateNormal];
    } else {
        [_datePickerButton setTitle:[ActiveSession sharedInstance].search.beginning_of_period forState:UIControlStateNormal];
    }
    [_typePickerControl setSelectedSegmentTintColor:_mainTheme];
    
    if([[ActiveSession sharedInstance].search.one_way isEqualToString:@"false"]){
        [_typePickerControl setSelectedSegmentIndex:1];
    } else {
        [_typePickerControl setSelectedSegmentIndex:0];
    }
    
    [_typePickerControl addTarget:self action:@selector(typeChanged:) forControlEvents:UIControlEventValueChanged];
    
    [[_datePickerButton layer] setCornerRadius:5.0];
    [[_datePickerButton layer] setBorderWidth:2.0];
    [[_datePickerButton layer] setBorderColor:_mainTheme.CGColor];
    [_datePickerButton setTitleColor:_mainTheme forState:UIControlStateNormal];
    [_datePickerButton addTarget:self action:@selector(selectDate:) forControlEvents:UIControlEventTouchUpInside];
    
    [self.view addSubview:_typePickerControl];
    [self.view addSubview:_datePickerButton];
    
    NSLayoutConstraint* typeTop = [NSLayoutConstraint
                                   constraintWithItem:_typePickerControl
                                   attribute:NSLayoutAttributeTop
                                   relatedBy:NSLayoutRelationEqual
                                   toItem:_PickerView
                                   attribute:NSLayoutAttributeTop
                                   multiplier:1.0
                                   constant:20.0];
    NSLayoutConstraint* typeLead = [NSLayoutConstraint
                                    constraintWithItem:_typePickerControl
                                    attribute:NSLayoutAttributeLeading
                                    relatedBy:NSLayoutRelationEqual
                                    toItem:_PickerView
                                    attribute:NSLayoutAttributeLeading
                                    multiplier:1.0
                                    constant:20.0];
    NSLayoutConstraint* typeTrail = [NSLayoutConstraint
                                     constraintWithItem:_typePickerControl
                                     attribute:NSLayoutAttributeTrailing
                                     relatedBy:NSLayoutRelationEqual
                                     toItem:_PickerView
                                     attribute:NSLayoutAttributeTrailing
                                     multiplier:1.0
                                     constant:-20.0];
    NSLayoutConstraint* typeHeight = [NSLayoutConstraint
                                      constraintWithItem:_typePickerControl
                                      attribute:NSLayoutAttributeHeight
                                      relatedBy:NSLayoutRelationEqual
                                      toItem:nil
                                      attribute:NSLayoutAttributeNotAnAttribute
                                      multiplier:1.0
                                      constant:50.0];
    [self.view addConstraints:@[typeTop, typeLead, typeTrail, typeHeight]];
    
    NSLayoutConstraint* dateTop = [NSLayoutConstraint
                                   constraintWithItem:_datePickerButton
                                   attribute:NSLayoutAttributeTop
                                   relatedBy:NSLayoutRelationEqual
                                   toItem:_typePickerControl
                                   attribute:NSLayoutAttributeBottom
                                   multiplier:1.0
                                   constant:20.0];
    NSLayoutConstraint* dateLead = [NSLayoutConstraint
                                       constraintWithItem:_datePickerButton
                                       attribute:NSLayoutAttributeLeading
                                       relatedBy:NSLayoutRelationEqual
                                       toItem:_PickerView
                                       attribute:NSLayoutAttributeLeading
                                       multiplier:1.0
                                       constant:20.0];
    NSLayoutConstraint* dateTrail = [NSLayoutConstraint
                                        constraintWithItem:_datePickerButton
                                        attribute:NSLayoutAttributeTrailing
                                        relatedBy:NSLayoutRelationEqual
                                        toItem:_PickerView
                                        attribute:NSLayoutAttributeTrailing
                                        multiplier:1.0
                                        constant:-20.0];
    NSLayoutConstraint* dateBottom = [NSLayoutConstraint
                                      constraintWithItem:_datePickerButton
                                      attribute:NSLayoutAttributeBottom
                                      relatedBy:NSLayoutRelationEqual
                                      toItem:_PickerView
                                      attribute:NSLayoutAttributeBottom
                                      multiplier:1.0
                                      constant:-20.0];
    
    [self.view addConstraints:@[dateTop, dateLead, dateTrail, dateBottom]];
    
}

#pragma mark - Button

-(void) setUpButton{
    if(!self.searchButton){
        _searchButton = [[UIButton alloc] init];
        _searchButton.translatesAutoresizingMaskIntoConstraints = NO;
    }
    [_searchButton setTitle:@"Найти" forState:UIControlStateNormal];
    [[_searchButton layer] setCornerRadius:15.0];
    [_searchButton setTitleColor:_mainTheme forState:UIControlStateNormal];
    [_searchButton setBackgroundColor:[UIColor whiteColor]];
    [_searchButton addTarget:self action:@selector(StartSearching:) forControlEvents:UIControlEventTouchUpInside];
    
    [self.view addSubview:_searchButton];
    
    NSLayoutConstraint* buttonLead = [NSLayoutConstraint
                                      constraintWithItem:_searchButton
                                      attribute:NSLayoutAttributeLeading
                                      relatedBy:NSLayoutRelationEqual
                                      toItem:self.view
                                      attribute:NSLayoutAttributeLeading
                                      multiplier:1.0
                                      constant:30.0];
    NSLayoutConstraint* buttonTrail = [NSLayoutConstraint
                                       constraintWithItem:_searchButton
                                       attribute:NSLayoutAttributeTrailing
                                       relatedBy:NSLayoutRelationEqual
                                       toItem:self.view
                                       attribute:NSLayoutAttributeTrailing
                                       multiplier:1.0
                                       constant:-30.0];
    NSLayoutConstraint* buttonBottom = [NSLayoutConstraint
                                        constraintWithItem:_searchButton
                                        attribute:NSLayoutAttributeBottom
                                        relatedBy:NSLayoutRelationEqual
                                        toItem:self.view
                                        attribute:NSLayoutAttributeBottom
                                        multiplier:1.0
                                        constant:-30.0];
    NSLayoutConstraint* buttonHeight = [NSLayoutConstraint
                                        constraintWithItem:_searchButton
                                        attribute:NSLayoutAttributeHeight
                                        relatedBy:NSLayoutRelationEqual
                                        toItem:nil
                                        attribute:NSLayoutAttributeNotAnAttribute
                                        multiplier:1.0
                                        constant:60.0];
    
    [self.view addConstraints:@[buttonLead, buttonTrail, buttonBottom, buttonHeight]];
}

@end

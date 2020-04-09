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
@property (nonatomic, strong) UILabel* fromLabel;
@property (nonatomic, strong) UILabel* toLabel;

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
    [self setUpPlacesView];
    [self setUpSelectors];
    [self setUpLabels];
}

- (void)viewDidLoad {
    [super viewDidLoad];
    
}

-(void) selectOrigin:(id)sender{
    PlaceViewController* newController = [[PlaceViewController alloc] initSearchOfType:@"origin"];
    [self.navigationController pushViewController: newController animated:YES];
}

-(void) selectDestination:(id)sender{
    PlaceViewController* newController = [[PlaceViewController alloc] initSearchOfType:@"dest"];
    [self.navigationController pushViewController: newController animated:YES];
}



#pragma mark - SearchController - UI SetUp func's

- (void)setUpLabels{
    if (!self.fromLabel) {
        _fromLabel = [[UILabel alloc] init];
        _fromLabel.translatesAutoresizingMaskIntoConstraints = NO;
    }
    if (!self.toLabel) {
        _toLabel = [[UILabel alloc] init];
        _toLabel.translatesAutoresizingMaskIntoConstraints = NO;
    }
    [_fromLabel setText:@"Откуда:"];
    [_toLabel setText:@"Куда:"];
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
                                      constant:70.0];
    [self.view addConstraints:@[fromTop, fromLead, fromTrail, fromHeight]];
    
    NSLayoutConstraint* toTop = [NSLayoutConstraint
                                   constraintWithItem:_toLabel
                                   attribute:NSLayoutAttributeTop
                                   relatedBy:NSLayoutRelationEqual
                                   toItem:_fromLabel
                                   attribute:NSLayoutAttributeBottom
                                   multiplier:1.0
                                   constant:5.0];
    NSLayoutConstraint* toLead = [NSLayoutConstraint
                                    constraintWithItem:_toLabel
                                    attribute:NSLayoutAttributeLeading
                                    relatedBy:NSLayoutRelationEqual
                                    toItem:_PlacesView
                                    attribute:NSLayoutAttributeLeading
                                    multiplier:1.0
                                    constant:5.0];
    NSLayoutConstraint* toTrail = [NSLayoutConstraint
                                     constraintWithItem:_toLabel
                                     attribute:NSLayoutAttributeTrailing
                                     relatedBy:NSLayoutRelationEqual
                                     toItem:_PlacesView
                                     attribute:NSLayoutAttributeCenterX
                                     multiplier:1.0
                                     constant:-10.0];
    NSLayoutConstraint* toBottom = [NSLayoutConstraint
                                      constraintWithItem:_toLabel
                                      attribute:NSLayoutAttributeBottom
                                      relatedBy:NSLayoutRelationEqual
                                      toItem:_PlacesView
                                      attribute:NSLayoutAttributeBottom                                      multiplier:1.0
                                      constant:-5.0];
    [self.view addConstraints:@[toTop, toLead, toTrail, toBottom]];
}

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
    [_originSelect setTitleColor:_mainTheme forState:UIControlStateNormal];
    if(![[ActiveSession sharedInstance].search.origin isEqualToString:@"notset"]){
        [_originSelect setTitle:[ActiveSession sharedInstance].search.origin forState:UIControlStateNormal];
    } else {
        [_originSelect setTitle:@"Выбрать" forState:UIControlStateNormal];
    }
    
    [_destinationSelect addTarget:self action:@selector(selectDestination:) forControlEvents:UIControlEventTouchUpInside];
    [_destinationSelect setTitleColor:_mainTheme forState:UIControlStateNormal];
    if(![[ActiveSession sharedInstance].search.destination isEqualToString:@"notset"]){
        [_destinationSelect setTitle:[ActiveSession sharedInstance].search.destination forState:UIControlStateNormal];
    } else {
        [_destinationSelect setTitle:@"Выбрать" forState:UIControlStateNormal];
    }
    
    [self.view addSubview:_originSelect];
    [self.view addSubview:_destinationSelect];
    
    NSLayoutConstraint* originTop = [NSLayoutConstraint
                                     constraintWithItem:_originSelect
                                     attribute:NSLayoutAttributeTop
                                     relatedBy:NSLayoutRelationEqual
                                     toItem:_PlacesView
                                     attribute:NSLayoutAttributeTop
                                     multiplier:1.0
                                     constant:5.0];
    NSLayoutConstraint* originLead = [NSLayoutConstraint
                                      constraintWithItem:_originSelect
                                      attribute:NSLayoutAttributeLeading
                                      relatedBy:NSLayoutRelationEqual
                                      toItem:_PlacesView
                                      attribute:NSLayoutAttributeCenterX
                                      multiplier:1.0
                                      constant:10.0];
    NSLayoutConstraint* originTrail = [NSLayoutConstraint
                                       constraintWithItem:_originSelect
                                       attribute:NSLayoutAttributeTrailing
                                       relatedBy:NSLayoutRelationEqual
                                       toItem:_PlacesView
                                       attribute:NSLayoutAttributeTrailing
                                       multiplier:1.0
                                       constant:-5.0];
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
                                   toItem:_originSelect
                                   attribute:NSLayoutAttributeBottom
                                   multiplier:1.0
                                   constant:5.0];
    NSLayoutConstraint* destBottom = [NSLayoutConstraint
                                   constraintWithItem:_destinationSelect
                                   attribute:NSLayoutAttributeBottom
                                   relatedBy:NSLayoutRelationEqual
                                   toItem:_PlacesView
                                   attribute:NSLayoutAttributeBottom
                                   multiplier:1.0
                                   constant:-5.0];
    NSLayoutConstraint* destLead = [NSLayoutConstraint
                                      constraintWithItem:_destinationSelect
                                      attribute:NSLayoutAttributeLeading
                                      relatedBy:NSLayoutRelationEqual
                                      toItem:_PlacesView
                                      attribute:NSLayoutAttributeCenterX
                                      multiplier:1.0
                                      constant:10.0];
    NSLayoutConstraint* destTrail = [NSLayoutConstraint
                                       constraintWithItem:_destinationSelect
                                       attribute:NSLayoutAttributeTrailing
                                       relatedBy:NSLayoutRelationEqual
                                       toItem:_PlacesView
                                       attribute:NSLayoutAttributeTrailing
                                       multiplier:1.0
                                       constant:-5.0];
    [self.view addConstraints:@[destTop, destLead, destTrail, destBottom]];
    
}

- (void)setUpPlacesView{
    if(!self.PlacesView){
        _PlacesView = [[UIView alloc] init];
    }
    _PlacesView.translatesAutoresizingMaskIntoConstraints = NO;
    _PlacesView.backgroundColor = [UIColor whiteColor];
    _PlacesView.layer.cornerRadius = 15.0;
    [self.view addSubview:_PlacesView];
    
    NSLayoutConstraint* placeTop = [NSLayoutConstraint
                                    constraintWithItem:_PlacesView
                                    attribute:NSLayoutAttributeTop
                                    relatedBy:NSLayoutRelationEqual
                                    toItem:self.view
                                    attribute:NSLayoutAttributeTop
                                    multiplier:1.0
                                    constant:50.0];

    NSLayoutConstraint* placeHeight = [NSLayoutConstraint
                                       constraintWithItem:_PlacesView
                                       attribute:NSLayoutAttributeHeight
                                       relatedBy:NSLayoutRelationEqual
                                       toItem:nil
                                       attribute:NSLayoutAttributeNotAnAttribute
                                       multiplier:1.0
                                       constant:155.0];
    NSLayoutConstraint* placeLeading = [NSLayoutConstraint
                                        constraintWithItem:_PlacesView
                                        attribute:NSLayoutAttributeLeading
                                        relatedBy:NSLayoutRelationEqual
                                        toItem:self.view
                                        attribute:NSLayoutAttributeLeading
                                        multiplier:1.0
                                        constant:50.0];
    NSLayoutConstraint* placeTrailing = [NSLayoutConstraint
                                         constraintWithItem:_PlacesView
                                         attribute:NSLayoutAttributeTrailing
                                         relatedBy:NSLayoutRelationEqual
                                         toItem:self.view
                                         attribute:NSLayoutAttributeTrailing
                                         multiplier:1.0
                                         constant:-50.0];
    
    [self.view addConstraints:@[placeLeading, placeTrailing, placeTop, placeHeight]];
}

@end

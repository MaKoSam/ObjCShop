//
//  DateViewController.m
//  TripPlaner
//
//  Created by Sam Mazniker on 10/04/2020.
//  Copyright © 2020 Sam Mazniker. All rights reserved.
//

#import "DateViewController.h"

@interface DateViewController ()

@property (nonatomic, strong) UIColor* mainTheme;

@end

@implementation DateViewController

- (instancetype) initWithTripType:(NSString*)type{
    self = [super init];
    _mainTheme = [[UIColor alloc] initWithRed:0.15 green:0.09 blue:0.14 alpha:1.0];
    if(self){
        _PickerType = [[NSString alloc] initWithString:type];
        _dateDeparturePicker = [[UIDatePicker alloc] init];
        _dateReturnPicker = [[UIDatePicker alloc] init];
        [_dateDeparturePicker setMinimumDate:[NSDate date]];
        [_dateReturnPicker setMinimumDate:[_dateDeparturePicker date]];
        [_dateDeparturePicker setDatePickerMode:UIDatePickerModeDate];
        [_dateReturnPicker setDatePickerMode:UIDatePickerModeDate];
    }
    return self;
}

    - (void) viewWillAppear:(BOOL)animated{
        [super viewWillAppear:animated];
        [self.view setBackgroundColor: _mainTheme];
        
        [self setUpView];
}


- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    [_dateDeparturePicker addTarget:self action:@selector(doneDepartureAction:) forControlEvents:UIControlEventValueChanged];
    [_dateReturnPicker addTarget:self action:@selector(doneReturnAction:) forControlEvents:UIControlEventValueChanged];
    
    UITapGestureRecognizer* tapGest = [[UITapGestureRecognizer alloc] initWithTarget:self action:@selector(doneEditingTap:)];
    [self.view addGestureRecognizer:tapGest];
}

-(void)ApplyChanges:(id)sender{
    [self.navigationController popViewControllerAnimated:YES];
}

-(void)doneEditingTap:(id)sender{
    [_Departure endEditing:YES];
    [_Return endEditing:YES];
}

-(void)doneDepartureAction:(id)sender{
    [_Departure setText:[self dateDepartureFormatter]];
    [[ActiveSession sharedInstance].search setBeginning_of_period:[self dateDepartureFormatter]];
    [[ActiveSession sharedInstance].search setBeginPeriod:[self dateForRequest]];
}
-(NSString*)dateForRequest{
    NSDateFormatter* formatter = [[NSDateFormatter alloc] init];
    [formatter setDateFormat:@"yyyy-MM"];
    return [[NSString alloc] initWithString: [formatter stringFromDate:_dateDeparturePicker.date]];
}

-(void)doneReturnAction:(id)sender{
    [_Return setText:[self dateReturnFormatter]];
    NSTimeInterval intervalEnd = [_dateReturnPicker.date timeIntervalSince1970];
    NSTimeInterval intervalStart = [_dateDeparturePicker.date timeIntervalSince1970];
    float days = (intervalEnd - intervalStart) / 60 / 60 / 24 / 7;
    int weeks = days / 7 + 1;
    if(weeks > 4 || weeks < 0){
        weeks = 1;
    }
    NSString* duration = [[NSString alloc] initWithFormat:@"%d", weeks];
    [[ActiveSession sharedInstance].search setTrip_duration:duration];
}

-(NSString*)dateDepartureFormatter{
    NSDateFormatter* formatter = [[NSDateFormatter alloc] init];
    [formatter setDateFormat:@"yyyy-MM-dd"];
    return [[NSString alloc] initWithString: [formatter stringFromDate:_dateDeparturePicker.date]];
}

-(NSString*)dateReturnFormatter{
    NSDateFormatter* formatter = [[NSDateFormatter alloc] init];
    [formatter setDateFormat:@"yyyy-MM-dd"];
    return [[NSString alloc] initWithString: [formatter stringFromDate:_dateReturnPicker.date]];
}

- (void)setUpView {
    if(!self.DepartureView){
        _DepartureView = [[UIView alloc] init];
        _DepartureView.translatesAutoresizingMaskIntoConstraints = NO;
    }
    [_DepartureView setBackgroundColor:[UIColor whiteColor]];
    [[_DepartureView layer] setCornerRadius: 15.0];
    [self.view addSubview:_DepartureView];
    
    NSLayoutConstraint* depViewTop = [NSLayoutConstraint
                                      constraintWithItem:_DepartureView
                                      attribute:NSLayoutAttributeTop
                                      relatedBy:NSLayoutRelationEqual
                                      toItem:self.view
                                      attribute:NSLayoutAttributeTop
                                      multiplier:1.0
                                      constant:50.0];
    NSLayoutConstraint* depViewLead = [NSLayoutConstraint
                                       constraintWithItem:_DepartureView
                                       attribute:NSLayoutAttributeLeading
                                       relatedBy:NSLayoutRelationEqual
                                       toItem:self.view
                                       attribute:NSLayoutAttributeLeading
                                       multiplier:1.0
                                       constant:30.0];
    NSLayoutConstraint* depViewTrail = [NSLayoutConstraint
                                        constraintWithItem:_DepartureView
                                        attribute:NSLayoutAttributeTrailing
                                        relatedBy:NSLayoutRelationEqual
                                        toItem:self.view
                                        attribute:NSLayoutAttributeTrailing
                                        multiplier:1.0
                                        constant:-30.0];
    NSLayoutConstraint* depViewHeight = [NSLayoutConstraint
                                         constraintWithItem:_DepartureView
                                         attribute:NSLayoutAttributeHeight
                                         relatedBy:NSLayoutRelationEqual
                                         toItem:nil
                                         attribute:NSLayoutAttributeNotAnAttribute
                                         multiplier:1.0
                                         constant:130.0];
        
    [self.view addConstraints:@[depViewTop, depViewLead, depViewTrail, depViewHeight]];
        
    if(!self.DepartureLabel){
        _DepartureLabel = [[UILabel alloc] init];
        _DepartureLabel.translatesAutoresizingMaskIntoConstraints = NO;
    }
    [_DepartureLabel setText:@"Туда"];
    [_DepartureLabel setTextAlignment:NSTextAlignmentCenter];
    [_DepartureLabel setFont:[UIFont fontWithName:@"Helvetica-Bold" size:20.0]];
    [_DepartureLabel setTextColor:_mainTheme];
    
    [self.view addSubview:_DepartureLabel];
    
    NSLayoutConstraint* depLabTop = [NSLayoutConstraint
                                     constraintWithItem:_DepartureLabel
                                     attribute:NSLayoutAttributeTop
                                     relatedBy:NSLayoutRelationEqual
                                     toItem:_DepartureView
                                     attribute:NSLayoutAttributeTop
                                     multiplier:1.0
                                     constant:10.0];
    NSLayoutConstraint* depLabLead = [NSLayoutConstraint
                                      constraintWithItem:_DepartureLabel
                                      attribute:NSLayoutAttributeLeading
                                      relatedBy:NSLayoutRelationEqual
                                      toItem:_DepartureView
                                      attribute:NSLayoutAttributeLeading
                                      multiplier:1.0
                                      constant:10.0];
    NSLayoutConstraint* depLabTrail = [NSLayoutConstraint
                                       constraintWithItem:_DepartureLabel
                                       attribute:NSLayoutAttributeTrailing
                                       relatedBy:NSLayoutRelationEqual
                                       toItem:_DepartureView
                                       attribute:NSLayoutAttributeTrailing
                                       multiplier:1.0
                                       constant:-10.0];
    NSLayoutConstraint* depLabHeight = [NSLayoutConstraint
                                        constraintWithItem:_DepartureLabel
                                        attribute:NSLayoutAttributeHeight
                                        relatedBy:NSLayoutRelationEqual
                                        toItem:nil
                                        attribute:NSLayoutAttributeNotAnAttribute
                                        multiplier:1.0
                                        constant:50.0];
        
    [self.view addConstraints:@[depLabTop, depLabLead, depLabTrail, depLabHeight]];
        
    if(!self.Departure){
        _Departure = [[UITextField alloc] init];
        _Departure.translatesAutoresizingMaskIntoConstraints = NO;
    }
    
    
        
    [_Departure setText:@"Выбрать Дату..."];
    [_Departure setTextAlignment:NSTextAlignmentCenter];
    [_Departure setInputView:_dateDeparturePicker];
    [_Departure setTextColor: _mainTheme];
    [[_Departure layer] setCornerRadius:5.0];
    [[_Departure layer] setBorderWidth:2.0];
    [[_Departure layer] setBorderColor:_mainTheme.CGColor];
    
    [self.view addSubview:_Departure];
    
    NSLayoutConstraint* depTop = [NSLayoutConstraint
                                  constraintWithItem:_Departure
                                  attribute:NSLayoutAttributeTop
                                  relatedBy:NSLayoutRelationEqual
                                  toItem:_DepartureLabel
                                  attribute:NSLayoutAttributeBottom
                                  multiplier:1.0
                                  constant:10.0];
    NSLayoutConstraint* depLead = [NSLayoutConstraint
                                   constraintWithItem:_Departure
                                   attribute:NSLayoutAttributeLeading
                                   relatedBy:NSLayoutRelationEqual
                                   toItem:_DepartureView
                                   attribute:NSLayoutAttributeLeading
                                   multiplier:1.0
                                   constant:10.0];
    NSLayoutConstraint* depTrail = [NSLayoutConstraint
                                    constraintWithItem:_Departure
                                    attribute:NSLayoutAttributeTrailing
                                    relatedBy:NSLayoutRelationEqual
                                    toItem:_DepartureView
                                    attribute:NSLayoutAttributeTrailing
                                    multiplier:1.0
                                    constant:-10.0];
    NSLayoutConstraint* depBottom = [NSLayoutConstraint
                                     constraintWithItem:_Departure
                                     attribute:NSLayoutAttributeBottom
                                     relatedBy:NSLayoutRelationEqual
                                     toItem:_DepartureView
                                     attribute:NSLayoutAttributeBottom
                                     multiplier:1.0
                                     constant:-10.0];
        
    [self.view addConstraints:@[depTop, depLead, depTrail, depBottom]];
    
    if([_PickerType isEqualToString:@"return"]){
        
        if(!self.ReturnView){
            _ReturnView = [[UIView alloc] init];
            _ReturnView.translatesAutoresizingMaskIntoConstraints = NO;
        }
        
        [_ReturnView setBackgroundColor: [UIColor whiteColor] ];
        [[_ReturnView layer] setCornerRadius: 15.0];
        
        [self.view addSubview:_ReturnView];
        
        NSLayoutConstraint* returnViewTop = [NSLayoutConstraint
                                             constraintWithItem:_ReturnView
                                             attribute:NSLayoutAttributeTop
                                             relatedBy:NSLayoutRelationEqual
                                             toItem:_DepartureView
                                             attribute:NSLayoutAttributeBottom
                                             multiplier:1.0
                                             constant:50.0];
        NSLayoutConstraint* returnViewLead = [NSLayoutConstraint
                                              constraintWithItem:_ReturnView
                                              attribute:NSLayoutAttributeLeading
                                              relatedBy:NSLayoutRelationEqual
                                              toItem:self.view
                                              attribute:NSLayoutAttributeLeading
                                              multiplier:1.0
                                              constant:30.0];
        NSLayoutConstraint* returnViewTrail = [NSLayoutConstraint
                                               constraintWithItem:_ReturnView
                                               attribute:NSLayoutAttributeTrailing
                                               relatedBy:NSLayoutRelationEqual
                                               toItem:self.view
                                               attribute:NSLayoutAttributeTrailing
                                               multiplier:1.0
                                               constant:-30.0];
        NSLayoutConstraint* returnViewHeight = [NSLayoutConstraint
                                                constraintWithItem:_ReturnView
                                                attribute:NSLayoutAttributeHeight
                                                relatedBy:NSLayoutRelationEqual
                                                toItem:nil
                                                attribute:NSLayoutAttributeNotAnAttribute
                                                multiplier:1.0
                                                constant:130.0];
        
        [self.view addConstraints:@[returnViewTop, returnViewLead, returnViewTrail, returnViewHeight]];
        
        if(!self.ReturnLabel){
            _ReturnLabel = [[UILabel alloc] init];
            _ReturnLabel.translatesAutoresizingMaskIntoConstraints = NO;
        }
        [_ReturnLabel setText:@"Обратно"];
        [_ReturnLabel setFont:[UIFont fontWithName:@"Helvetica-Bold" size:20.0]];
        [_ReturnLabel setTextColor:_mainTheme];
        [_ReturnLabel setTextAlignment:NSTextAlignmentCenter];
            
        [self.view addSubview:_ReturnLabel];
            
        NSLayoutConstraint* retLabTop = [NSLayoutConstraint
                                         constraintWithItem:_ReturnLabel
                                         attribute:NSLayoutAttributeTop
                                         relatedBy:NSLayoutRelationEqual
                                         toItem:_ReturnView
                                         attribute:NSLayoutAttributeTop
                                         multiplier:1.0
                                         constant:10.0];
        NSLayoutConstraint* retLabLead = [NSLayoutConstraint
                                          constraintWithItem:_ReturnLabel
                                          attribute:NSLayoutAttributeLeading
                                          relatedBy:NSLayoutRelationEqual
                                          toItem:_ReturnView
                                          attribute:NSLayoutAttributeLeading
                                          multiplier:1.0
                                          constant:10.0];
        NSLayoutConstraint* retLabTrail = [NSLayoutConstraint
                                           constraintWithItem:_ReturnLabel
                                           attribute:NSLayoutAttributeTrailing
                                           relatedBy:NSLayoutRelationEqual
                                           toItem:_ReturnView
                                           attribute:NSLayoutAttributeTrailing
                                           multiplier:1.0
                                           constant:-10.0];
        NSLayoutConstraint* retLabHeight = [NSLayoutConstraint
                                            constraintWithItem:_ReturnLabel
                                            attribute:NSLayoutAttributeHeight
                                            relatedBy:NSLayoutRelationEqual
                                            toItem:nil
                                            attribute:NSLayoutAttributeNotAnAttribute
                                            multiplier:1.0
                                            constant:50.0];
            
        [self.view addConstraints:@[retLabTop, retLabLead, retLabTrail, retLabHeight]];
            
        if(!self.Return){
            _Return = [[UITextField alloc] init];
            _Return.translatesAutoresizingMaskIntoConstraints = NO;
        }
        
        [_Return setText:@"Выбрать Дату..."];
        [_Return setInputView:_dateReturnPicker];
        [_Return setTextColor: _mainTheme];
        [_Return setTextAlignment:NSTextAlignmentCenter];
        [[_Return layer] setCornerRadius:5.0];
        [[_Return layer] setBorderWidth:2.0];
        [[_Return layer] setBorderColor:_mainTheme.CGColor];
            
        [self.view addSubview:_Return];
            
        NSLayoutConstraint* retTop = [NSLayoutConstraint
                                      constraintWithItem:_Return
                                      attribute:NSLayoutAttributeTop
                                      relatedBy:NSLayoutRelationEqual
                                      toItem:_ReturnLabel
                                      attribute:NSLayoutAttributeBottom
                                      multiplier:1.0
                                      constant:10.0];
        NSLayoutConstraint* retLead = [NSLayoutConstraint
                                       constraintWithItem:_Return
                                       attribute:NSLayoutAttributeLeading
                                       relatedBy:NSLayoutRelationEqual
                                       toItem:_ReturnView
                                       attribute:NSLayoutAttributeLeading
                                       multiplier:1.0
                                       constant:10.0];
        NSLayoutConstraint* retTrail = [NSLayoutConstraint
                                        constraintWithItem:_Return
                                        attribute:NSLayoutAttributeTrailing
                                        relatedBy:NSLayoutRelationEqual
                                        toItem:_ReturnView
                                        attribute:NSLayoutAttributeTrailing
                                        multiplier:1.0
                                        constant:-10.0];
        NSLayoutConstraint* retBottom = [NSLayoutConstraint
                                         constraintWithItem:_Return
                                         attribute:NSLayoutAttributeBottom
                                         relatedBy:NSLayoutRelationEqual
                                         toItem:_ReturnView
                                         attribute:NSLayoutAttributeBottom
                                         multiplier:1.0
                                         constant:-10.0];
            
        [self.view addConstraints:@[retTop, retLead, retTrail, retBottom]];
    }
    
    if(!self.Apply){
        _Apply = [[UIButton alloc] init];
        _Apply.translatesAutoresizingMaskIntoConstraints = NO;
    }
    
    [_Apply setBackgroundColor: [UIColor whiteColor]];
    [_Apply setTitle:@"Установить" forState:UIControlStateNormal];
    [[_Apply layer] setCornerRadius:15.0];
    [_Apply setTitleColor:_mainTheme forState:UIControlStateNormal];
    [_Apply addTarget:self action:@selector(ApplyChanges:) forControlEvents:UIControlEventTouchUpInside];
    [self.view addSubview:_Apply];
    
    NSLayoutConstraint* applyTop = [NSLayoutConstraint
                                    constraintWithItem:_Apply
                                    attribute:NSLayoutAttributeTop
                                    relatedBy:NSLayoutRelationEqual
                                    toItem:self.view
                                    attribute:NSLayoutAttributeCenterY
                                    multiplier:1.0
                                    constant:50.0];
    NSLayoutConstraint* applyLead = [NSLayoutConstraint
                                          constraintWithItem:_Apply
                                          attribute:NSLayoutAttributeLeading
                                          relatedBy:NSLayoutRelationEqual
                                          toItem:self.view
                                          attribute:NSLayoutAttributeLeading
                                          multiplier:1.0
                                          constant:30.0];
    NSLayoutConstraint* applyTrail = [NSLayoutConstraint
                                           constraintWithItem:_Apply
                                           attribute:NSLayoutAttributeTrailing
                                           relatedBy:NSLayoutRelationEqual
                                           toItem:self.view
                                           attribute:NSLayoutAttributeTrailing
                                           multiplier:1.0
                                           constant:-30.0];
    NSLayoutConstraint * applyHeight = [NSLayoutConstraint
                                        constraintWithItem:_Apply
                                        attribute:NSLayoutAttributeHeight
                                        relatedBy:NSLayoutRelationEqual
                                        toItem:nil
                                        attribute:NSLayoutAttributeNotAnAttribute
                                        multiplier:1.0
                                        constant:60.0];
    [self.view addConstraints:@[applyTop, applyLead, applyTrail, applyHeight]];
}

/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

@end

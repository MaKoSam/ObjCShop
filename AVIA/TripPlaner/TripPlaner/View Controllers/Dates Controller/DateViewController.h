//
//  DateViewController.h
//  TripPlaner
//
//  Created by Sam Mazniker on 10/04/2020.
//  Copyright © 2020 Sam Mazniker. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "ActiveSession.h"

NS_ASSUME_NONNULL_BEGIN

@interface DateViewController : UIViewController

//Picker Type
//0 - One Way
//1 - Return
@property (nonatomic, strong) NSString* PickerType;
@property (nonatomic, strong) UIDatePicker* dateDeparturePicker;
@property (nonatomic, strong) UIDatePicker* dateReturnPicker;

@property (nonatomic, strong) UIView* DepartureView;
@property (nonatomic, strong) UIView* ReturnView;

@property (nonatomic, strong) UILabel* DepartureLabel;
@property (nonatomic, strong) UILabel* ReturnLabel;

@property (nonatomic, strong) UITextField* Departure;
@property (nonatomic, strong) UITextField* Return;

@property (nonatomic, strong) UIButton* Apply;

-(instancetype) initWithTripType:(NSString*) type;

@end

NS_ASSUME_NONNULL_END

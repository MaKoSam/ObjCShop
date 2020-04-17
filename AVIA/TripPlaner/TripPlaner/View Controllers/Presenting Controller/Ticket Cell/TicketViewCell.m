//
//  TicketViewCell.m
//  TripPlaner
//
//  Created by Sam Mazniker on 14/04/2020.
//  Copyright © 2020 Sam Mazniker. All rights reserved.
//

#import "TicketViewCell.h"

@implementation TicketViewCell

- (void)awakeFromNib {
    [super awakeFromNib];
}

-(instancetype)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier{
    self = [super initWithStyle:style reuseIdentifier:reuseIdentifier];
    if(self){
        if(!self.mainTheme){
            _mainTheme = [[UIColor alloc] initWithRed:0.15 green:0.09 blue:0.14 alpha:1.0];
        }
        [self.contentView setBackgroundColor:_mainTheme];
        [self setUpView];
        [self setUpHeader];
        [self setUpContex];
    }
    return self;
}

- (void)setSelected:(BOOL)selected animated:(BOOL)animated {
    [super setSelected:selected animated:animated];

    // Configure the view for the selected state
}

-(void)updateForFlight:(Flight *)superFlight{
    if(!self.flight){
        _flight = [[Flight alloc] init];
        _flight = superFlight;
    }
    
    [_origin setText:[_flight origin]];
    [_dest setText:[_flight destination]];
    [_flightDepDate setText:[_flight depart_date]];
    
    if([_flight.returnDate isEqual:[NSNull null]]){
        [_flightArrDate setAlpha:0.0];
        [_flightArrLabel setAlpha:0.0];
    } else {
        [_flightArrDate setAlpha:1.0];
        [_flightArrLabel setAlpha:1.0];
        [_flightArrDate setText:[_flight returnDate]];
    }
    if ([[_flight changes] isEqual:@0]) {
        [_changes setText:@"Прямой"];
    } else {
        [_changes setText:[NSString stringWithFormat:@"%@", [_flight changes]]];
    }
    
    int minutes = [_flight duration].intValue;
    int hours = minutes / 60;
    minutes %= 60;
    [_flightTime setText:[NSString stringWithFormat:@"%d часов %d минут", hours, minutes]];
    [_flightLength setText:[NSString stringWithFormat:@"%@ км", [_flight distance]]];
    
    if([[_flight trip_class] isEqual:@0]){
        [_flightClass setText:@"Эконом"];
    } else {
        [_flightClass setText:@"Бизнес"];
    }
    
    [_price setText:[NSString stringWithFormat:@"%@₽", [_flight value]]];
}

#pragma mark - Views

-(void)setUpView{
    if(!self.backView){
        _backView = [[UIView alloc] init];
    }
    _backView.translatesAutoresizingMaskIntoConstraints = NO;
    
    [_backView setBackgroundColor:[UIColor whiteColor]];
    [[_backView layer] setCornerRadius:15.0];
    
    [self.contentView addSubview:_backView];
    
    NSLayoutConstraint* backViewTop = [NSLayoutConstraint constraintWithItem:_backView attribute:NSLayoutAttributeTop relatedBy:NSLayoutRelationEqual toItem:self.contentView attribute:NSLayoutAttributeTop multiplier:1.0 constant:10.0];
    NSLayoutConstraint* backViewLead = [NSLayoutConstraint constraintWithItem:_backView attribute:NSLayoutAttributeLeading relatedBy:NSLayoutRelationEqual toItem:self.contentView attribute:NSLayoutAttributeLeading multiplier:1.0 constant:10.0];
    NSLayoutConstraint* backViewTrail = [NSLayoutConstraint constraintWithItem:_backView attribute:NSLayoutAttributeTrailing relatedBy:NSLayoutRelationEqual toItem:self.contentView attribute:NSLayoutAttributeTrailing multiplier:1.0 constant:-10.0];
    NSLayoutConstraint* backViewBottom = [NSLayoutConstraint constraintWithItem:_backView attribute:NSLayoutAttributeBottom relatedBy:NSLayoutRelationEqual toItem:self.contentView attribute:NSLayoutAttributeBottom multiplier:1.0 constant:-10.0];
    
    [self.contentView addConstraints:@[backViewTop, backViewLead, backViewTrail, backViewBottom]];
    
    if(!self.dropView){
        _dropView = [[UIView alloc] init];
        _dropView.translatesAutoresizingMaskIntoConstraints = NO;
    }
    
    [_dropView setBackgroundColor:_mainTheme];
    [self.contentView addSubview:_dropView];
    
    NSLayoutConstraint* dropTop = [NSLayoutConstraint constraintWithItem:_dropView attribute:NSLayoutAttributeTop relatedBy:NSLayoutRelationEqual toItem:_backView attribute:NSLayoutAttributeTop multiplier:1.0 constant:130.0];
    NSLayoutConstraint* dropLead = [NSLayoutConstraint constraintWithItem:_dropView attribute:NSLayoutAttributeLeading relatedBy:NSLayoutRelationEqual toItem:_backView attribute:NSLayoutAttributeLeading multiplier:1.0 constant:10.0];
    NSLayoutConstraint* dropTrail = [NSLayoutConstraint constraintWithItem:_dropView attribute:NSLayoutAttributeTrailing relatedBy:NSLayoutRelationEqual toItem:_backView attribute:NSLayoutAttributeTrailing multiplier:1.0 constant:-10.0];
    NSLayoutConstraint* dropHeight = [NSLayoutConstraint constraintWithItem:_dropView attribute:NSLayoutAttributeHeight relatedBy:NSLayoutRelationEqual toItem:nil attribute:NSLayoutAttributeNotAnAttribute multiplier:1.0 constant:1.0];
    
    [self.contentView addConstraints:@[dropTop, dropLead, dropTrail, dropHeight]];
    
    UIView* dotOne = [[UIView alloc] init];
    dotOne.translatesAutoresizingMaskIntoConstraints = NO;
    UIView* dotTwo = [[UIView alloc] init];
    dotTwo.translatesAutoresizingMaskIntoConstraints = NO;
    
    [dotOne setBackgroundColor:_mainTheme];
    [[dotOne layer] setCornerRadius:10.0];
    [dotTwo setBackgroundColor:_mainTheme];
    [[dotTwo layer] setCornerRadius:10.0];
    
    [self.contentView addSubview:dotOne];
    [self.contentView addSubview:dotTwo];
    
    NSLayoutConstraint* dotOneTop = [NSLayoutConstraint constraintWithItem:dotOne attribute:NSLayoutAttributeTop relatedBy:NSLayoutRelationEqual toItem:_dropView attribute:NSLayoutAttributeCenterY multiplier:1.0 constant:-10.0];
    NSLayoutConstraint* dotOneBottom = [NSLayoutConstraint constraintWithItem:dotOne attribute:NSLayoutAttributeBottom relatedBy:NSLayoutRelationEqual toItem:_dropView attribute:NSLayoutAttributeCenterY multiplier:1.0 constant:10.0];
    NSLayoutConstraint* dotOneLead = [NSLayoutConstraint constraintWithItem:dotOne attribute:NSLayoutAttributeLeading relatedBy:NSLayoutRelationEqual toItem:_backView attribute:NSLayoutAttributeLeading multiplier:1.0 constant:-10.0];
    NSLayoutConstraint* dotOneTrail = [NSLayoutConstraint constraintWithItem:dotOne attribute:NSLayoutAttributeTrailing relatedBy:NSLayoutRelationEqual toItem:_backView attribute:NSLayoutAttributeLeading multiplier:1.0 constant:10.0];
    
    [self.contentView addConstraints:@[dotOneTop, dotOneLead, dotOneTrail, dotOneBottom]];
    
    NSLayoutConstraint* dotTwoTop = [NSLayoutConstraint constraintWithItem:dotTwo attribute:NSLayoutAttributeTop relatedBy:NSLayoutRelationEqual toItem:_dropView attribute:NSLayoutAttributeCenterY multiplier:1.0 constant:-10.0];
    NSLayoutConstraint* dotTwoBottom = [NSLayoutConstraint constraintWithItem:dotTwo attribute:NSLayoutAttributeBottom relatedBy:NSLayoutRelationEqual toItem:_dropView attribute:NSLayoutAttributeCenterY multiplier:1.0 constant:10.0];
    NSLayoutConstraint* dotTwoLead = [NSLayoutConstraint constraintWithItem:dotTwo attribute:NSLayoutAttributeLeading relatedBy:NSLayoutRelationEqual toItem:_backView attribute:NSLayoutAttributeTrailing multiplier:1.0 constant:-10.0];
    NSLayoutConstraint* dotTwoTrail = [NSLayoutConstraint constraintWithItem:dotTwo attribute:NSLayoutAttributeTrailing relatedBy:NSLayoutRelationEqual toItem:_backView attribute:NSLayoutAttributeTrailing multiplier:1.0 constant:10.0];
    
    [self.contentView addConstraints:@[dotTwoTop, dotTwoLead, dotTwoTrail, dotTwoBottom]];
}

#pragma mark - Header

-(void)setUpHeader{
    UIView* originView = [[UIView alloc] init];
    originView.translatesAutoresizingMaskIntoConstraints = NO;
    UIView* destView = [[UIView alloc] init];
    destView.translatesAutoresizingMaskIntoConstraints = NO;
    
    if(!self.origin){
        _origin = [[UILabel alloc] init];
        _origin.translatesAutoresizingMaskIntoConstraints = NO;
    }
    if(!self.dest){
        _dest = [[UILabel alloc] init];
        _dest.translatesAutoresizingMaskIntoConstraints = NO;
    }
    
    [_origin setTextAlignment:NSTextAlignmentCenter];
    [_dest setTextAlignment:NSTextAlignmentCenter];
    [originView setBackgroundColor:_mainTheme];
    [destView setBackgroundColor:_mainTheme];
    [[originView layer] setCornerRadius:10.0];
    [[destView layer] setCornerRadius:10.0];
    [_origin setFont:[UIFont fontWithName:@"Helvetica-Bold" size:30.0]];
    [_dest setFont:[UIFont fontWithName:@"Helvetica-Bold" size:30.0]];
    [_origin setTextColor:[UIColor whiteColor]];
    [_dest setTextColor:[UIColor whiteColor]];
    
    [self.contentView addSubview:originView];
    [self.contentView addSubview:destView];
    
    [self.contentView addSubview:_origin];
    [self.contentView addSubview:_dest];
    
    NSLayoutConstraint* originViewTop = [NSLayoutConstraint constraintWithItem:originView attribute:NSLayoutAttributeTop relatedBy:NSLayoutRelationEqual toItem:_backView attribute:NSLayoutAttributeTop multiplier:1.0 constant:10.0];
    NSLayoutConstraint* originViewLead = [NSLayoutConstraint constraintWithItem:originView attribute:NSLayoutAttributeLeading relatedBy:NSLayoutRelationEqual toItem:_backView attribute:NSLayoutAttributeLeading multiplier:1.0 constant:40.0];
    NSLayoutConstraint* originViewTrail = [NSLayoutConstraint constraintWithItem:originView attribute:NSLayoutAttributeTrailing relatedBy:NSLayoutRelationEqual toItem:_backView attribute:NSLayoutAttributeCenterX multiplier:1.0 constant:-40.0];
    NSLayoutConstraint* originViewHeight = [NSLayoutConstraint constraintWithItem:originView attribute:NSLayoutAttributeHeight relatedBy:NSLayoutRelationEqual toItem:nil attribute:NSLayoutAttributeNotAnAttribute multiplier:1.0 constant:70.0];
    
    [self.contentView addConstraints:@[originViewTop, originViewLead, originViewTrail, originViewHeight]];
    
    NSLayoutConstraint* originTop = [NSLayoutConstraint constraintWithItem:_origin attribute:NSLayoutAttributeTop relatedBy:NSLayoutRelationEqual toItem:_backView attribute:NSLayoutAttributeTop multiplier:1.0 constant:10.0];
    NSLayoutConstraint* originLead = [NSLayoutConstraint constraintWithItem:_origin attribute:NSLayoutAttributeLeading relatedBy:NSLayoutRelationEqual toItem:_backView attribute:NSLayoutAttributeLeading multiplier:1.0 constant:40.0];
    NSLayoutConstraint* originTrail = [NSLayoutConstraint constraintWithItem:_origin attribute:NSLayoutAttributeTrailing relatedBy:NSLayoutRelationEqual toItem:_backView attribute:NSLayoutAttributeCenterX multiplier:1.0 constant:-40.0];
    NSLayoutConstraint* originHeight = [NSLayoutConstraint constraintWithItem:_origin attribute:NSLayoutAttributeHeight relatedBy:NSLayoutRelationEqual toItem:nil attribute:NSLayoutAttributeNotAnAttribute multiplier:1.0 constant:70.0];
    
    [self.contentView addConstraints:@[originTop, originLead, originTrail, originHeight]];
    
    NSLayoutConstraint* destViewTop = [NSLayoutConstraint constraintWithItem:destView attribute:NSLayoutAttributeTop relatedBy:NSLayoutRelationEqual toItem:_backView attribute:NSLayoutAttributeTop multiplier:1.0 constant:10.0];
    NSLayoutConstraint* destViewLead = [NSLayoutConstraint constraintWithItem:destView attribute:NSLayoutAttributeLeading relatedBy:NSLayoutRelationEqual toItem:_backView attribute:NSLayoutAttributeCenterX multiplier:1.0 constant:40.0];
    NSLayoutConstraint* destViewTrail = [NSLayoutConstraint constraintWithItem:destView attribute:NSLayoutAttributeTrailing relatedBy:NSLayoutRelationEqual toItem:_backView attribute:NSLayoutAttributeTrailing multiplier:1.0 constant:-40.0];
    NSLayoutConstraint* destViewHeight = [NSLayoutConstraint constraintWithItem:destView attribute:NSLayoutAttributeHeight relatedBy:NSLayoutRelationEqual toItem:nil attribute:NSLayoutAttributeNotAnAttribute multiplier:1.0 constant:70.0];
    
    [self.contentView addConstraints:@[destViewTop, destViewLead, destViewTrail, destViewHeight]];
    
    NSLayoutConstraint* destTop = [NSLayoutConstraint constraintWithItem:_dest attribute:NSLayoutAttributeTop relatedBy:NSLayoutRelationEqual toItem:_backView attribute:NSLayoutAttributeTop multiplier:1.0 constant:10.0];
    NSLayoutConstraint* destLead = [NSLayoutConstraint constraintWithItem:_dest attribute:NSLayoutAttributeLeading relatedBy:NSLayoutRelationEqual toItem:_backView attribute:NSLayoutAttributeCenterX multiplier:1.0 constant:40.0];
    NSLayoutConstraint* destTrail = [NSLayoutConstraint constraintWithItem:_dest attribute:NSLayoutAttributeTrailing relatedBy:NSLayoutRelationEqual toItem:_backView attribute:NSLayoutAttributeTrailing multiplier:1.0 constant:-40.0];
    NSLayoutConstraint* destHeight = [NSLayoutConstraint constraintWithItem:_dest attribute:NSLayoutAttributeHeight relatedBy:NSLayoutRelationEqual toItem:nil attribute:NSLayoutAttributeNotAnAttribute multiplier:1.0 constant:70.0];
    
    [self.contentView addConstraints:@[destTop, destLead, destTrail, destHeight]];
    
    if(!self.icon){
        _icon = [[UIImageView alloc] initWithImage:[UIImage imageNamed:@"plane.png"]];
        _icon.translatesAutoresizingMaskIntoConstraints = NO;
    }
    
    [self.contentView addSubview:_icon];
    
    NSLayoutConstraint* iconTop = [NSLayoutConstraint constraintWithItem:_icon attribute:NSLayoutAttributeTop relatedBy:NSLayoutRelationEqual toItem:_backView attribute:NSLayoutAttributeTop multiplier:1.0 constant:40.0];
    NSLayoutConstraint* iconLead = [NSLayoutConstraint constraintWithItem:_icon attribute:NSLayoutAttributeLeading relatedBy:NSLayoutRelationEqual toItem:_origin attribute:NSLayoutAttributeTrailing multiplier:1.0 constant:30.0];
    NSLayoutConstraint* iconTrail = [NSLayoutConstraint constraintWithItem:_icon attribute:NSLayoutAttributeTrailing relatedBy:NSLayoutRelationEqual toItem:_dest attribute:NSLayoutAttributeLeading multiplier:1.0 constant:-30.0];
    NSLayoutConstraint* iconHeight = [NSLayoutConstraint constraintWithItem:_icon attribute:NSLayoutAttributeHeight relatedBy:NSLayoutRelationEqual toItem:nil attribute:NSLayoutAttributeNotAnAttribute multiplier:1.0 constant:20.0];
    
    [self.contentView addConstraints:@[iconTop, iconLead, iconTrail, iconHeight]];
    
    UILabel* originCity = [[UILabel alloc] init];
    originCity.translatesAutoresizingMaskIntoConstraints = NO;
    UILabel* destCity = [[UILabel alloc] init];
    destCity.translatesAutoresizingMaskIntoConstraints = NO;
    
    [originCity setText:[ActiveSession sharedInstance].search.originCity];
    [originCity setTextColor:_mainTheme];
    [originCity setTextAlignment: NSTextAlignmentCenter];
    
    [destCity setText:[ActiveSession sharedInstance].search.destCity];
    [destCity setTextColor:_mainTheme];
    [destCity setTextAlignment:NSTextAlignmentCenter];
    
    [self.contentView addSubview:originCity];
    [self.contentView addSubview:destCity];
    
    NSLayoutConstraint* originCityTop = [NSLayoutConstraint  constraintWithItem:originCity attribute:NSLayoutAttributeTop relatedBy:NSLayoutRelationEqual toItem:_origin attribute:NSLayoutAttributeBottom multiplier:1.0 constant:5.0];
    NSLayoutConstraint* originCityLead = [NSLayoutConstraint constraintWithItem:originCity attribute:NSLayoutAttributeLeading relatedBy:NSLayoutRelationEqual toItem:_backView attribute:NSLayoutAttributeLeading multiplier:1.0 constant:10.0];
    NSLayoutConstraint* originCityTrail = [NSLayoutConstraint constraintWithItem:originCity attribute:NSLayoutAttributeTrailing relatedBy:NSLayoutRelationEqual toItem:_backView attribute:NSLayoutAttributeCenterX multiplier:1.0 constant:-10.0];
    NSLayoutConstraint* originCityHeight = [NSLayoutConstraint constraintWithItem:originCity attribute:NSLayoutAttributeHeight relatedBy:NSLayoutRelationEqual toItem:nil attribute:NSLayoutAttributeNotAnAttribute multiplier:1.0 constant:40.0];
    
    [self.contentView addConstraints:@[originCityTop, originCityLead, originCityTrail, originCityHeight]];
    
    NSLayoutConstraint* destCityTop = [NSLayoutConstraint  constraintWithItem:destCity attribute:NSLayoutAttributeTop relatedBy:NSLayoutRelationEqual toItem:_dest attribute:NSLayoutAttributeBottom multiplier:1.0 constant:5.0];
    NSLayoutConstraint* destCityLead = [NSLayoutConstraint constraintWithItem:destCity attribute:NSLayoutAttributeLeading relatedBy:NSLayoutRelationEqual toItem:_backView attribute:NSLayoutAttributeCenterX multiplier:1.0 constant:10.0];
    NSLayoutConstraint* destCityTrail = [NSLayoutConstraint constraintWithItem:destCity attribute:NSLayoutAttributeTrailing relatedBy:NSLayoutRelationEqual toItem:_backView attribute:NSLayoutAttributeTrailing multiplier:1.0 constant:-10.0];
    NSLayoutConstraint* destCityHeight = [NSLayoutConstraint constraintWithItem:destCity attribute:NSLayoutAttributeHeight relatedBy:NSLayoutRelationEqual toItem:nil attribute:NSLayoutAttributeNotAnAttribute multiplier:1.0 constant:40.0];
    
    [self.contentView addConstraints:@[destCityTop, destCityLead, destCityTrail, destCityHeight]];
}

#pragma mark - Context

-(void)setUpContex{
    if(!self.flightDepDate){
        _flightDepDate = [[UILabel alloc] init];
        _flightDepDate.translatesAutoresizingMaskIntoConstraints = NO;
    }
    [_flightDepDate setTextAlignment:NSTextAlignmentLeft];
    [_flightDepDate setTextColor:_mainTheme];
    
    if(!self.flightDepLabel){
        _flightDepLabel = [[UILabel alloc] init];
        _flightDepLabel.translatesAutoresizingMaskIntoConstraints = NO;
    }
    
    [_flightDepLabel setTextAlignment:NSTextAlignmentLeft];
    [_flightDepLabel setTextColor:_mainTheme];
    [_flightDepLabel setFont:[UIFont fontWithName:@"Helvetica-Bold" size:20.0]];
    [_flightDepLabel setText:@"Дата вылета:"];
    
    [self.contentView addSubview:_flightDepLabel];
    [self.contentView addSubview:_flightDepDate];
    
    NSLayoutConstraint* depLabelTop = [NSLayoutConstraint constraintWithItem:_flightDepLabel attribute:NSLayoutAttributeTop relatedBy:NSLayoutRelationEqual toItem:_dropView attribute:NSLayoutAttributeBottom multiplier:1.0 constant:10.0];
    NSLayoutConstraint* depLabelLead = [NSLayoutConstraint constraintWithItem:_flightDepLabel attribute:NSLayoutAttributeLeading relatedBy:NSLayoutRelationEqual toItem:_backView attribute:NSLayoutAttributeLeading multiplier:1.0 constant:20.0];
    NSLayoutConstraint* depLabelHeight = [NSLayoutConstraint constraintWithItem:_flightDepLabel attribute:NSLayoutAttributeHeight relatedBy:NSLayoutRelationEqual toItem:nil attribute:NSLayoutAttributeNotAnAttribute multiplier:1.0 constant:30.0];
    NSLayoutConstraint* depLabelTrail = [NSLayoutConstraint constraintWithItem:_flightDepLabel attribute:NSLayoutAttributeTrailing relatedBy:NSLayoutRelationEqual toItem:_backView attribute:NSLayoutAttributeCenterX multiplier:1.0 constant:-20.0];
    
    [self.contentView addConstraints:@[depLabelTop, depLabelLead, depLabelTrail, depLabelHeight]];
    
    NSLayoutConstraint* depDateTop = [NSLayoutConstraint constraintWithItem:_flightDepDate attribute:NSLayoutAttributeTop relatedBy:NSLayoutRelationEqual toItem:_flightDepLabel attribute:NSLayoutAttributeBottom multiplier:1.0 constant:5.0];
    NSLayoutConstraint* depDateLead = [NSLayoutConstraint constraintWithItem:_flightDepDate attribute:NSLayoutAttributeLeading relatedBy:NSLayoutRelationEqual toItem:_backView attribute:NSLayoutAttributeLeading multiplier:1.0 constant:20.0];
    NSLayoutConstraint* depDateHeight = [NSLayoutConstraint constraintWithItem:_flightDepDate attribute:NSLayoutAttributeHeight relatedBy:NSLayoutRelationEqual toItem:nil attribute:NSLayoutAttributeNotAnAttribute multiplier:1.0 constant:30.0];
    NSLayoutConstraint* depDateTrail = [NSLayoutConstraint constraintWithItem:_flightDepDate attribute:NSLayoutAttributeTrailing relatedBy:NSLayoutRelationEqual toItem:_backView attribute:NSLayoutAttributeCenterX multiplier:1.0 constant:-20.0];
    
    [self.contentView addConstraints:@[depDateTop, depDateLead, depDateTrail, depDateHeight]];
    
        
    if(!self.flightArrDate){
        _flightArrDate = [[UILabel alloc] init];
        _flightArrDate.translatesAutoresizingMaskIntoConstraints = NO;
    }
    [_flightArrDate setTextAlignment:NSTextAlignmentRight];
    [_flightArrDate setTextColor:_mainTheme];
    
    if(!self.flightArrLabel){
        _flightArrLabel = [[UILabel alloc] init];
        _flightArrLabel.translatesAutoresizingMaskIntoConstraints = NO;
    }
    
    [_flightArrLabel setTextAlignment:NSTextAlignmentRight];
    [_flightArrLabel setTextColor:_mainTheme];
    [_flightArrLabel setFont:[UIFont fontWithName:@"Helvetica-Bold" size:20.0]];
    [_flightArrLabel setText:@"Дата прилета:"];
    
    [self.contentView addSubview:_flightArrLabel];
    [self.contentView addSubview:_flightArrDate];
    
    NSLayoutConstraint* arrLabelTop = [NSLayoutConstraint constraintWithItem:_flightArrLabel attribute:NSLayoutAttributeTop relatedBy:NSLayoutRelationEqual toItem:_dropView attribute:NSLayoutAttributeBottom multiplier:1.0 constant:10.0];
    NSLayoutConstraint* arrLabelLead = [NSLayoutConstraint constraintWithItem:_flightArrLabel attribute:NSLayoutAttributeLeading relatedBy:NSLayoutRelationEqual toItem:_backView attribute:NSLayoutAttributeCenterX multiplier:1.0 constant:20.0];
    NSLayoutConstraint* arrLabelHeight = [NSLayoutConstraint constraintWithItem:_flightArrLabel attribute:NSLayoutAttributeHeight relatedBy:NSLayoutRelationEqual toItem:nil attribute:NSLayoutAttributeNotAnAttribute multiplier:1.0 constant:30.0];
    NSLayoutConstraint* arrLabelTrail = [NSLayoutConstraint constraintWithItem:_flightArrLabel attribute:NSLayoutAttributeTrailing relatedBy:NSLayoutRelationEqual toItem:_backView attribute:NSLayoutAttributeTrailing multiplier:1.0 constant:-20.0];
        
    [self.contentView addConstraints:@[arrLabelTop, arrLabelLead, arrLabelTrail, arrLabelHeight]];
        
    NSLayoutConstraint* arrDateTop = [NSLayoutConstraint constraintWithItem:_flightArrDate attribute:NSLayoutAttributeTop relatedBy:NSLayoutRelationEqual toItem:_flightArrLabel attribute:NSLayoutAttributeBottom multiplier:1.0 constant:5.0];
    NSLayoutConstraint* arrDateLead = [NSLayoutConstraint constraintWithItem:_flightArrDate attribute:NSLayoutAttributeLeading relatedBy:NSLayoutRelationEqual toItem:_backView attribute:NSLayoutAttributeCenterX multiplier:1.0 constant:20.0];
    NSLayoutConstraint* arrDateHeight = [NSLayoutConstraint constraintWithItem:_flightArrDate attribute:NSLayoutAttributeHeight relatedBy:NSLayoutRelationEqual toItem:nil attribute:NSLayoutAttributeNotAnAttribute multiplier:1.0 constant:30.0];
    NSLayoutConstraint* arrDateTrail = [NSLayoutConstraint constraintWithItem:_flightArrDate attribute:NSLayoutAttributeTrailing relatedBy:NSLayoutRelationEqual toItem:_backView attribute:NSLayoutAttributeTrailing multiplier:1.0 constant:-20.0];
        
    [self.contentView addConstraints:@[arrDateTop, arrDateLead, arrDateTrail, arrDateHeight]];
    
    if(!self.changes){
        _changes = [[UILabel alloc] init];
        _changes.translatesAutoresizingMaskIntoConstraints = NO;
    }
    UILabel* changesLabel = [[UILabel alloc] init];
    changesLabel.translatesAutoresizingMaskIntoConstraints = NO;
    
    [_changes setTextColor:_mainTheme];
    [_changes setTextAlignment:NSTextAlignmentLeft];
    
    [changesLabel setTextColor:_mainTheme];
    [changesLabel setTextAlignment:NSTextAlignmentLeft];
    [changesLabel setFont:[UIFont fontWithName:@"Helvetica-Bold" size:20.0]];
    [changesLabel setText:@"Пересадки:"];
    
    [self.contentView addSubview:changesLabel];
    [self.contentView addSubview:_changes];
    
    NSLayoutConstraint* changesLabelTop = [NSLayoutConstraint constraintWithItem:changesLabel attribute:NSLayoutAttributeTop relatedBy:NSLayoutRelationEqual toItem:_flightDepDate attribute:NSLayoutAttributeBottom multiplier:1.0 constant:10.0];
    NSLayoutConstraint* changesLabelLead = [NSLayoutConstraint constraintWithItem:changesLabel attribute:NSLayoutAttributeLeading relatedBy:NSLayoutRelationEqual toItem:_backView attribute:NSLayoutAttributeLeading multiplier:1.0 constant:20.0];
    NSLayoutConstraint* changesLabelTrail = [NSLayoutConstraint constraintWithItem:changesLabel attribute:NSLayoutAttributeTrailing relatedBy:NSLayoutRelationEqual toItem:_backView attribute:NSLayoutAttributeTrailing multiplier:1.0 constant:-20.0];
    NSLayoutConstraint* changesLabelHeight = [NSLayoutConstraint constraintWithItem:changesLabel attribute:NSLayoutAttributeHeight relatedBy:NSLayoutRelationEqual toItem:nil attribute:NSLayoutAttributeNotAnAttribute multiplier:1.0 constant:30.0];
    
    [self.contentView addConstraints:@[changesLabelTop, changesLabelLead, changesLabelTrail, changesLabelHeight]];
    
    NSLayoutConstraint* changesTop = [NSLayoutConstraint constraintWithItem:_changes attribute:NSLayoutAttributeTop relatedBy:NSLayoutRelationEqual toItem:changesLabel attribute:NSLayoutAttributeBottom multiplier:1.0 constant:5.0];
    NSLayoutConstraint* changesLead = [NSLayoutConstraint constraintWithItem:_changes attribute:NSLayoutAttributeLeading relatedBy:NSLayoutRelationEqual toItem:_backView attribute:NSLayoutAttributeLeading multiplier:1.0 constant:20.0];
    NSLayoutConstraint* changesTrail = [NSLayoutConstraint constraintWithItem:_changes attribute:NSLayoutAttributeTrailing relatedBy:NSLayoutRelationEqual toItem:_backView attribute:NSLayoutAttributeTrailing multiplier:1.0 constant:-20.0];
    NSLayoutConstraint* changesHeight = [NSLayoutConstraint constraintWithItem:_changes attribute:NSLayoutAttributeHeight relatedBy:NSLayoutRelationEqual toItem:nil attribute:NSLayoutAttributeNotAnAttribute multiplier:1.0 constant:30.0];
    
    [self.contentView addConstraints:@[changesTop, changesLead, changesTrail, changesHeight]];
    
    if(!self.flightTime){
        _flightTime = [[UILabel alloc] init];
        _flightTime.translatesAutoresizingMaskIntoConstraints = NO;
    }
    UILabel* timeLabel = [[UILabel alloc] init];
    timeLabel.translatesAutoresizingMaskIntoConstraints = NO;
    
    [_flightTime setTextColor:_mainTheme];
    [_flightTime setTextAlignment:NSTextAlignmentLeft];
    
    [timeLabel setTextColor:_mainTheme];
    [timeLabel setTextAlignment:NSTextAlignmentLeft];
    [timeLabel setFont:[UIFont fontWithName:@"Helvetica-Bold" size:20.0]];
    [timeLabel setText:@"Продолжительность перелета:"];
    
    [self.contentView addSubview:timeLabel];
    [self.contentView addSubview:_flightTime];
    
    NSLayoutConstraint* timeLabelTop = [NSLayoutConstraint constraintWithItem:timeLabel attribute:NSLayoutAttributeTop relatedBy:NSLayoutRelationEqual toItem:_changes attribute:NSLayoutAttributeBottom multiplier:1.0 constant:10.0];
    NSLayoutConstraint* timeLabelLead = [NSLayoutConstraint constraintWithItem:timeLabel attribute:NSLayoutAttributeLeading relatedBy:NSLayoutRelationEqual toItem:_backView attribute:NSLayoutAttributeLeading multiplier:1.0 constant:20.0];
    NSLayoutConstraint* timeLabelTrail = [NSLayoutConstraint constraintWithItem:timeLabel attribute:NSLayoutAttributeTrailing relatedBy:NSLayoutRelationEqual toItem:_backView attribute:NSLayoutAttributeTrailing multiplier:1.0 constant:-20.0];
    NSLayoutConstraint* timeLabelHeight = [NSLayoutConstraint constraintWithItem:timeLabel attribute:NSLayoutAttributeHeight relatedBy:NSLayoutRelationEqual toItem:nil attribute:NSLayoutAttributeNotAnAttribute multiplier:1.0 constant:30.0];
    
    [self.contentView addConstraints:@[timeLabelTop, timeLabelLead, timeLabelTrail, timeLabelHeight]];
    
    NSLayoutConstraint* timeTop = [NSLayoutConstraint constraintWithItem:_flightTime attribute:NSLayoutAttributeTop relatedBy:NSLayoutRelationEqual toItem:timeLabel attribute:NSLayoutAttributeBottom multiplier:1.0 constant:5.0];
    NSLayoutConstraint* timeLead = [NSLayoutConstraint constraintWithItem:_flightTime attribute:NSLayoutAttributeLeading relatedBy:NSLayoutRelationEqual toItem:_backView attribute:NSLayoutAttributeLeading multiplier:1.0 constant:20.0];
    NSLayoutConstraint* timeTrail = [NSLayoutConstraint constraintWithItem:_flightTime attribute:NSLayoutAttributeTrailing relatedBy:NSLayoutRelationEqual toItem:_backView attribute:NSLayoutAttributeTrailing multiplier:1.0 constant:-20.0];
    NSLayoutConstraint* timeHeight = [NSLayoutConstraint constraintWithItem:_flightTime attribute:NSLayoutAttributeHeight relatedBy:NSLayoutRelationEqual toItem:nil attribute:NSLayoutAttributeNotAnAttribute multiplier:1.0 constant:30.0];
    
    [self.contentView addConstraints:@[timeTop, timeLead, timeTrail, timeHeight]];
    
    if(!self.flightLength){
        _flightLength = [[UILabel alloc] init];
        _flightLength.translatesAutoresizingMaskIntoConstraints = NO;
    }
    UILabel* lengthLabel = [[UILabel alloc] init];
    lengthLabel.translatesAutoresizingMaskIntoConstraints = NO;
    
    [_flightLength setTextColor:_mainTheme];
    [_flightLength setTextAlignment:NSTextAlignmentLeft];
    
    [lengthLabel setTextColor:_mainTheme];
    [lengthLabel setTextAlignment:NSTextAlignmentLeft];
    [lengthLabel setFont:[UIFont fontWithName:@"Helvetica-Bold" size:20.0]];
    [lengthLabel setText:@"Расстояние:"];
    
    [self.contentView addSubview:lengthLabel];
    [self.contentView addSubview:_flightLength];
    
    NSLayoutConstraint* legthLabelTop = [NSLayoutConstraint constraintWithItem:lengthLabel attribute:NSLayoutAttributeTop relatedBy:NSLayoutRelationEqual toItem:_flightTime attribute:NSLayoutAttributeBottom multiplier:1.0 constant:10.0];
    NSLayoutConstraint* legthLabelLead = [NSLayoutConstraint constraintWithItem:lengthLabel attribute:NSLayoutAttributeLeading relatedBy:NSLayoutRelationEqual toItem:_backView attribute:NSLayoutAttributeLeading multiplier:1.0 constant:20.0];
    NSLayoutConstraint* legthLabelTrail = [NSLayoutConstraint constraintWithItem:lengthLabel attribute:NSLayoutAttributeTrailing relatedBy:NSLayoutRelationEqual toItem:_backView attribute:NSLayoutAttributeTrailing multiplier:1.0 constant:-20.0];
    NSLayoutConstraint* legthLabelHeight = [NSLayoutConstraint constraintWithItem:lengthLabel attribute:NSLayoutAttributeHeight relatedBy:NSLayoutRelationEqual toItem:nil attribute:NSLayoutAttributeNotAnAttribute multiplier:1.0 constant:30.0];
    
    [self.contentView addConstraints:@[legthLabelTop, legthLabelLead, legthLabelTrail, legthLabelHeight]];
    
    NSLayoutConstraint* legthTop = [NSLayoutConstraint constraintWithItem:_flightLength attribute:NSLayoutAttributeTop relatedBy:NSLayoutRelationEqual toItem:lengthLabel attribute:NSLayoutAttributeBottom multiplier:1.0 constant:5.0];
    NSLayoutConstraint* legthLead = [NSLayoutConstraint constraintWithItem:_flightLength attribute:NSLayoutAttributeLeading relatedBy:NSLayoutRelationEqual toItem:_backView attribute:NSLayoutAttributeLeading multiplier:1.0 constant:20.0];
    NSLayoutConstraint* legthTrail = [NSLayoutConstraint constraintWithItem:_flightLength attribute:NSLayoutAttributeTrailing relatedBy:NSLayoutRelationEqual toItem:_backView attribute:NSLayoutAttributeTrailing multiplier:1.0 constant:-20.0];
    NSLayoutConstraint* legthHeight = [NSLayoutConstraint constraintWithItem:_flightLength attribute:NSLayoutAttributeHeight relatedBy:NSLayoutRelationEqual toItem:nil attribute:NSLayoutAttributeNotAnAttribute multiplier:1.0 constant:30.0];
    
    [self.contentView addConstraints:@[legthTop, legthLead, legthTrail, legthHeight]];
    
    if(!self.flightClass){
        _flightClass = [[UILabel alloc] init];
        _flightClass.translatesAutoresizingMaskIntoConstraints = NO;
    }
    UILabel* classLabel = [[UILabel alloc] init];
    classLabel.translatesAutoresizingMaskIntoConstraints = NO;
    
    [_flightClass setTextColor:_mainTheme];
    [_flightClass setTextAlignment:NSTextAlignmentLeft];
    
    [classLabel setTextColor:_mainTheme];
    [classLabel setTextAlignment:NSTextAlignmentLeft];
    [classLabel setFont:[UIFont fontWithName:@"Helvetica-Bold" size:20.0]];
    [classLabel setText:@"Класс обслуживания:"];
    
    [self.contentView addSubview:classLabel];
    [self.contentView addSubview:_flightClass];
    
    NSLayoutConstraint* classLabelTop = [NSLayoutConstraint constraintWithItem:classLabel attribute:NSLayoutAttributeTop relatedBy:NSLayoutRelationEqual toItem:_flightLength attribute:NSLayoutAttributeBottom multiplier:1.0 constant:10.0];
    NSLayoutConstraint* classLabelLead = [NSLayoutConstraint constraintWithItem:classLabel attribute:NSLayoutAttributeLeading relatedBy:NSLayoutRelationEqual toItem:_backView attribute:NSLayoutAttributeLeading multiplier:1.0 constant:20.0];
    NSLayoutConstraint* classLabelTrail = [NSLayoutConstraint constraintWithItem:classLabel attribute:NSLayoutAttributeTrailing relatedBy:NSLayoutRelationEqual toItem:_backView attribute:NSLayoutAttributeTrailing multiplier:1.0 constant:-20.0];
    NSLayoutConstraint* classLabelHeight = [NSLayoutConstraint constraintWithItem:classLabel attribute:NSLayoutAttributeHeight relatedBy:NSLayoutRelationEqual toItem:nil attribute:NSLayoutAttributeNotAnAttribute multiplier:1.0 constant:30.0];
    
    [self.contentView addConstraints:@[classLabelTop, classLabelLead, classLabelTrail, classLabelHeight]];
    
    NSLayoutConstraint* classTop = [NSLayoutConstraint constraintWithItem:_flightClass attribute:NSLayoutAttributeTop relatedBy:NSLayoutRelationEqual toItem:classLabel attribute:NSLayoutAttributeBottom multiplier:1.0 constant:5.0];
    NSLayoutConstraint* classLead = [NSLayoutConstraint constraintWithItem:_flightClass attribute:NSLayoutAttributeLeading relatedBy:NSLayoutRelationEqual toItem:_backView attribute:NSLayoutAttributeLeading multiplier:1.0 constant:20.0];
    NSLayoutConstraint* classTrail = [NSLayoutConstraint constraintWithItem:_flightClass attribute:NSLayoutAttributeTrailing relatedBy:NSLayoutRelationEqual toItem:_backView attribute:NSLayoutAttributeTrailing multiplier:1.0 constant:-20.0];
    NSLayoutConstraint* classHeight = [NSLayoutConstraint constraintWithItem:_flightClass attribute:NSLayoutAttributeHeight relatedBy:NSLayoutRelationEqual toItem:nil attribute:NSLayoutAttributeNotAnAttribute multiplier:1.0 constant:30.0];
    
    [self.contentView addConstraints:@[classTop, classLead, classTrail, classHeight]];
    
    if(!self.price){
        _price = [[UILabel alloc] init];
        _price.translatesAutoresizingMaskIntoConstraints = NO;
    }
    
    [_price setTextColor:_mainTheme];
    [_price setTextAlignment:NSTextAlignmentLeft];
    [_price setFont:[UIFont fontWithName:@"Helvetica-Bold" size:30.0]];
    
    [self.contentView addSubview:_price];
    
    NSLayoutConstraint* priceTop = [NSLayoutConstraint constraintWithItem:_price attribute:NSLayoutAttributeTop relatedBy:NSLayoutRelationEqual toItem:_flightClass attribute:NSLayoutAttributeBottom multiplier:1.0 constant:10.0];
    NSLayoutConstraint* priceLead = [NSLayoutConstraint constraintWithItem:_price attribute:NSLayoutAttributeLeading relatedBy:NSLayoutRelationEqual toItem:_backView attribute:NSLayoutAttributeLeading multiplier:1.0 constant:20.0];
    NSLayoutConstraint* priceTrail = [NSLayoutConstraint constraintWithItem:_price attribute:NSLayoutAttributeTrailing relatedBy:NSLayoutRelationEqual toItem:_backView attribute:NSLayoutAttributeCenterX multiplier:1.0 constant:-20.0];
    NSLayoutConstraint* priceHeight = [NSLayoutConstraint constraintWithItem:_price attribute:NSLayoutAttributeHeight relatedBy:NSLayoutRelationEqual toItem:nil attribute:NSLayoutAttributeNotAnAttribute multiplier:1.0 constant:50.0];
    
    [self.contentView addConstraints:@[priceTop, priceLead, priceTrail, priceHeight]];
    
    if(!self.buy){
        _buy = [[UIButton alloc] init];
        _buy.translatesAutoresizingMaskIntoConstraints = NO;
    }
    
    [_buy setTitleColor:[UIColor whiteColor] forState:UIControlStateNormal];
    [_buy setBackgroundColor:_mainTheme];
    [[_buy layer] setCornerRadius:10.0];
    [[_buy titleLabel] setTextAlignment:NSTextAlignmentCenter];
    [_buy setTitle:@"Купить" forState:UIControlStateNormal];
    [[_buy titleLabel] setFont:[UIFont fontWithName:@"Helvetica-Bold" size:30.0]];
    
    [self.contentView addSubview:_buy];
    
    NSLayoutConstraint* buyTop = [NSLayoutConstraint constraintWithItem:_buy attribute:NSLayoutAttributeTop relatedBy:NSLayoutRelationEqual toItem:_flightClass attribute:NSLayoutAttributeBottom multiplier:1.0 constant:10.0];
    NSLayoutConstraint* buyLead = [NSLayoutConstraint constraintWithItem:_buy attribute:NSLayoutAttributeLeading relatedBy:NSLayoutRelationEqual toItem:_backView attribute:NSLayoutAttributeCenterX multiplier:1.0 constant:20.0];
    NSLayoutConstraint* buyTrail = [NSLayoutConstraint constraintWithItem:_buy attribute:NSLayoutAttributeTrailing relatedBy:NSLayoutRelationEqual toItem:_backView attribute:NSLayoutAttributeTrailing multiplier:1.0 constant:-20.0];
    NSLayoutConstraint* buyHeight = [NSLayoutConstraint constraintWithItem:_buy attribute:NSLayoutAttributeHeight relatedBy:NSLayoutRelationEqual toItem:nil attribute:NSLayoutAttributeNotAnAttribute multiplier:1.0 constant:50.0];
    
    [self.contentView addConstraints:@[buyTop, buyLead, buyTrail, buyHeight]];
}

@end

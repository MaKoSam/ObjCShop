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
}

@end

//
//  PlaceTableCell.m
//  TripPlaner
//
//  Created by Sam Mazniker on 09/04/2020.
//  Copyright © 2020 Sam Mazniker. All rights reserved.
//

#import "PlaceTableCell.h"

@implementation PlaceTableCell

- (instancetype) initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier{
    self = [super initWithStyle:style reuseIdentifier:reuseIdentifier];
    if(!self.search){
        _search = [[SearchEngine alloc] init];
    }
    if(!self.airport){
        _airport = [[Airport alloc] init];
    }
    if(!self.code){
        _code = [[UILabel alloc] init];
        _code.translatesAutoresizingMaskIntoConstraints = NO;
    }
    if(!self.name){
        _name = [[UILabel alloc] init];
        _name.translatesAutoresizingMaskIntoConstraints = NO;
    }
    if(!self.city_code){
        _city_code = [[UILabel alloc] init];
        _city_code.translatesAutoresizingMaskIntoConstraints = NO;
    }
    if(!self.country_code){
        _country_code = [[UILabel alloc] init];
        _country_code.translatesAutoresizingMaskIntoConstraints = NO;
    }
    
    [self.contentView addSubview:_code];
    [self.contentView addSubview:_name];
    [self.contentView addSubview:_city_code];
    [self.contentView addSubview:_country_code];
    
    NSLayoutConstraint* codeTop = [NSLayoutConstraint
                                   constraintWithItem:_code
                                   attribute:NSLayoutAttributeTop
                                   relatedBy:NSLayoutRelationEqual
                                   toItem:self.contentView
                                   attribute:NSLayoutAttributeTop
                                   multiplier:1.0
                                   constant:5.0];
    NSLayoutConstraint* codeLead = [NSLayoutConstraint
                                    constraintWithItem:_code
                                    attribute:NSLayoutAttributeLeading
                                    relatedBy:NSLayoutRelationEqual
                                    toItem:self.contentView
                                    attribute:NSLayoutAttributeLeading
                                    multiplier:1.0
                                    constant:10.0];
    NSLayoutConstraint* codeWidth = [NSLayoutConstraint
                                     constraintWithItem:_code
                                     attribute:NSLayoutAttributeWidth
                                     relatedBy:NSLayoutRelationEqual
                                     toItem:nil
                                     attribute:NSLayoutAttributeNotAnAttribute
                                     multiplier:1.0
                                     constant:50.0];
    NSLayoutConstraint* codeHeight = [NSLayoutConstraint
                                      constraintWithItem:_code
                                      attribute:NSLayoutAttributeHeight
                                      relatedBy:NSLayoutRelationEqual
                                      toItem:nil
                                      attribute:NSLayoutAttributeNotAnAttribute
                                      multiplier:1.0
                                      constant:50];
    [self.contentView addConstraints:@[codeTop, codeLead, codeWidth, codeHeight]];
    
    
    NSLayoutConstraint* nameTop = [NSLayoutConstraint
                                   constraintWithItem:_name
                                   attribute:NSLayoutAttributeTop
                                   relatedBy:NSLayoutRelationEqual
                                   toItem:self.contentView
                                   attribute:NSLayoutAttributeTop
                                   multiplier:1.0
                                   constant:5.0];
    NSLayoutConstraint* nameLead = [NSLayoutConstraint
                                    constraintWithItem:_name
                                    attribute:NSLayoutAttributeLeading
                                    relatedBy:NSLayoutRelationEqual
                                    toItem:_code
                                    attribute:NSLayoutAttributeTrailing
                                    multiplier:1.0
                                    constant:5.0];
    NSLayoutConstraint* nameTrail = [NSLayoutConstraint
                                     constraintWithItem:_name
                                     attribute:NSLayoutAttributeTrailing
                                     relatedBy:NSLayoutRelationEqual
                                     toItem:self.contentView
                                     attribute:NSLayoutAttributeCenterX
                                     multiplier:1.0
                                     constant:-5.0];
    NSLayoutConstraint* nameHeight = [NSLayoutConstraint
                                      constraintWithItem:_name
                                      attribute:NSLayoutAttributeHeight
                                      relatedBy:NSLayoutRelationEqual
                                      toItem:nil
                                      attribute:NSLayoutAttributeNotAnAttribute
                                      multiplier:1.0
                                      constant:50];
    [self.contentView addConstraints:@[nameTop, nameLead, nameTrail, nameHeight]];
    
    NSLayoutConstraint* cityTop = [NSLayoutConstraint
                                   constraintWithItem:_city_code
                                   attribute:NSLayoutAttributeTop
                                   relatedBy:NSLayoutRelationEqual
                                   toItem:self.contentView
                                   attribute:NSLayoutAttributeTop
                                   multiplier:1.0
                                   constant:5.0];
    NSLayoutConstraint* cityLead = [NSLayoutConstraint
                                    constraintWithItem:_city_code
                                    attribute:NSLayoutAttributeLeading
                                    relatedBy:NSLayoutRelationEqual
                                    toItem:self.contentView
                                    attribute:NSLayoutAttributeCenterX
                                    multiplier:1.0
                                    constant:5.0];
    NSLayoutConstraint* cityWidth = [NSLayoutConstraint
                                     constraintWithItem:_city_code
                                     attribute:NSLayoutAttributeWidth
                                     relatedBy:NSLayoutRelationEqual
                                     toItem:nil
                                     attribute:NSLayoutAttributeNotAnAttribute
                                     multiplier:1.0
                                     constant:100.0];
    NSLayoutConstraint* cityHeight = [NSLayoutConstraint
                                      constraintWithItem:_city_code
                                      attribute:NSLayoutAttributeHeight
                                      relatedBy:NSLayoutRelationEqual
                                      toItem:nil
                                      attribute:NSLayoutAttributeNotAnAttribute
                                      multiplier:1.0
                                      constant:50];
    [self.contentView addConstraints:@[cityTop, cityLead, cityWidth, cityHeight]];
    
    NSLayoutConstraint* countryTop = [NSLayoutConstraint
                                      constraintWithItem:_country_code
                                      attribute:NSLayoutAttributeTop
                                      relatedBy:NSLayoutRelationEqual
                                      toItem:self.contentView
                                      attribute:NSLayoutAttributeTop
                                      multiplier:1.0
                                      constant:5.0];
    NSLayoutConstraint* countryLead = [NSLayoutConstraint
                                       constraintWithItem:_country_code
                                       attribute:NSLayoutAttributeLeading
                                       relatedBy:NSLayoutRelationEqual
                                       toItem:_city_code
                                       attribute:NSLayoutAttributeTrailing
                                       multiplier:1.0
                                       constant:10.0];
    NSLayoutConstraint* countryTrail = [NSLayoutConstraint
                                        constraintWithItem:_country_code
                                        attribute:NSLayoutAttributeTrailing
                                        relatedBy:NSLayoutRelationEqual
                                        toItem:self.contentView
                                        attribute:NSLayoutAttributeTrailing
                                        multiplier:1.0
                                        constant: -10.0];
    NSLayoutConstraint* countryHeight = [NSLayoutConstraint
                                         constraintWithItem:_country_code
                                         attribute:NSLayoutAttributeHeight
                                         relatedBy:NSLayoutRelationEqual
                                         toItem:nil
                                         attribute:NSLayoutAttributeNotAnAttribute
                                         multiplier:1.0
                                         constant:50];
    [self.contentView addConstraints:@[countryTop, countryLead, countryTrail, countryHeight]];
    
    return self;
}

- (void)awakeFromNib {
    [super awakeFromNib];
    // Initialization code
}

- (void)setSelected:(BOOL)selected animated:(BOOL)animated {
    [super setSelected:selected animated:animated];
}

-(void)setAirport:(Airport *)airport{
    _airport = airport;
    [_code setText:_airport.code];
    [_name setText:_airport.name];
    [_city_code setText: [_search findCityByKeyReturnName:_airport.city_code] ];
    [_country_code setText: [_search findCountryByKeyReturnName:_airport.country_code] ];
}

@end

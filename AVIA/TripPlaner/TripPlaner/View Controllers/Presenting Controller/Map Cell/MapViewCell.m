//
//  MapViewCell.m
//  TripPlaner
//
//  Created by Sam Mazniker on 15/04/2020.
//  Copyright © 2020 Sam Mazniker. All rights reserved.
//

#import "MapViewCell.h"

@implementation MapViewCell

- (void)awakeFromNib {
    [super awakeFromNib];
    // Initialization code
}

- (void)setSelected:(BOOL)selected animated:(BOOL)animated {
    [super setSelected:selected animated:animated];

    // Configure the view for the selected state
}

-(instancetype)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier{
    self = [super initWithStyle:style reuseIdentifier:reuseIdentifier];
    if(self){
        [self setUpViews];
    }
    return self;
}

-(void)updateCitiesWithOrigin:(NSString*)originName Destination:(NSString*)destinationName{
    SearchEngine* searcher = [[SearchEngine alloc] init];
    if(!self.originCity){
        _originCity = [[City alloc] init];
    }
    _originCity = [searcher findCityByNameReturnSelf:originName];
    
    if(!self.destCity){
        _destCity = [[City alloc] init];
    }
    _destCity = [searcher findCityByNameReturnSelf:destinationName];
    
    @try{
        MKCoordinateRegion origReg = MKCoordinateRegionMakeWithDistance(_originCity.coordinates, 5000, 5000);
        MKCoordinateRegion destReg = MKCoordinateRegionMakeWithDistance(_destCity.coordinates, 5000, 5000);
        
        MKPointAnnotation* origAnnotation = [[MKPointAnnotation alloc] init];
        MKPointAnnotation* destAnnotation = [[MKPointAnnotation alloc] init];
        
        [origAnnotation setTitle:_originCity.name];
        [origAnnotation setCoordinate:_originCity.coordinates];
        
        [destAnnotation setTitle:_destCity.name];
        [destAnnotation setCoordinate:_destCity.coordinates];
        
        [_originCityView setRegion:origReg];
        [_destCityView setRegion:destReg];
        
        [_originCityView addAnnotation:origAnnotation];
        [_destCityView addAnnotation:destAnnotation];
        
        [_originCityView setScrollEnabled:NO];
        [_originCityView setPitchEnabled:NO];
        [_originCityView setZoomEnabled:NO];
        
        [_destCityView setScrollEnabled:NO];
        [_destCityView setPitchEnabled:NO];
        [_destCityView setZoomEnabled:NO];
    }
    @catch(id anExeption){
        
    }
}

-(void)setUpViews{
    [self.contentView setBackgroundColor:[UIColor colorWithRed:0.15 green:0.09 blue:0.14 alpha:1.0]];
    
    if(!self.originCityView){
        _originCityView = [[MKMapView alloc] init];
        _originCityView.translatesAutoresizingMaskIntoConstraints = NO;
    }
    
    [[_originCityView layer] setCornerRadius:15.0];
    
    [self.contentView addSubview:_originCityView];
    
    NSLayoutConstraint* originTop = [NSLayoutConstraint constraintWithItem:_originCityView attribute:NSLayoutAttributeTop relatedBy:NSLayoutRelationEqual toItem:self.contentView attribute:NSLayoutAttributeTop multiplier:1.0 constant:10.0];
    NSLayoutConstraint* originLead = [NSLayoutConstraint constraintWithItem:_originCityView attribute:NSLayoutAttributeLeading relatedBy:NSLayoutRelationEqual toItem:self.contentView attribute:NSLayoutAttributeLeading multiplier:1.0 constant:10.0];
    NSLayoutConstraint* originTrail = [NSLayoutConstraint constraintWithItem:_originCityView attribute:NSLayoutAttributeTrailing relatedBy:NSLayoutRelationEqual toItem:self.contentView attribute:NSLayoutAttributeTrailing multiplier:1.0 constant:-10.0];
    NSLayoutConstraint* originBottom = [NSLayoutConstraint constraintWithItem:_originCityView attribute:NSLayoutAttributeBottom relatedBy:NSLayoutRelationEqual toItem:self.contentView attribute:NSLayoutAttributeCenterY multiplier:1.0 constant:-5.0];
    
    [self.contentView addConstraints:@[originTop, originLead, originTrail, originBottom]];
    
    if(!self.destCityView){
        _destCityView = [[MKMapView alloc] init];
        _destCityView.translatesAutoresizingMaskIntoConstraints = NO;
    }
    
    [[_destCityView layer] setCornerRadius:15.0];
    
    [self.contentView addSubview:_destCityView];
    
    NSLayoutConstraint* destTop = [NSLayoutConstraint constraintWithItem:_destCityView attribute:NSLayoutAttributeTop relatedBy:NSLayoutRelationEqual toItem:self.contentView attribute:NSLayoutAttributeCenterY multiplier:1.0 constant:5.0];
    NSLayoutConstraint* destLead = [NSLayoutConstraint constraintWithItem:_destCityView attribute:NSLayoutAttributeLeading relatedBy:NSLayoutRelationEqual toItem:self.contentView attribute:NSLayoutAttributeLeading multiplier:1.0 constant:10.0];
    NSLayoutConstraint* destTrail = [NSLayoutConstraint constraintWithItem:_destCityView attribute:NSLayoutAttributeTrailing relatedBy:NSLayoutRelationEqual toItem:self.contentView attribute:NSLayoutAttributeTrailing multiplier:1.0 constant:-10.0];
    NSLayoutConstraint* destBottom = [NSLayoutConstraint constraintWithItem:_destCityView attribute:NSLayoutAttributeBottom relatedBy:NSLayoutRelationEqual toItem:self.contentView attribute:NSLayoutAttributeBottom multiplier:1.0 constant:-10.0];
    
    [self.contentView addConstraints:@[destTop, destLead, destTrail, destBottom]];
}

@end

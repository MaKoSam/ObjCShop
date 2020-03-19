//
//  ArticleTableViewCell.m
//  newsapi
//
//  Created by Sam Mazniker on 19/03/2020.
//  Copyright © 2020 Sam Mazniker. All rights reserved.
//

#import "ArticleTableViewCell.h"

@implementation ArticleTableViewCell

- (instancetype) initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier{
    self = [super initWithStyle:style reuseIdentifier:reuseIdentifier];
    if(self){
        //View Setup
        [self setBackgroundColor:[UIColor darkGrayColor]];
        
        //Headline Setup
        _headline = [[UILabel alloc] init];
        [_headline setTextColor:[UIColor whiteColor]];
        _headline.numberOfLines = 2;
        _headline.textAlignment = NSTextAlignmentCenter;
        _headline.translatesAutoresizingMaskIntoConstraints = NO;
        [self.contentView addSubview:_headline];
        
        UILayoutGuide* margins = self.layoutMarginsGuide;
        [_headline.topAnchor constraintEqualToAnchor: margins.topAnchor constant:5.0].active = YES;
        [_headline.leadingAnchor constraintEqualToAnchor: margins.leadingAnchor constant:10.0].active = YES;
        [_headline.trailingAnchor constraintEqualToAnchor:margins.trailingAnchor constant: -10.0].active = YES;
        [_headline.heightAnchor constraintEqualToConstant:100.0].active = YES;
        
        //PublishedAt setup
        _publishedAt = [[UILabel alloc] init];
        [_publishedAt setTextColor:[UIColor lightGrayColor]];
        _publishedAt.textAlignment = NSTextAlignmentLeft;
        _publishedAt.translatesAutoresizingMaskIntoConstraints = NO;
        [self.contentView addSubview:_publishedAt];
//Не работает констейнт:
//        [_publishedAt.topAnchor constraintEqualToAnchor:_publishedAt.bottomAnchor constant:5.0].active = YES;
        [_publishedAt.leadingAnchor constraintEqualToAnchor:margins.leadingAnchor constant:10.0].active = YES;
        [_publishedAt.trailingAnchor constraintEqualToAnchor:margins.trailingAnchor constant:-10.0].active = YES;
        [_publishedAt.heightAnchor constraintEqualToConstant:50.0].active = YES;
     
        //Image Setup
        
        _image = [[UIImageView alloc] initWithFrame:CGRectMake(10, 120, 300, 300)];
        
        [self.contentView addSubview:_image];
        
    }
    return self;
}

- (void) prepareForReuse {
    [super prepareForReuse];
    _image.image = nil;
}

- (void)awakeFromNib {
    [super awakeFromNib];
    
}

- (void)setSelected:(BOOL)selected animated:(BOOL)animated {
    [super setSelected:selected animated:animated];

    // Configure the view for the selected state
}

@end

//
//  ThemeTableCell.m
//  class1
//
//  Created by Sam Mazniker on 17/03/2020.
//  Copyright © 2020 Sam Mazniker. All rights reserved.
//

#import "ThemeTableCell.h"

@implementation ThemeTableCell

- (instancetype) initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier{
    self = [super initWithStyle:style reuseIdentifier:reuseIdentifier];
    if(self){
        _themeName = [[UILabel alloc] initWithFrame:CGRectMake(5, 5, 100, 50)];
        _themeName.textAlignment = NSTextAlignmentLeft;
        [self.contentView addSubview:_themeName];
    }
    return self;
}

- (void)awakeFromNib {
    [super awakeFromNib];
    // Initialization code
}

- (void)setSelected:(BOOL)selected animated:(BOOL)animated {
    [super setSelected:selected animated:animated];

    // Configure the view for the selected state
}

@end

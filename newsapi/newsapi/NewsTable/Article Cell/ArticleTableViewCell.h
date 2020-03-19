//
//  ArticleTableViewCell.h
//  newsapi
//
//  Created by Sam Mazniker on 19/03/2020.
//  Copyright © 2020 Sam Mazniker. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "Article.h"

NS_ASSUME_NONNULL_BEGIN

@interface ArticleTableViewCell : UITableViewCell

@property (nonatomic, strong) Article* article;

@property (nonatomic, strong) UILabel* headline;
@property (nonatomic, strong) UILabel* publishedAt;
@property (nonatomic, strong) UILabel* source;
@property (nonatomic, strong) UIImageView* image;

@end

NS_ASSUME_NONNULL_END

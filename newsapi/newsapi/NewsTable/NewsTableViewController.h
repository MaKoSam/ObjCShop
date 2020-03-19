//
//  NewsTableViewController.h
//  newsapi
//
//  Created by Sam Mazniker on 19/03/2020.
//  Copyright © 2020 Sam Mazniker. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "Article.h"
#import "ArticleTableViewCell.h"
#import "NetworkManager.h"

NS_ASSUME_NONNULL_BEGIN

@interface NewsTableViewController : UIViewController <UITableViewDataSource>

@property (nonatomic, strong) UITableView* headlineTable;
@property (nonatomic, strong) NSMutableArray* articles;
-(instancetype) initWithData:(NSMutableArray*)articles;

@end

NS_ASSUME_NONNULL_END

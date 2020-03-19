//
//  NewsTableViewController.h
//  newsapi
//
//  Created by Sam Mazniker on 19/03/2020.
//  Copyright © 2020 Sam Mazniker. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "Article.h"

NS_ASSUME_NONNULL_BEGIN

@interface NewsTableViewController : UIViewController

@property (nonatomic, strong) NSMutableArray* articles;
-(instancetype) initWithData:(NSMutableArray*)articles;

@end

NS_ASSUME_NONNULL_END

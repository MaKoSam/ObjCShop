//
//  NetworkManager.h
//  newsapi
//
//  Created by Sam Mazniker on 18/03/2020.
//  Copyright © 2020 Sam Mazniker. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <UIKit/UIKit.h>
#import "Article.h"

NS_ASSUME_NONNULL_BEGIN

@interface NetworkManager : NSObject

-(void)requestNewsHeadLine:(void(^)(NSMutableArray* articles))completionHandler;
-(void)requestImageAt:(NSString*)url with:(void(^)(UIImage* Image))completionHandler;


@end

NS_ASSUME_NONNULL_END

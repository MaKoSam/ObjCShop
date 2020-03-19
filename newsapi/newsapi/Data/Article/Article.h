//
//  Article.h
//  newsapi
//
//  Created by Sam Mazniker on 19/03/2020.
//  Copyright © 2020 Sam Mazniker. All rights reserved.
//

#import <Foundation/Foundation.h>

NS_ASSUME_NONNULL_BEGIN

@interface Article : NSObject

@property (nonatomic, strong) NSString* source;
@property (nonatomic, strong) NSString* author;
@property (nonatomic, strong) NSString* title;
@property (nonatomic, strong) NSString* overview; //description
@property (nonatomic, strong) NSString* url;
@property (nonatomic, strong) NSString* imageURL;
@property (nonatomic, strong) NSString* publishedAt;
@property (nonatomic, strong) NSString* content;

-(instancetype) initFromDictionary:(NSDictionary*)dictionary;
-(instancetype) initFromData:(Article*)data;

@end

NS_ASSUME_NONNULL_END

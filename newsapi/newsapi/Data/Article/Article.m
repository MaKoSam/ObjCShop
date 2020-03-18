//
//  Article.m
//  newsapi
//
//  Created by Sam Mazniker on 19/03/2020.
//  Copyright © 2020 Sam Mazniker. All rights reserved.
//

#import "Article.h"

@implementation Article

-(instancetype) initFromDictionary:(NSDictionary *)dictionary {
    self = [super init];
    NSDictionary* tmpSource = [dictionary valueForKey:@"source"];
    _source = [tmpSource valueForKey:@"name"];
    _author = [dictionary valueForKey:@"author"];
    _title = [dictionary valueForKey:@"title"];
    _overview = [dictionary valueForKey:@"description"];
    _url = [dictionary valueForKey:@"url"];
    _imageURL = [dictionary valueForKey:@"urlToImage"];
    _publishedAt = [dictionary valueForKey:@"publishedAt"];
    _content = [dictionary valueForKey:@"content"];
    return self;
}

@end

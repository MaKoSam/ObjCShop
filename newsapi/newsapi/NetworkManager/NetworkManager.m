//
//  NetworkManager.m
//
//
//  Created by Sam on 18/03/2020.
//  Copyright © 2020 Sam Mazniker. All rights reserved.
//

#import "NetworkManager.h"

@implementation NetworkManager

-(void)requestNewsHeadLine:(NSMutableArray*(^)(NSMutableArray*))completionHandler{
    NSURL* urlRequest = [NSURL URLWithString:@"https://newsapi.org/v2/top-headlines?country=us&apiKey=f3253bce1deb497c89a6647283f3d46a"];
    
    NSURLSessionDataTask* requestNewsHeadline = [[NSURLSession sharedSession] dataTaskWithURL: urlRequest completionHandler:^(NSData* data, NSURLResponse* response, NSError* error){
        NSError* erroR;
        NSDictionary* JSON = [NSJSONSerialization
                              JSONObjectWithData: data
                              options: kNilOptions
                              error: &erroR];
        NSArray* jsonArticles = [JSON objectForKey:@"articles"];
        NSMutableArray* articles = [NSMutableArray array];
        
        for(NSDictionary* items in jsonArticles) {
            Article* tmp = [[Article alloc] initFromDictionary:items];
            [articles addObject:tmp];
        }
        
        completionHandler(articles);
        
    }];
    
    [requestNewsHeadline resume];
    
}

-(void)requestImageAt:(NSString *)url with:(void (^)(UIImage * _Nonnull))completionHandler{
    NSURL* urlRequest = [NSURL URLWithString:url];
    NSURLSessionDownloadTask* downloadPhoto = [[NSURLSession sharedSession] downloadTaskWithURL:urlRequest completionHandler:^(NSURL* location, NSURLResponse* response, NSError* error) {
        UIImage* downloadedImage = [UIImage imageWithData:[NSData dataWithContentsOfURL:location]];
        completionHandler(downloadedImage);
    }];
    
    [downloadPhoto resume];
}

@end

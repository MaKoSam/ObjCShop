//
//  NetworkManager.m
//
//
//  Created by Sam on 18/03/2020.
//  Copyright © 2020 Sam Mazniker. All rights reserved.
//

#import "NetworkManager.h"

@implementation NetworkManager

-(void)requestNewsHeadLine{
    NSURL* urlRequest = [NSURL URLWithString:@"https://newsapi.org/v2/top-headlines?country=us&apiKey=f3253bce1deb497c89a6647283f3d46a"];
    
    NSURLSessionDataTask* requestNewsHeadline = [[NSURLSession sharedSession] dataTaskWithURL: urlRequest completionHandler:^(NSData* data, NSURLResponse* response, NSError* error){
        NSError* erroR;
        NSDictionary* JSON = [NSJSONSerialization
                              JSONObjectWithData: data
                              options: kNilOptions
                              error: &erroR];
        NSArray* articles = [JSON objectForKey:@"articles"];
        
        for(NSDictionary* items in articles) {
            Article* tmp = [[Article alloc] initFromDictionary:items];
            NSLog(@"ARTICLE-%@\n", tmp.author);
        }
        
    }];
    
    [requestNewsHeadline resume];
    
}

@end

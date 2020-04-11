//
//  FlightRequest.m
//  TripPlaner
//
//  Created by Sam Mazniker on 10/04/2020.
//  Copyright © 2020 Sam Mazniker. All rights reserved.
//

#import "FlightRequest.h"

@implementation FlightRequest

-(void)flightsFromSearchRequest:(SearchRequest *)request{
    NSString* stringURL = [[NSString alloc] init];
    stringURL = @"https://api.travelpayouts.com/v2/prices/latest";
    NSString* appendingURL = [self generateApiFromRequest:request];
    stringURL = [stringURL stringByAppendingString:appendingURL];
    NSLog(@"%@\n\n", stringURL);
    NSURL* urlRequest = [NSURL URLWithString: stringURL];
    
    NSURLSessionDataTask* RequestDataTask = [[NSURLSession sharedSession] dataTaskWithURL: urlRequest completionHandler:^(NSData* data, NSURLResponse* respone, NSError* error){
        NSDictionary* JSON = [NSJSONSerialization JSONObjectWithData:data options:kNilOptions error:&error];
        NSLog(@"%@", JSON);
    }];
    
    [RequestDataTask resume];
}

-(NSString*)generateApiFromRequest:(SearchRequest *)request{
    NSString* requestURL = [[NSString alloc] init];
    requestURL = @"?";
    requestURL = [requestURL stringByAppendingString:@"currency="];
    requestURL = [requestURL stringByAppendingString:request.currency];
    requestURL = [requestURL stringByAppendingString:@"&origin="];
    requestURL = [requestURL stringByAppendingString:request.origin];
    requestURL = [requestURL stringByAppendingString:@"&destination="];
    requestURL = [requestURL stringByAppendingString:request.destination];
    requestURL = [requestURL stringByAppendingString:@"&beginning_of_period="];
    requestURL = [requestURL stringByAppendingString:request.BeginPeriod];
    requestURL = [requestURL stringByAppendingString:@"-01&period_type="];
    requestURL = [requestURL stringByAppendingString:request.period_type];
    requestURL = [requestURL stringByAppendingString:@"&one_way="];
    requestURL = [requestURL stringByAppendingString:request.one_way];
    if([request.one_way isEqualToString:@"false"]){
        requestURL = [requestURL stringByAppendingString:@"&trip_duration="];
        requestURL = [requestURL stringByAppendingString:request.trip_duration];
    }
    requestURL = [requestURL stringByAppendingString:@"&limit=50"];
    requestURL = [requestURL stringByAppendingString:@"&token="];
    requestURL = [requestURL stringByAppendingString:[ActiveSession sharedInstance].apiToken];
    
    return requestURL;
}

@end

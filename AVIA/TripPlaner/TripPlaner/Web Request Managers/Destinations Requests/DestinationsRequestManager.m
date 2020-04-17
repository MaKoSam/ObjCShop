//
//  DestinationsRequestManager.m
//  TripPlaner
//
//  Created by Sam Mazniker on 07/04/2020.
//  Copyright © 2020 Sam Mazniker. All rights reserved.
//

#import "DestinationsRequestManager.h"

@implementation DestinationsRequestManager


-(void)requsetAllDestinations:(void (^)(void))completionHandler{
    [self requestCountryDestinations:^(){
        [self requestCityDestinations:^(){
            [self requestAirportDestinations:^(){
                completionHandler();
            }];
        }];
    }];
}


-(void)requestCountryDestinations:(void (^)(void))completionHandler{
    NSURL* urlRequest = [NSURL URLWithString:@"https://api.travelpayouts.com/data/ru/countries.json"];
    
    NSURLSessionDataTask* request = [[NSURLSession sharedSession] dataTaskWithURL: urlRequest completionHandler:^(NSData* data, NSURLResponse* respone, NSError* error){
        NSArray* JSON = [NSJSONSerialization JSONObjectWithData:data options:kNilOptions error:&error];
        [DestinationsManager.sharedInstance uploadDataFrom:JSON ofType:1]; //Type 1 equals Cities
        completionHandler();
    }];
    
    [request resume];
}


-(void)requestCityDestinations:(void (^)(void))completionHandler{
    NSURL* urlRequest = [NSURL URLWithString:@"https://api.travelpayouts.com/data/ru/cities.json"];
    
    NSURLSessionDataTask* request = [[NSURLSession sharedSession] dataTaskWithURL: urlRequest completionHandler:^(NSData* data, NSURLResponse* respone, NSError* error){
        NSArray* JSON = [NSJSONSerialization JSONObjectWithData:data options:kNilOptions error:&error];
        [DestinationsManager.sharedInstance uploadDataFrom:JSON ofType:2]; //Type 2 equals Cities
        completionHandler();
    }];
    
    [request resume];
}



-(void)requestAirportDestinations:(void (^)(void))completionHandler{
    NSURL* urlRequest = [NSURL URLWithString:@"https://api.travelpayouts.com/data/ru/airports.json"];
    
    NSURLSessionDataTask* request = [[NSURLSession sharedSession] dataTaskWithURL: urlRequest completionHandler:^(NSData* data, NSURLResponse* respone, NSError* error){
        NSArray* JSON = [NSJSONSerialization JSONObjectWithData:data options:kNilOptions error:&error];
        [DestinationsManager.sharedInstance uploadDataFrom:JSON ofType:3]; //Type 3 equals Airport
        completionHandler();
    }];
    
    [request resume];
}

@end

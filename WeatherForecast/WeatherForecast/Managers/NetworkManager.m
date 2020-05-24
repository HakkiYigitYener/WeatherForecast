//
//  NetworkManager.m
//  WeatherForecast
//
//  Created by Hakkı Yiğit Yener on 24.05.2020.
//  Copyright © 2020 N11.com. All rights reserved.
//

#import "NetworkManager.h"

@implementation NetworkManager

+ (instancetype)shared {
    static NetworkManager *sharedInstance = nil;
    static dispatch_once_t onceToken;
    dispatch_once(&onceToken, ^{
        sharedInstance = [[self alloc] init];
    });
    return sharedInstance;
}

@end

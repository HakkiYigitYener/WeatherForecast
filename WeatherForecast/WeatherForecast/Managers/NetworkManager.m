//
//  NetworkManager.m
//  WeatherForecast
//
//  Created by Hakkı Yiğit Yener on 24.05.2020.
//  Copyright © 2020 N11.com. All rights reserved.
//

#import "NetworkManager.h"
#import <AFNetworking/AFNetworking.h>
#import "WeatherDailyForecastResponseModel.h"

@implementation NetworkManager

NSString* baseURL = @"https://api.openweathermap.org/data/2.5/forecast/daily";
NSString* appId = @"41a47c0c4d7d86694bd472f51e33f937";

+ (instancetype)shared {
    static NetworkManager *sharedInstance = nil;
    static dispatch_once_t onceToken;
    dispatch_once(&onceToken, ^{
        sharedInstance = [[self alloc] init];
    });
    return sharedInstance;
}

-(void)getWeatherDetail:(City*)city complationHandler:(WeatherResultBlock)handler {
    NSDictionary *params = @{
        @"q":city.name,
        @"units":@"metric",
        @"lang":@"tr",
        @"cnt":[NSString stringWithFormat:@"%i",city.reportDayCount],
        @"APPID":appId
    };
    [[AFHTTPSessionManager manager] GET:baseURL
                              parameters:params
                                progress:nil
                                 success:^(NSURLSessionDataTask * _Nonnull task, id  _Nullable responseObject) {
        
        NSDictionary *responseDictionary = responseObject;
        NSError *error = nil;
        WeatherDailyForecastResponseModel *responseModel = [[WeatherDailyForecastResponseModel alloc] initWithDictionary:responseDictionary error:&error];
        
        if (error == nil)
        {
            handler(YES, responseModel, nil);
        }
        else
        {
            handler(NO, responseObject, error);
        }
        
    }
                                 failure:^(NSURLSessionDataTask * _Nullable task, NSError * _Nonnull error) {
        handler(NO, nil, error);
    }];
}

@end

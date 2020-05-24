//
//  NetworkManager.h
//  WeatherForecast
//
//  Created by Hakkı Yiğit Yener on 24.05.2020.
//  Copyright © 2020 N11.com. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "City.h"
#import "WeatherDailyForecastResponseModel.h"

typedef void(^WeatherResultBlock)(BOOL success, WeatherDailyForecastResponseModel* _Nullable  responseData, NSError * _Nullable error);

NS_ASSUME_NONNULL_BEGIN

@interface NetworkManager : NSObject
-(void)getWeatherDetail:(City*)city complationHandler:(WeatherResultBlock)handler;

+ (instancetype)shared;
@end

NS_ASSUME_NONNULL_END

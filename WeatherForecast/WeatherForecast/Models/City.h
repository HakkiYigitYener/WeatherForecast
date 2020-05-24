//
//  City.h
//  WeatherForecast
//
//  Created by Hakkı Yiğit Yener on 23.05.2020.
//  Copyright © 2020 N11.com. All rights reserved.
//

#import <Foundation/Foundation.h>

NS_ASSUME_NONNULL_BEGIN

@interface City : NSObject <NSCoding>

@property (strong,nonatomic) NSString* name;
@property (assign, nonatomic) int reportDayCount;

@end

NS_ASSUME_NONNULL_END

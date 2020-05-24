//
//  CityManager.h
//  WeatherForecast
//
//  Created by Hakkı Yiğit Yener on 24.05.2020.
//  Copyright © 2020 N11.com. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "City.h"

@protocol CityManagerDelegate <NSObject>

-(void)cityListUpdated;

@end

NS_ASSUME_NONNULL_BEGIN

@interface CityManager : NSObject

@property(weak,nullable,nonatomic) id<CityManagerDelegate> delegate;

-(NSMutableArray<City*>*)addCity:(City*)city;
-(NSMutableArray<City*>*)removeCity:(City*)city;
-(NSMutableArray<City*>*)getAllCities;

+ (instancetype)shared;

@end

NS_ASSUME_NONNULL_END

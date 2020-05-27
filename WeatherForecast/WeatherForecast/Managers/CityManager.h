//
//  CityManager.h
//  WeatherForecast
//
//  Created by Hakkı Yiğit Yener on 24.05.2020.
//  Copyright © 2020 N11.com. All rights reserved.
//

#import <Foundation/Foundation.h>

@class CitySwift;

@protocol CityManagerDelegate <NSObject>

-(void)cityListUpdated;

@end

NS_ASSUME_NONNULL_BEGIN

@interface CityManager : NSObject

@property(weak,nullable,nonatomic) id<CityManagerDelegate> delegate;

-(NSMutableArray<CitySwift*>*)addCity:(CitySwift*)city;
-(NSMutableArray<CitySwift*>*)removeCity:(CitySwift*)city;
-(NSMutableArray<CitySwift*>*)getAllCities;

+ (instancetype)shared;

@end

NS_ASSUME_NONNULL_END

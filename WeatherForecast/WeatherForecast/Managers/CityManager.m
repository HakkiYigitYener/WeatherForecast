//
//  CityManager.m
//  WeatherForecast
//
//  Created by Hakkı Yiğit Yener on 24.05.2020.
//  Copyright © 2020 N11.com. All rights reserved.
//

#import "CityManager.h"

#define CITY_LIST_KEY @"cityListKey"

@implementation CityManager

+ (instancetype)shared {
    static CityManager *sharedInstance = nil;
    static dispatch_once_t onceToken;
    dispatch_once(&onceToken, ^{
        sharedInstance = [[self alloc] init];
    });
    return sharedInstance;
}

-(NSMutableArray<City*>*)addCity:(City*)city {
    if (!city) {
        return [self getAllCities];
    }
    
    NSMutableArray<City*>* cities = [self removeCity:city];;
    
    [cities addObject:city];
    return [self saveAllCities:cities];
    
}
-(NSMutableArray<City*>*)removeCity:(City*)city {
    if (!city) {
        return [self getAllCities];
    }
    NSMutableArray<City*>* cities = [self getAllCities];
    City* cityToRemove = nil;
    for (City* item in cities) {
        if ([item.name isEqualToString:city.name]) {
            cityToRemove = item;
        }
    }
    if (cityToRemove) {
        [cities removeObject:cityToRemove];
    }
    
    return [self saveAllCities:cities];
}
-(NSMutableArray<City*>*)getAllCities {
    NSData *data = [NSUserDefaults.standardUserDefaults objectForKey:CITY_LIST_KEY];
    if (!data) {
        return [[NSMutableArray alloc] init];
    }
    NSMutableArray<City*>* cities = [NSKeyedUnarchiver unarchiveObjectWithData:data];
    
    return cities;
}
-(NSMutableArray<City*>*)saveAllCities:(NSMutableArray<City*>*)cities {
    NSUserDefaults *currentDefaults = [NSUserDefaults standardUserDefaults];
    NSData *data = [NSKeyedArchiver archivedDataWithRootObject:cities];
    [currentDefaults setObject:data forKey:CITY_LIST_KEY];
    [NSUserDefaults.standardUserDefaults synchronize];
    if ([self.delegate respondsToSelector:@selector(cityListUpdated)]) {
        [self.delegate cityListUpdated];
    }
    return [self getAllCities];
}

@end

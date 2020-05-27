//
//  CityDetailVC.h
//  WeatherForecast
//
//  Created by Hakkı Yiğit Yener on 23.05.2020.
//  Copyright © 2020 N11.com. All rights reserved.
//

#import <UIKit/UIKit.h>
@class CitySwift;

NS_ASSUME_NONNULL_BEGIN

@interface WeatherDetailVC : UIViewController

@property (nonatomic,strong) CitySwift* city;

@end

NS_ASSUME_NONNULL_END

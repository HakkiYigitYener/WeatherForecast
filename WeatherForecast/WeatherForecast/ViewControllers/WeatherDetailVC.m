//
//  CityDetailVC.m
//  WeatherForecast
//
//  Created by Hakkı Yiğit Yener on 23.05.2020.
//  Copyright © 2020 N11.com. All rights reserved.
//

#import "WeatherDetailVC.h"
#import "NetworkManager.h"

@interface WeatherDetailVC ()

@end

@implementation WeatherDetailVC

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    [self loadWeatherDetail];
    
//    UIActivityIndicatorView *indicator = [[UIActivityIndicatorView alloc]initWithActivityIndicatorStyle:UIActivityIndicatorViewStyleGray];
//    indicator.frame = CGRectMake(0.0, 0.0, 40.0, 40.0);
//    indicator.center = self.view.center;
//    [self.view addSubview:indicator];
//    [indicator bringSubviewToFront:self.view];
//    [UIApplication sharedApplication].networkActivityIndicatorVisible = TRUE;
//    [indicator startAnimating];
}

-(void)loadWeatherDetail {
    [[NetworkManager shared] getWeatherDetail:self.city
                            complationHandler:^(BOOL success, WeatherDailyForecastResponseModel * _Nullable responseData, NSError * _Nullable error) {
        
    }];
}

@end

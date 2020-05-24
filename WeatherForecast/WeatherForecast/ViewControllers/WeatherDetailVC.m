//
//  CityDetailVC.m
//  WeatherForecast
//
//  Created by Hakkı Yiğit Yener on 23.05.2020.
//  Copyright © 2020 N11.com. All rights reserved.
//

#import "WeatherDetailVC.h"
#import <AFNetworking/AFNetworking.h>

@interface WeatherDetailVC ()

@end

@implementation WeatherDetailVC

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    [self loadWeatherDetail];
}

-(void)loadWeatherDetail {
    NSString* url = @"https://api.openweathermap.org/data/2.5/forecast/daily";
    NSDictionary *params = @{
        @"q":self.city.name,
        @"units":@"metric",
        @"cnt":[NSString stringWithFormat:@"%i",self.city.reportDayCount],
        @"APPID":@"41a47c0c4d7d86694bd472f51e33f937"
    };
    [[AFHTTPSessionManager manager] GET:url
                              parameters:params
                                progress:nil
                                 success:^(NSURLSessionDataTask * _Nonnull task, id  _Nullable responseObject) {
        
    }
                                 failure:^(NSURLSessionDataTask * _Nullable task, NSError * _Nonnull error) {
        
    }];
}

/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

@end

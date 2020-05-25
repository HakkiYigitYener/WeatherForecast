//
//  WeatherDailyForecastListModel.m
//  KFOpenWeatherMapAPI
//
//  Copyright (c) 2013 Rico Becker, KF Interactive
//
//  Permission is hereby granted, free of charge, to any person obtaining a copy
//  of this software and associated documentation files (the "Software"), to deal
//  in the Software without restriction, including without limitation the rights
//  to use, copy, modify, merge, publish, distribute, sublicense, and/or sell
//  copies of the Software, and to permit persons to whom the Software is
//  furnished to do so, subject to the following conditions:
//
//  The above copyright notice and this permission notice shall be included in
//  all copies or substantial portions of the Software.
//
//  THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND, EXPRESS OR
//  IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF MERCHANTABILITY,
//  FITNESS FOR A PARTICULAR PURPOSE AND NONINFRINGEMENT. IN NO EVENT SHALL THE
//  AUTHORS OR COPYRIGHT HOLDERS BE LIABLE FOR ANY CLAIM, DAMAGES OR OTHER
//  LIABILITY, WHETHER IN AN ACTION OF CONTRACT, TORT OR OTHERWISE, ARISING FROM,
//  OUT OF OR IN CONNECTION WITH THE SOFTWARE OR THE USE OR OTHER DEALINGS IN
//  THE SOFTWARE.
//

#import "WeatherDailyForecastListModel.h"
#import "WeatherConditionModel.h"
#import "WeatherTemperatureModel.h"
#import "WeatherFeelsLikeModel.h"
#import "TitleValueModel.h"

@implementation WeatherDailyForecastListModel


+ (JSONKeyMapper *)keyMapper
{
    return [[JSONKeyMapper alloc] initWithModelToJSONDictionary:@{@"windSpeed": @"speed", @"windGust" : @"gust", @"windDeg" : @"deg", @"temperature" : @"temp", @"feelsLike":@"feels_like"}];
}

-(NSArray*)convertToPropertyArray {
    NSMutableArray* values = [[NSMutableArray alloc] init];
    
    
    for (WeatherConditionModel * condition in self.weather) {
        [values addObject:[TitleValueModel initWithTitle:@"Hava Durumu" stringValue:condition.weatherDescription]];
    }
    [values addObject:[TitleValueModel initWithTitle:@"Hava Basıncı" numberValue:self.pressure]];
    [values addObject:[TitleValueModel initWithTitle:@"Nem Oranı" numberValue:self.humidity]];
    if (self.rain) {
        [values addObject:[TitleValueModel initWithTitle:@"Yağmur Oranı" numberValue:self.rain]];
    }
    [values addObject:[TitleValueModel initWithTitle:@"Rüzgar Hızı" numberValue:self.windSpeed]];
    [values addObject:[TitleValueModel initWithTitle:@"Rüzgar Açısı" numberValue:self.windDeg]];
    [values addObject:[TitleValueModel initWithTitle:@"Gündüz Sıcaklık" numberValue:self.temperature.day]];
    [values addObject:[TitleValueModel initWithTitle:@"Gece Sıcaklık" numberValue:self.temperature.night]];
    [values addObject:[TitleValueModel initWithTitle:@"Sabah Sıcaklık" numberValue:self.temperature.morning]];
    [values addObject:[TitleValueModel initWithTitle:@"Akşam Sıcaklık" numberValue:self.temperature.eve]];
    [values addObject:[TitleValueModel initWithTitle:@"En Düşük Sıcaklık" numberValue:self.temperature.min]];
    [values addObject:[TitleValueModel initWithTitle:@"En Yüksek Sıcaklık" numberValue:self.temperature.max]];
    [values addObject:[TitleValueModel initWithTitle:@"Hissedilen Gündüz Sıcaklık" numberValue:self.feelsLike.day]];
    [values addObject:[TitleValueModel initWithTitle:@"Hissedilen Gece Sıcaklık" numberValue:self.feelsLike.night]];
    [values addObject:[TitleValueModel initWithTitle:@"Hissedilen Sabah Sıcaklık" numberValue:self.feelsLike.morning]];
    [values addObject:[TitleValueModel initWithTitle:@"Hissedilen Akşam Sıcaklık" numberValue:self.feelsLike.eve]];
    return values;
}


@end

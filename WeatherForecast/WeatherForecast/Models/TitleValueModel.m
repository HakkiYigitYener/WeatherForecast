//
//  TitleValueModel.m
//  WeatherForecast
//
//  Created by Hakkı Yiğit Yener on 25.05.2020.
//  Copyright © 2020 N11.com. All rights reserved.
//

#import "TitleValueModel.h"

@implementation TitleValueModel

-(void)setValueWithNumber:(NSNumber *)value {
    self.value = [value stringValue];
}

+(instancetype)initWithTitle:(NSString*)title stringValue:(NSString*)value {
    TitleValueModel* model = [[TitleValueModel alloc] init];
    model.title = title;
    model.value = value;
    return model;
}
+(instancetype)initWithTitle:(NSString*)title numberValue:(NSNumber*)value {
    TitleValueModel* model = [[TitleValueModel alloc] init];
    model.title = title;
    model.value = [value stringValue];
    return model;
}

@end

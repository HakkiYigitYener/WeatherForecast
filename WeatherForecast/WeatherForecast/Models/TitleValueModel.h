//
//  TitleValueModel.h
//  WeatherForecast
//
//  Created by Hakkı Yiğit Yener on 25.05.2020.
//  Copyright © 2020 N11.com. All rights reserved.
//

#import <Foundation/Foundation.h>

NS_ASSUME_NONNULL_BEGIN

@interface TitleValueModel : NSObject
@property (nonatomic, strong) NSString *title;
@property (nonatomic, strong) NSString *value;

+(instancetype)initWithTitle:(NSString*)title stringValue:(NSString*)value;
+(instancetype)initWithTitle:(NSString*)title numberValue:(NSNumber*)value;
@end

NS_ASSUME_NONNULL_END

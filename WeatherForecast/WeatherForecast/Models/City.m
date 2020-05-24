//
//  City.m
//  WeatherForecast
//
//  Created by Hakkı Yiğit Yener on 23.05.2020.
//  Copyright © 2020 N11.com. All rights reserved.
//

#import "City.h"

#define kNameKey        @"Name"
#define kDayCountKey    @"DayCount"
@implementation City

- (void)encodeWithCoder:(nonnull NSCoder *)coder {
    [coder encodeObject:self.name    forKey:kNameKey];
    [coder encodeInt:self.reportDayCount forKey:kDayCountKey];
}

- (nullable instancetype)initWithCoder:(nonnull NSCoder *)coder {
    self.name = [coder decodeObjectForKey:kNameKey];
    self.reportDayCount = [coder decodeIntForKey:kDayCountKey];
    return self;
}
@end

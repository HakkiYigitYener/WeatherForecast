//
//  WeatherDetailCell.h
//  WeatherForecast
//
//  Created by Hakkı Yiğit Yener on 25.05.2020.
//  Copyright © 2020 N11.com. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "TitleValueModel.h"

NS_ASSUME_NONNULL_BEGIN

@interface WeatherDetailCell : UITableViewCell
-(void)refreshCellWith:(TitleValueModel*)model;
@end

NS_ASSUME_NONNULL_END

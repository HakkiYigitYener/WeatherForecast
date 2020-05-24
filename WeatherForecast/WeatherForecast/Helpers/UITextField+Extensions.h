//
//  UITextField+Extensions.h
//  WeatherForecast
//
//  Created by Hakkı Yiğit Yener on 24.05.2020.
//  Copyright © 2020 N11.com. All rights reserved.
//

#import <UIKit/UIKit.h>

NS_ASSUME_NONNULL_BEGIN

@interface UITextField (Extensions)

-(UIToolbar*)addToolbarTarget:(nullable id)target action:(nullable SEL)action;
-(UIPickerView*)addPickerView:(id<UIPickerViewDelegate>)delegate dataSource:(id<UIPickerViewDataSource>)dataSource;
    
@end

NS_ASSUME_NONNULL_END

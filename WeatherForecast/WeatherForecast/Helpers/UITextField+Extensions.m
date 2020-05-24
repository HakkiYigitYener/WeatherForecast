//
//  UITextField+Extensions.m
//  WeatherForecast
//
//  Created by Hakkı Yiğit Yener on 24.05.2020.
//  Copyright © 2020 N11.com. All rights reserved.
//

#import "UITextField+Extensions.h"

@implementation UITextField (Extensions)

-(UIToolbar*)addToolbarTarget:(nullable id)target action:(nullable SEL)action{
    UIToolbar *toolbar = [[UIToolbar alloc] initWithFrame:CGRectMake(0, 0, [[UIScreen mainScreen] bounds].size.width, 44)];
    toolbar.barStyle = UIBarStyleDefault;
    
    UIBarButtonItem *doneButton = [[UIBarButtonItem alloc] initWithTitle:@"Kapat"
                                                                   style:(UIBarButtonItemStyleDone)
                                                                  target:target
                                                                  action:action];

    UIBarButtonItem *flexSpace = [[UIBarButtonItem alloc] initWithBarButtonSystemItem:UIBarButtonSystemItemFlexibleSpace target:self action:nil];
    [toolbar setItems:@[flexSpace,doneButton]];
    self.inputAccessoryView = toolbar;
    return toolbar;
}

-(UIPickerView*)addPickerView:(id<UIPickerViewDelegate>)delegate dataSource:(id<UIPickerViewDataSource>)dataSource {
    UIPickerView *picker = [[UIPickerView alloc] initWithFrame:CGRectMake(0, 00, 100, 200)];
    [picker setDelegate: delegate];
    [picker setDataSource: dataSource];
    picker.showsSelectionIndicator = YES;
    self.inputView = picker;
    return picker;
}

@end

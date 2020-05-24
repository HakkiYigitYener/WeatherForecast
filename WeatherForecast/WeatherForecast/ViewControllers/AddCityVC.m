//
//  AddCityVC.m
//  WeatherForecast
//
//  Created by Hakkı Yiğit Yener on 23.05.2020.
//  Copyright © 2020 N11.com. All rights reserved.
//

#import "AddCityVC.h"
#import "City.h"
#import "CityManager.h"
#import "UITextField+Extensions.h"
#import "UIViewController+Extensions.h"

@interface AddCityVC ()<UIPickerViewDelegate,UIPickerViewDataSource>
@property (weak, nonatomic) IBOutlet UITextField *cityNameTF;
@property (weak, nonatomic) IBOutlet UITextField *reportDayCountTF;
@property (strong, nonatomic) UIPickerView *dayPicker;

@end

@implementation AddCityVC

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    [self setupUI];
}

-(void)setupUI {
    self.dayPicker = [self.reportDayCountTF addPickerView:self
                                          dataSource:self];
    [self.cityNameTF addToolbarTarget:self
                               action:@selector(pickerDoneButtonTapped:)];
    [self.reportDayCountTF addToolbarTarget:self
                                     action:@selector(pickerDoneButtonTapped:)];
}

-(void)pickerDoneButtonTapped:(id)picker{
    [self.view endEditing:YES];
}

- (IBAction)closeButtonTouched:(id)sender {
    [self dismissViewControllerAnimated:YES
                             completion:nil];
}
- (IBAction)saveButtonTouched:(id)sender {
    [self.view endEditing:YES];
    
    if (self.cityNameTF.text.length == 0) {
        [self showAlertWithTitle:@"Uyarı"
                         message:@"Şehir adı boş olamaz."];
        return;
    }
    
    City* newCity = [[City alloc] init];
    newCity.name = self.cityNameTF.text;
    newCity.reportDayCount = [self.reportDayCountTF.text intValue];
    [[CityManager shared] addCity:newCity];
    [self dismissViewControllerAnimated:YES
                             completion:nil];
}

- (NSInteger)numberOfComponentsInPickerView:(nonnull UIPickerView *)pickerView {
    return 1;
}

- (NSInteger)pickerView:(nonnull UIPickerView *)pickerView numberOfRowsInComponent:(NSInteger)component {
    return 16;
}

-(NSString *)pickerView:(UIPickerView *)pickerView titleForRow:(NSInteger)row forComponent:(NSInteger)component {
    return [NSString stringWithFormat:@"%li",row + 1];
}

- (void)pickerView:(UIPickerView *)pickerView didSelectRow:(NSInteger)row inComponent:(NSInteger)component {
    self.reportDayCountTF.text = [NSString stringWithFormat:@"%li",row + 1];
}

- (BOOL)textFieldShouldReturn:(UITextField *)textField
{
    if (self.cityNameTF == textField) {
        [self.reportDayCountTF becomeFirstResponder];
        return NO;
    }
    return YES;
}

@end

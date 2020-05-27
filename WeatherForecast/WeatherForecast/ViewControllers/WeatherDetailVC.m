//
//  CityDetailVC.m
//  WeatherForecast
//
//  Created by Hakkı Yiğit Yener on 23.05.2020.
//  Copyright © 2020 N11.com. All rights reserved.
//

#import "WeatherDetailVC.h"
#import "NetworkManager.h"
#import "WeatherDailyForecastListModel.h"
#import "TitleValueModel.h"
#import "WeatherForecast-Swift.h"


@interface WeatherDetailVC ()<UITableViewDelegate,UITableViewDataSource>
@property (weak, nonatomic) IBOutlet UITableView *weatherTableView;
@property (nonatomic, strong) NSArray* dataSource;
@property (nonatomic, strong) WeatherDailyForecastResponseModel* response;

@end

@implementation WeatherDetailVC

- (void)viewDidLoad {
    [super viewDidLoad];
    self.title =  [NSString stringWithFormat:@"%@ Hava Durumu",self.city.name];
    [self registerCells];
    [self loadWeatherDetail];
    
}

-(void)registerCells {
    [self.weatherTableView registerNib:[UINib nibWithNibName:@"WeatherDetailCell" bundle:nil]
               forCellReuseIdentifier:@"WeatherDetailCell"];
}

-(void)loadWeatherDetail {
    [self showLoading];
    [[NetworkManager shared] getWeatherDetail:self.city
                            complationHandler:^(BOOL success, WeatherDailyForecastResponseModel * _Nullable responseData, NSError * _Nullable error) {
        [self hideLoading];
        if (success && !error) {
            self.response = responseData;
            [self createDataSource:responseData];
        }
        else {
            [self showAlertWithTitle:@"Hata"
                             message:error.localizedDescription];
        }
    }];
}

-(void)createDataSource:(WeatherDailyForecastResponseModel*)response {
    NSMutableArray* daysArray = [[NSMutableArray alloc] init];
    for (WeatherDailyForecastListModel* item in response.list) {
        [daysArray addObject:[item convertToPropertyArray]];
    }
    self.dataSource = daysArray;
    [self.weatherTableView reloadData];
}
#pragma mark - UITableView Methods
-(NSString *)tableView:(UITableView *)tableView titleForHeaderInSection:(NSInteger)section {
    WeatherDailyForecastListModel* dailyWeather = [self.response.list objectAtIndex:section];
    
    NSDateFormatter* df = [[NSDateFormatter alloc]init];
    [df setDateFormat:@"dd-MM-yyyy"];
    return [df stringFromDate:dailyWeather.dt];
}

- (nonnull UITableViewCell *)tableView:(nonnull UITableView *)tableView cellForRowAtIndexPath:(nonnull NSIndexPath *)indexPath {
    WeatherDetailCellSwift* cell =  [tableView dequeueReusableCellWithIdentifier:@"WeatherDetailCell"
                                                      forIndexPath:indexPath];
    NSArray* dayArray = [self.dataSource objectAtIndex:indexPath.section];
    TitleValueModel* rowValue = [dayArray objectAtIndex:indexPath.row];
    [cell refreshCellWith:rowValue];
    return cell;
}

- (NSInteger)tableView:(nonnull UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    NSArray* dayArray = [self.dataSource objectAtIndex:section];
    return dayArray.count;
}
- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView {
    return self.dataSource.count;
}

-(CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath {
    return 44;
}

@end

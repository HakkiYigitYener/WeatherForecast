//
//  MainVC.m
//  WeatherForecast
//
//  Created by Seda Deliorman on 30/06/16.
//  Copyright © 2016 N11.com. All rights reserved.
//

#import "MainVC.h"

#import "WeatherForecast-Swift.h"

@interface MainVC ()<UITableViewDelegate,UITableViewDataSource,CityManagerDelegate>
@property (weak, nonatomic) IBOutlet UITableView *citiesTableView;
@property (strong, nonatomic) NSArray *cityList;


@end

@implementation MainVC

- (void)viewDidLoad {
    [super viewDidLoad];
    [CityManager shared].delegate = self;
    [self registerCells];
    [self loadCities];
    [self chechkIfListEmpty];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

-(void)chechkIfListEmpty {
    if (self.cityList.count == 0) {
        [self performSegueWithIdentifier:@"AddCityVC" sender:nil];
    }
}
-(void)registerCells {
    [self.citiesTableView registerNib:[UINib nibWithNibName:@"CityCell" bundle:nil]
               forCellReuseIdentifier:@"CityCell"];
}

-(void)loadCities {
    self.cityList = [[CityManager shared] getAllCities];
    [self.citiesTableView reloadData];
}

-(void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    if ([segue.identifier isEqualToString:NSStringFromClass ([WeatherDetailVC class])]) {
        WeatherDetailVC* dest = segue.destinationViewController;
        dest.city = sender;
    }
}

#pragma mark - UITableView Methods

- (nonnull UITableViewCell *)tableView:(nonnull UITableView *)tableView cellForRowAtIndexPath:(nonnull NSIndexPath *)indexPath {
    CityCellSwift* cell =  [tableView dequeueReusableCellWithIdentifier:@"CityCell"
                                                      forIndexPath:indexPath];
    [cell refreshCellWith:[self.cityList objectAtIndex:indexPath.row]];
    return cell;
}

- (NSInteger)tableView:(nonnull UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    return self.cityList.count;
}
-(void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath {
    [self performSegueWithIdentifier:@"WeatherDetailVC" sender:[self.cityList objectAtIndex:indexPath.row]];
}

-(void)tableView:(UITableView *)tableView commitEditingStyle:(UITableViewCellEditingStyle)editingStyle forRowAtIndexPath:(NSIndexPath *)indexPath {
    City* city = [self.cityList objectAtIndex:indexPath.row];
    [[CityManager shared] removeCity:city];
}

#pragma mark - CityManagerDelegate Methods
- (void)cityListUpdated {
    [self loadCities];
}


@end

//
//  MainVC.m
//  WeatherForecast
//
//  Created by Seda Deliorman on 30/06/16.
//  Copyright © 2016 N11.com. All rights reserved.
//

#import "MainVC.h"
#import "City.h"
#import "CityCell.h"
#import "WeatherDetailVC.h"
#import "CityManager.h"

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
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

-(void)registerCells {
    [self.citiesTableView registerNib:[UINib nibWithNibName:NSStringFromClass ([CityCell class]) bundle:nil]
               forCellReuseIdentifier:NSStringFromClass ([CityCell class])];
}

-(void)loadCities {
    self.cityList = [[CityManager shared] getAllCities];
    [self.citiesTableView reloadData];
}

-(void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    if ([segue.identifier isEqualToString:@"WeatherDetailVC"]) {
        WeatherDetailVC* dest = segue.destinationViewController;
        dest.city = sender;
    }
}

#pragma mark - UITableView Merhods

- (nonnull UITableViewCell *)tableView:(nonnull UITableView *)tableView cellForRowAtIndexPath:(nonnull NSIndexPath *)indexPath {
    CityCell* cell =  [tableView dequeueReusableCellWithIdentifier:NSStringFromClass ([CityCell class])
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

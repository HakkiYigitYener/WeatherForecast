//
//  CityCell.m
//  WeatherForecast
//
//  Created by Hakkı Yiğit Yener on 23.05.2020.
//  Copyright © 2020 N11.com. All rights reserved.
//

#import "CityCell.h"

@interface CityCell()
@property (weak, nonatomic) IBOutlet UILabel *cityNameLabel;
@end

@implementation CityCell

- (void)awakeFromNib {
    [super awakeFromNib];
    // Initialization code
}

- (void)setSelected:(BOOL)selected animated:(BOOL)animated {
    [super setSelected:selected animated:animated];

    // Configure the view for the selected state
}

-(void)refreshCellWith:(City*)city {
    self.cityNameLabel.text = [NSString stringWithFormat:@"%@ şehrinin %i günlük hava durumu", city.name, city.reportDayCount];
}

@end

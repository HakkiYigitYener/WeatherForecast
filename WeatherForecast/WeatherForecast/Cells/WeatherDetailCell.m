//
//  WeatherDetailCell.m
//  WeatherForecast
//
//  Created by Hakkı Yiğit Yener on 25.05.2020.
//  Copyright © 2020 N11.com. All rights reserved.
//

#import "WeatherDetailCell.h"
@interface WeatherDetailCell()
@property (weak, nonatomic) IBOutlet UILabel *titleLabel;
@property (weak, nonatomic) IBOutlet UILabel *valueLabel;

@end

@implementation WeatherDetailCell

- (void)awakeFromNib {
    [super awakeFromNib];
    // Initialization code
}

- (void)setSelected:(BOOL)selected animated:(BOOL)animated {
    [super setSelected:selected animated:animated];

    // Configure the view for the selected state
}
-(void)refreshCellWith:(TitleValueModel*)model{
    self.titleLabel.text = model.title;
    self.valueLabel.text = model.value;
}

@end

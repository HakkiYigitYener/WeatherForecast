//
//  CityCellSwift.swift
//  WeatherForecast
//
//  Created by Hakkı Yiğit Yener on 27.05.2020.
//  Copyright © 2020 N11.com. All rights reserved.
//

import UIKit

class CityCellSwift: UITableViewCell {
    @IBOutlet weak var cityNameLabel: UILabel!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    @objc func refreshCell(with city:City?) {
        cityNameLabel.text = "\(city?.name ?? "") şehrinin \(city?.reportDayCount ?? 0) günlük hava durumu"
    }
}

//
//  WeatherDetailCellSwift.swift
//  WeatherForecast
//
//  Created by Hakkı Yiğit Yener on 27.05.2020.
//  Copyright © 2020 N11.com. All rights reserved.
//

import UIKit

class WeatherDetailCellSwift: UITableViewCell {
    @IBOutlet weak var titleLabel: UILabel!
    @IBOutlet weak var valueLabel: UILabel!

    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    @objc func refreshCell(with model:TitleValueModel?) {
        titleLabel.text = model?.title ?? ""
        valueLabel.text = model?.value ?? ""
    }

}

//
//  Constants.swift
//  WeatherForecast
//
//  Created by Hakkı Yiğit Yener on 28.05.2020.
//  Copyright © 2020 N11.com. All rights reserved.
//

import Foundation

@objcMembers class Constants:NSObject {
    
    static let baseURL = "https://api.openweathermap.org/data/2.5/forecast/daily"
    static let appId = "41a47c0c4d7d86694bd472f51e33f937"
    
    static let weatherDetailVCSegue = "WeatherDetailVC"
    static let addCityVCSegue = "AddCityVC"
    
    static let cityCellIdentifier = "CityCell"
    static let weatherDetailCellIdentifier = "WeatherDetailCell"
    
    static let errorTitle = "Hata"
    static let warningTitle = "Uyarı"
    static let emptyCityNameInputMessage = "Şehir adı boş olamaz."
    static let okay = "Tamam"
    static let close = "Kapat"
    
    static let dayFormat = "dd-MM-yyyy"
    
}


//
//  WeatherCityModelSwift.swift
//  WeatherForecast
//
//  Created by Hakkı Yiğit Yener on 27.05.2020.
//  Copyright © 2020 N11.com. All rights reserved.
//

import Foundation
import JSONModel

///  A collection of information about a city.
class WeatherCityModel: JSONModel {
    ///  The OpenWeatherMap city id.
    var cityId: NSNumber?
    ///  The name of the city.
    var cityName: String?
    ///  The geo location of the city.
    var coord: WeatherCoordinateModelSwift?
    ///  The country assigned to the city.
    var country: String?
    ///  The number of inhabitants.
    var population = 0
    
    override class func keyMapper() -> JSONKeyMapper? {
        return JSONKeyMapper(modelToJSONDictionary: [
            "cityId": "id",
            "cityName": "name"
        ])
    }
}

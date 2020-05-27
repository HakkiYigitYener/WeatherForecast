// This file was generated from JSON Schema using quicktype, do not modify it directly.
// To parse the JSON, add this file to your project and do:
//
//   let weatherDailyForecastResponseModel = try? newJSONDecoder().decode(WeatherDailyForecastResponseModel.self, from: jsonData)

import Foundation

// MARK: - WeatherDailyForecastResponseModel
@objcMembers class WeatherDailyForecastResponseModel: NSObject, Codable {
    let city: WeatherCity
    let cod: String
    let message: Double
    let cnt: Int
    let list: [WeatherDailyForecastListModel]

    init(city: WeatherCity, cod: String, message: Double, cnt: Int, list: [WeatherDailyForecastListModel]) {
        self.city = city
        self.cod = cod
        self.message = message
        self.cnt = cnt
        self.list = list
    }
}

// This file was generated from JSON Schema using quicktype, do not modify it directly.
// To parse the JSON, add this file to your project and do:
//
//   let list = try? newJSONDecoder().decode(List.self, from: jsonData)

import Foundation

// MARK: - List
@objcMembers class WeatherDailyForecastListModel: NSObject,Codable {
    let dt, sunrise, sunset: Int
    let temp: WeatherTemp
    let feelsLike: WeatherFeelsLike
    let pressure, humidity: Int
    let weather: [WeatherCondition]
    let speed: Double
    let deg, clouds: Int
    let rain: Double?

    enum CodingKeys: String, CodingKey {
        case dt, sunrise, sunset, temp, pressure, humidity, weather, speed, deg, clouds, rain
        case feelsLike = "feels_like"
    }

    init(dt: Int, sunrise: Int, sunset: Int, temp: WeatherTemp, feelsLike: WeatherFeelsLike, pressure: Int, humidity: Int, weather: [WeatherCondition], speed: Double, deg: Int, clouds: Int, rain: Double?) {
        self.dt = dt
        self.sunrise = sunrise
        self.sunset = sunset
        self.temp = temp
        self.feelsLike = feelsLike
        self.pressure = pressure
        self.humidity = humidity
        self.weather = weather
        self.speed = speed
        self.deg = deg
        self.clouds = clouds
        self.rain = rain
    }
}

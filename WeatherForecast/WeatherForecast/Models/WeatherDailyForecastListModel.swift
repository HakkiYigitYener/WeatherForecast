// This file was generated from JSON Schema using quicktype, do not modify it directly.
// To parse the JSON, add this file to your project and do:
//
//   let list = try? newJSONDecoder().decode(List.self, from: jsonData)

import Foundation

// MARK: - List
@objcMembers class WeatherDailyForecastListModel: NSObject,Codable {
    let dt: Double
    let sunrise, sunset: Int
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

    init(dt: Double, sunrise: Int, sunset: Int, temp: WeatherTemp, feelsLike: WeatherFeelsLike, pressure: Int, humidity: Int, weather: [WeatherCondition], speed: Double, deg: Int, clouds: Int, rain: Double?) {
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
    func convertToPropertyArray() -> [TitleValueModel] {
        var values: [TitleValueModel] = []


        for condition in weather {
            values.append(TitleValueModel(title: "Hava Durumu", stringValue: condition.weatherDescription))
        }
        values.append(TitleValueModel(title: "Hava Basıncı", numberValue: NSNumber(value: pressure)))
        values.append(TitleValueModel(title: "Nem Oranı", numberValue: NSNumber(value: humidity)))
        if let rain = rain {
            values.append(TitleValueModel(title: "Yağmur Oranı", numberValue: NSNumber(value: rain)))
        }
        values.append(TitleValueModel(title: "Rüzgar Hızı", numberValue: NSNumber(value: speed)))
        values.append(TitleValueModel(title: "Rüzgar Açısı", numberValue: NSNumber(value: deg)))
        values.append(TitleValueModel(title: "Gündüz Sıcaklık", numberValue: NSNumber(value: temp.day)))
        values.append(TitleValueModel(title: "Gece Sıcaklık", numberValue: NSNumber(value: temp.night)))
        values.append(TitleValueModel(title: "Sabah Sıcaklık", numberValue: NSNumber(value: temp.morn)))
        values.append(TitleValueModel(title: "Akşam Sıcaklık", numberValue: NSNumber(value: temp.eve)))
        values.append(TitleValueModel(title: "En Düşük Sıcaklık", numberValue: NSNumber(value: temp.min)))
        values.append(TitleValueModel(title: "En Yüksek Sıcaklık", numberValue: NSNumber(value: temp.max)))
        values.append(TitleValueModel(title: "Hissedilen Gündüz Sıcaklık", numberValue: NSNumber(value: feelsLike.day)))
        values.append(TitleValueModel(title: "Hissedilen Gece Sıcaklık", numberValue: NSNumber(value: feelsLike.night)))
        values.append(TitleValueModel(title: "Hissedilen Sabah Sıcaklık", numberValue: NSNumber(value: feelsLike.morn)))
        values.append(TitleValueModel(title: "Hissedilen Akşam Sıcaklık", numberValue: NSNumber(value: feelsLike.eve)))
        return values
    }
}

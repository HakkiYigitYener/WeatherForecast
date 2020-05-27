// This file was generated from JSON Schema using quicktype, do not modify it directly.
// To parse the JSON, add this file to your project and do:
//
//   let feelsLike = try? newJSONDecoder().decode(FeelsLike.self, from: jsonData)

import Foundation

// MARK: - FeelsLike
class WeatherFeelsLike: Codable {
    let day, night, eve, morn: Double

    init(day: Double, night: Double, eve: Double, morn: Double) {
        self.day = day
        self.night = night
        self.eve = eve
        self.morn = morn
    }
}

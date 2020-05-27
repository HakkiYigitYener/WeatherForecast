// This file was generated from JSON Schema using quicktype, do not modify it directly.
// To parse the JSON, add this file to your project and do:
//
//   let temp = try? newJSONDecoder().decode(Temp.self, from: jsonData)

import Foundation

// MARK: - Temp
class WeatherTemp: Codable {
    let day, min, max, night: Double
    let eve, morn: Double

    init(day: Double, min: Double, max: Double, night: Double, eve: Double, morn: Double) {
        self.day = day
        self.min = min
        self.max = max
        self.night = night
        self.eve = eve
        self.morn = morn
    }
}

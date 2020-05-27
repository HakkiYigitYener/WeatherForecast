// This file was generated from JSON Schema using quicktype, do not modify it directly.
// To parse the JSON, add this file to your project and do:
//
//   let weather = try? newJSONDecoder().decode(Weather.self, from: jsonData)

import Foundation

// MARK: - Weather
class WeatherCondition: Codable {
    let id: Int
    let main, weatherDescription, icon: String

    enum CodingKeys: String, CodingKey {
        case id, main, icon
        case weatherDescription = "description"
    }

    init(id: Int, main: String, weatherDescription: String, icon: String) {
        self.id = id
        self.main = main
        self.weatherDescription = weatherDescription
        self.icon = icon
    }
}

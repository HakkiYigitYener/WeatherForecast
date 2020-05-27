// This file was generated from JSON Schema using quicktype, do not modify it directly.
// To parse the JSON, add this file to your project and do:
//
//   let city = try? newJSONDecoder().decode(City.self, from: jsonData)

import Foundation

// MARK: - City
class WeatherCity: Codable {
    let id: Int
    let name: String
    let coord: WeatherCoord
    let country: String
    let population, timezone: Int

    init(id: Int, name: String, coord: WeatherCoord, country: String, population: Int, timezone: Int) {
        self.id = id
        self.name = name
        self.coord = coord
        self.country = country
        self.population = population
        self.timezone = timezone
    }
}

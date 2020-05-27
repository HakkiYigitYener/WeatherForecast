// This file was generated from JSON Schema using quicktype, do not modify it directly.
// To parse the JSON, add this file to your project and do:
//
//   let coord = try? newJSONDecoder().decode(Coord.self, from: jsonData)

import Foundation

// MARK: - Coord
class WeatherCoord: Codable {
    let lon, lat: Double

    init(lon: Double, lat: Double) {
        self.lon = lon
        self.lat = lat
    }
}

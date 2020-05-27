
//
//  WeatherCoordinateModelSSwift.swift
//  WeatherForecast
//
//  Created by Hakkı Yiğit Yener on 27.05.2020.
//  Copyright © 2020 N11.com. All rights reserved.
//

import Foundation
import JSONModel
import CoreLocation

class WeatherCoordinateModelSwift: JSONModel {
    ///  The latutide for the location.
    var latitude: CLLocationDegrees = 0
    ///  The longitude for the location.
    var longitude: CLLocationDegrees = 0
    
    override class func keyMapper() -> JSONKeyMapper? {
        return JSONKeyMapper(modelToJSONDictionary: [
            "latitude": "lat",
            "longitude": "lon"
        ])
    }


    ///  Converts the data of this model into an CoreLocation coordinate
    ///
    ///  - Returns: The location as a CoreLocation struct.
    func locationCoordinate() -> CLLocationCoordinate2D {
       return CLLocationCoordinate2D(latitude: latitude, longitude: longitude)
    }
}

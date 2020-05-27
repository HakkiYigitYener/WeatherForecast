//
//  CityManagerSwift.swift
//  WeatherForecast
//
//  Created by Hakkı Yiğit Yener on 27.05.2020.
//  Copyright © 2020 N11.com. All rights reserved.
//

import UIKit

@objc protocol CityManagerDelegate: NSObjectProtocol {
    func cityListUpdated()
}

class CityManagerSwift: NSObject {
    @objc weak var delegate: CityManagerDelegate?
    
    @objc static var shared: CityManagerSwift = {
        var shared = CityManagerSwift.init()
        return shared
    }()

    @objc func addCity(_ city: CitySwift?) -> [CitySwift] {
        if city == nil {
            return getAllCities()
        }

        var cities = removeCity(city)

        if let city = city {
            cities.append(city)
        }
        return saveAllCities(cities)

    }

    @objc func removeCity(_ city: CitySwift?) -> [CitySwift] {
        if city == nil {
            return getAllCities()
        }
        var cities = getAllCities()
        var cityToRemove: CitySwift? = nil
        for item in cities {
            if (item.name == city?.name) {
                cityToRemove = item
            }
        }
        if cityToRemove != nil {
            cities.removeAll { $0 as AnyObject === cityToRemove as AnyObject }
        }

        return saveAllCities(cities)
    }
    @objc func getAllCities() -> [CitySwift] {
        let data = UserDefaults.standard.object(forKey: "cityListKey") as? Data
        if data == nil {
            return []
        }
        var cities: [CitySwift]? = nil
        if let data = data {
            cities = NSKeyedUnarchiver.unarchiveObject(with: data) as? [CitySwift]
        }
        if cities == nil {
            cities = []
        }

        return cities!
    }

    @objc func saveAllCities(_ cities: [CitySwift]) -> [CitySwift] {
        let currentDefaults = UserDefaults.standard
        let data = NSKeyedArchiver.archivedData(withRootObject: cities)
        currentDefaults.set(data, forKey: "cityListKey")
        UserDefaults.standard.synchronize()
        delegate?.cityListUpdated()
        return getAllCities()
    }


}

//
//  NetworkManagerSwift.swift
//  WeatherForecast
//
//  Created by Hakkı Yiğit Yener on 27.05.2020.
//  Copyright © 2020 N11.com. All rights reserved.
//

import Foundation
typealias WeatherResultBlock = (Bool, WeatherDailyForecastResponseModel?, Error?) -> Void

var baseURL = "https://api.openweathermap.org/data/2.5/forecast/daily"
var appId = "41a47c0c4d7d86694bd472f51e33f937"

class NetworkManager:NSObject {
    @objc static var shared: NetworkManager = {
        var shared = NetworkManager.init()
        return shared
    }()
    
    
    
    @objc func getWeatherDetail(_ city: City?,  complationHandler  handler: WeatherResultBlock) {
        
//        var params: [String : Any?]? = nil
//    if let name = city?.name, let reportDayCount = city?.reportDayCount {
//        params = [
//            "q": name,
//            "units": "metric",
//            "lang": "tr",
//            "cnt": String(format: "%i", reportDayCount),
//            "APPID": appId
//        ]
//    }
//        AFHTTPSessionManager().get(
//        baseURL,
//        parameters: params,
//        progress: nil,
//        success: { task, responseObject in
//            
//            let weatherDailyForecastResponseModel = try? newJSONDecoder().decode(WeatherDailyForecastResponseModel.self, from: responseObject)
//
//            let responseDictionary = responseObject as? [AnyHashable : Any]
//            var error: Error? = nil
//            var responseModel: WeatherDailyForecastResponseModel? = nil
//            do {
//                    responseModel = try WeatherDailyForecastResponseModel(dictionary: responseDictionary)
//                
//            } catch {
//            }
//
//            if error == nil {
//                handler(true, responseModel, nil)
//            } else {
//                handler(false, responseObject as! WeatherDailyForecastResponseModel, error)
//            }
//
//        },
//        failure: { task, error in
//            handler(false, nil, error)
//        })
    }
}

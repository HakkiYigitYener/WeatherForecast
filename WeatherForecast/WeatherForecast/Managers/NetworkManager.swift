//
//  NetworkManagerSwift.swift
//  WeatherForecast
//
//  Created by Hakkı Yiğit Yener on 27.05.2020.
//  Copyright © 2020 N11.com. All rights reserved.
//

import Foundation
typealias WeatherResultBlock = (Bool, Any?, Error?) -> Void

class NetworkManager:NSObject {
    @objc static var shared: NetworkManager = {
        var shared = NetworkManager.init()
        return shared
    }()
    
    func getWeatherDetail(_ city: City?, complationHandler  handler: @escaping WeatherResultBlock) {
        
    var params: [String : Any?]? = nil
    if let name = city?.name, let reportDayCount = city?.reportDayCount {
        params = [
            "q": name,
            "units": "metric",
            "lang": "tr",
            "cnt": String(format: "%i", reportDayCount),
            "APPID": Constants.appId
        ]
    }
        AFHTTPSessionManager().get(
            Constants.baseURL,
        parameters: params,
        progress: nil,
        success: { task, responseObject in

            if task.error == nil {
                let dataJson = try! JSONSerialization.data(withJSONObject: responseObject as Any, options: JSONSerialization.WritingOptions.prettyPrinted)
                let responseModel = try? JSONDecoder().decode(WeatherDailyForecastResponseModel.self, from: dataJson)
                handler(true, responseModel, nil)
            } else {
                handler(false, responseObject, task.error)
            }

        },
        failure: { task, error in
            handler(false, nil, error)
        })
    }
}

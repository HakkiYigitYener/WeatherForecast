//
//  CitySwift.swift
//  WeatherForecast
//
//  Created by Hakkı Yiğit Yener on 27.05.2020.
//  Copyright © 2020 N11.com. All rights reserved.
//

import UIKit

public class City: NSObject,NSCoding {
    @objc public var name: String? = nil
    @objc public var reportDayCount: Int32 = 0
    
    @objc public override init() {
        
    }
    required public init?(coder: NSCoder) {
        name = coder.decodeObject(forKey: "name") as? String
        reportDayCount = coder.decodeInt32(forKey: "reportDayCount")
    }
    
    public func encode(with coder: NSCoder) {
        coder.encode(name, forKey: "name")
        coder.encode(reportDayCount, forKey: "reportDayCount")
    }
    
    


}

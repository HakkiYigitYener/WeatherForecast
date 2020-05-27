//
//  TitleValueModelSwift.swift
//  WeatherForecast
//
//  Created by Hakkı Yiğit Yener on 27.05.2020.
//  Copyright © 2020 N11.com. All rights reserved.
//

import Foundation
class TitleValueModel: NSObject {
    var title: String?
    var value: String?

    func setValueWith(_ value: NSNumber?) {
        self.value = value?.stringValue ?? ""
    }
    init(title:String, stringValue value: String?) {
        self.title = title
        self.value = value
    }
    init(title:String, numberValue value: NSNumber?) {
        self.title = title
        self.value = value?.stringValue ?? ""
    }

}

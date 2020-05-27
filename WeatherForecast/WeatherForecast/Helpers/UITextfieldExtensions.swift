//
//  UITextfieldExtensions.swift
//  WeatherForecast
//
//  Created by Hakkı Yiğit Yener on 27.05.2020.
//  Copyright © 2020 N11.com. All rights reserved.
//

import UIKit

extension UITextField {
    @objc func addToolbar(_ target:Any?, action:Selector?) -> UIToolbar {
        let toolbar = UIToolbar.init(frame: CGRect(x: 0,y: 0,width: UIScreen.main.bounds.size.width,height: 44))
        toolbar.barStyle = .default
        let doneButton = UIBarButtonItem.init(title: Constants.close,
                                              style: .done,
                                              target: target,
                                              action: action)
        let flexSpace = UIBarButtonItem.init(barButtonSystemItem: .flexibleSpace,
                                             target: nil,
                                             action: nil)
        toolbar.setItems([flexSpace,doneButton], animated: false)
        inputAccessoryView = toolbar
        return toolbar
    }
    @objc func addPickerView(_ delegate: UIPickerViewDelegate?, dataSource: UIPickerViewDataSource?) -> UIPickerView {
        let picker = UIPickerView(frame: CGRect(x: 0, y: 0, width: UIScreen.main.bounds.size.width, height: 200))
        picker.delegate = delegate
        picker.dataSource = dataSource
        picker.showsSelectionIndicator = true
        inputView = picker
        return picker
    }
}


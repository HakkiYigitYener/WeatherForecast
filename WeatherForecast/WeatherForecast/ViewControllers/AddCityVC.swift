//
//  AddCity.swift
//  WeatherForecast
//
//  Created by Hakkı Yiğit Yener on 27.05.2020.
//  Copyright © 2020 N11.com. All rights reserved.
//

import UIKit

class AddCityVC:UIViewController, UIPickerViewDelegate, UIPickerViewDataSource {
    
    @IBOutlet private weak var cityNameTF: UITextField!
    @IBOutlet private weak var reportDayCountTF: UITextField!
    private var dayPicker: UIPickerView?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        setupUI()
    }

    func setupUI() {
        dayPicker = reportDayCountTF.addPickerView(
            self,
            dataSource: self)

        _ = cityNameTF.addToolbar(
            self,
            action: #selector(toolbarDoneButtonTapped(_:)))
        _ = reportDayCountTF.addToolbar(
            self,
            action: #selector(toolbarDoneButtonTapped))
    }
// MARK: - Action Methods
    @objc func toolbarDoneButtonTapped(_ picker: Any?) {
        view.endEditing(true)
    }

    @IBAction func closeButtonTouched(_ sender: Any) {
        dismiss(
            animated: true)
    }

    @IBAction func saveButtonTouched(_ sender: Any) {
        view.endEditing(true)

        if cityNameTF.text?.count == 0 {
            showAlert(
                withTitle: "Uyarı",
                message: "Şehir adı boş olamaz.")
            return
        }

        let newCity = City()
        newCity.name = cityNameTF.text
        newCity.reportDayCount = Int32.init(reportDayCountTF.text ?? "0")!
        _ = CityManager.shared.addCity(newCity)
        dismiss(
            animated: true)
    }
// MARK: - UIPickerView Methods
    func numberOfComponents(in pickerView: UIPickerView) -> Int {
        return 1
    }

    func pickerView(_ pickerView: UIPickerView, numberOfRowsInComponent component: Int) -> Int {
        return 16
    }

    func pickerView(_ pickerView: UIPickerView, titleForRow row: Int, forComponent component: Int) -> String? {
        return String(format: "%li", row + 1)
    }

    func pickerView(_ pickerView: UIPickerView, didSelectRow row: Int, inComponent component: Int) {
        reportDayCountTF.text = String(format: "%li", row + 1)
    }
// MARK: - UITextfield Methods
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        if cityNameTF == textField {
            reportDayCountTF.becomeFirstResponder()
            return false
        }
        return true
    }
}

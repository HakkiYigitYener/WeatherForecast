//
//  WeatherDetailVC.swift
//  WeatherForecast
//
//  Created by Hakkı Yiğit Yener on 27.05.2020.
//  Copyright © 2020 N11.com. All rights reserved.
//

import Foundation


class WeatherDetailVC: BaseVC, UITableViewDelegate, UITableViewDataSource {
    @IBOutlet private weak var weatherTableView: UITableView!
    @objc var city: City?
    private var dataSource: [[TitleValueModel]]?
    private var response: WeatherDailyForecastResponseModel?

    override func viewDidLoad() {
        super.viewDidLoad()
        title = "\(city?.name ?? "") Hava Durumu"
        registerCells()
        loadWeatherDetail()

    }

    func registerCells() {
        weatherTableView.register(
            UINib(nibName: Constants.weatherDetailCellIdentifier, bundle: nil),
            forCellReuseIdentifier: Constants.weatherDetailCellIdentifier)
    }
    func loadWeatherDetail() {
        showLoading()
        NetworkManager.shared.getWeatherDetail(
            city,
            complationHandler: { success, responseData, error in
                self.hideLoading()
                if success && error == nil {
                    self.response = responseData as? WeatherDailyForecastResponseModel
                    self.createDataSource((responseData as! WeatherDailyForecastResponseModel))
                } else {
                    self.showAlert(
                        withTitle: "Hata",
                        message: error?.localizedDescription)
                }
            })
    }
    func createDataSource(_ response: WeatherDailyForecastResponseModel?) {
        var daysArray: [[TitleValueModel]] = []
        if let list = response?.list {
            for item in list {
                daysArray.append(item.convertToPropertyArray())
            }
        }
        dataSource = daysArray
        weatherTableView.reloadData()
    }
// MARK: - UITableView Methods
    func tableView(_ tableView: UITableView, titleForHeaderInSection section: Int) -> String? {
        let dailyWeather = response?.list[section]
        let date = Date(timeIntervalSince1970:dailyWeather?.dt ?? 0)
        let df = DateFormatter()
        df.dateFormat = Constants.dayFormat
        return df.string(from: date)
    }

    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(
            withIdentifier: Constants.weatherDetailCellIdentifier,
            for: indexPath) as? WeatherDetailCellSwift
        let dayArray = dataSource?[indexPath.section]
        let rowValue = dayArray?[indexPath.row]
        cell?.refreshCell(with: rowValue)
        return cell!
    }
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        let dayArray = dataSource?[section]
        return dayArray?.count ?? 0
    }

    func numberOfSections(in tableView: UITableView) -> Int {
        return dataSource?.count ?? 0
    }

    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 44
    }

}

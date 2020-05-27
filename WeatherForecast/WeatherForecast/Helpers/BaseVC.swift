//
//  BaseVC.swift
//  WeatherForecast
//
//  Created by Hakkı Yiğit Yener on 28.05.2020.
//  Copyright © 2020 N11.com. All rights reserved.
//

import UIKit

class BaseVC: UIViewController {
    var alertController: Any? = nil
    var indicator: UIActivityIndicatorView? = nil
    

     func showAlert(withTitle title: String?, message: String?) {
     if #available(iOS 8.0, *) {
         alertController = UIAlertController(
             title: title,
             message: message,
             preferredStyle: .alert)
         let closeAction = UIAlertAction(
             title: Constants.okay,
             style: .default,
             handler: nil)
         (alertController as! UIAlertController).addAction(closeAction)
             present(
                 (alertController as! UIAlertController),
                 animated: true)
         
     }
     else {
         UIAlertView.init(title: title,
                          message: message,
                          delegate: nil,
                          cancelButtonTitle: Constants.okay).show()
        }
         
     }
     
     func showLoading() {
        if indicator == nil {
            indicator = UIActivityIndicatorView(style: .gray)
            indicator!.frame = CGRect(x: 0.0, y: 0.0, width: 40.0, height: 40.0)
            indicator!.center = view.center
            view.addSubview(indicator!)
            indicator!.bringSubviewToFront(view)
            UIApplication.shared.isNetworkActivityIndicatorVisible = true
            indicator?.hidesWhenStopped = true
        }
         indicator!.startAnimating()
     }

     func hideLoading() {
         indicator!.stopAnimating()
     }

}

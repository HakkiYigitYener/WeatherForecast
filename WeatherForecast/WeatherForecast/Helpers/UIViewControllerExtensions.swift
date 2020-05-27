//
//  UIViewControllerExtensions.swift
//  WeatherForecast
//
//  Created by Hakkı Yiğit Yener on 27.05.2020.
//  Copyright © 2020 N11.com. All rights reserved.
//

import UIKit

@available(iOS 8.0, *)
var alertController: UIAlertController? = nil
var indicator: UIActivityIndicatorView? = nil

extension UIViewController {
    
    @available(iOS 8.0, *)
   @objc func showAlert(withTitle title: String?, message: String?) {
        alertController = UIAlertController(
            title: title,
            message: message,
            preferredStyle: .alert)
        let closeAction = UIAlertAction(
            title: "Tamam",
            style: .default,
            handler: nil)
        alertController?.addAction(closeAction)
        if let alertController = alertController {
            present(
                alertController,
                animated: true)
        }
    }
    
    @objc func showLoading() {
            indicator = UIActivityIndicatorView(style: .gray)
            indicator!.frame = CGRect(x: 0.0, y: 0.0, width: 40.0, height: 40.0)
            indicator!.center = view.center
            view.addSubview(indicator!)
            indicator!.bringSubviewToFront(view)
            UIApplication.shared.isNetworkActivityIndicatorVisible = true
            indicator?.hidesWhenStopped = true
        indicator!.startAnimating()
    }

    @objc func hideLoading() {
        indicator!.stopAnimating()
    }
}




//
//  UIViewController+Demo.swift
//  Demo
//
//  Created by Mert Serin on 2021-10-06.
//  Copyright © 2021 Bambuser AB. All rights reserved.
//

import UIKit

extension UIAlertController {

    class func show(title: String, message: String, from controller: UIViewController) {
        let alert = UIAlertController(title: title, message: message, preferredStyle: .alert)
        alert.addAction(UIAlertAction(title: "OK", style: .default))
        controller.present(alert, animated: true, completion: nil)
    }
}

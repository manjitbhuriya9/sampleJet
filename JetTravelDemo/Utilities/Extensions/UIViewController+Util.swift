//
//  UIViewController+Util.swift
//  JetTravelDemo
//
//  Created by Organization on 06/07/20.
//  Copyright © 2020 Organization. All rights reserved.
//

import UIKit


extension UIViewController {
    func showError(_ title: String?, message: String) {
        let alertController = UIAlertController(title: title,
                                                message: message,
                                                preferredStyle: .alert)
        let OKAction = UIAlertAction(title: "OK", style: .default, handler: nil)
        alertController.addAction(OKAction)
        present(alertController, animated: true, completion: nil)
    }
}

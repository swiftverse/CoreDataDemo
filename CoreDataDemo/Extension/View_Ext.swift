//
//  View_Ext.swift
//  CoreDataDemo
//
//  Created by Muflis on 09/03/21.
//

import Foundation
import UIKit

extension UIViewController {
    func showAlert(with firstMsg: String, for secondMsg: String) {
        let alertControl = UIAlertController(title: firstMsg, message: secondMsg, preferredStyle: .alert)
        let alertAction = UIAlertAction(title: "Ok", style: .cancel, handler: nil)
        alertControl.addAction(alertAction)
        present(alertControl, animated: true, completion: nil)
    }
}

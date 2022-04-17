//
//  ViewControllerExtension.swift
//  StoreMvvm
//
//  Created by Ahmed Amer on 15/04/2022.
//

import UIKit

enum MultiButtonSelection {
    case didSelectedLeftButton
    case didSelectedRightButton
}

extension UIViewController {
    
    func showSingleButtonError(title: String, errorText: String, errorButtonTitle: String){
        let alertController = UIAlertController(title: title, message: errorText, preferredStyle: .alert)
        let action = UIAlertAction(title: errorButtonTitle, style: UIAlertAction.Style.default, handler: nil)
        alertController.addAction(action)
        present(alertController, animated: true, completion: nil)
    }
    func showMultiButtonError(title: String,errorText: String, leftButtonTitle: String, rightButtonTitle: String, completion: @escaping((_ selection: MultiButtonSelection) -> ()) ) {
        let alertController = UIAlertController(title: title, message: errorText, preferredStyle: .alert)
        let action1 = UIAlertAction(title: leftButtonTitle, style: UIAlertAction.Style.default) { _ in
            completion(.didSelectedLeftButton)
        }
        alertController.addAction(action1)
        let action2 = UIAlertAction(title: rightButtonTitle, style: UIAlertAction.Style.default) { _ in
            completion(.didSelectedRightButton)
        }
        alertController.addAction(action2)
        present(alertController, animated: true, completion: nil)
    }
}

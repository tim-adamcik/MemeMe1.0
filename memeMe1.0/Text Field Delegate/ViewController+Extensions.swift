//
//  textFieldDelegate.swift
//  memeMe1.0
//
//  Created by Timothy Adamcik on 10/27/19.
//  Copyright © 2019 Timothy Adamcik. All rights reserved.
//

import Foundation
import UIKit

enum TextField: String {
    case top, bottom
}

class TextFieldDelegate: NSObject, UITextFieldDelegate {
    
    func textFieldDidBeginEditing(_ textField: UITextField) {
        if textField.text == TextField.top.rawValue {
            NotificationCenter.default.removeObserver(self, name: UIResponder.keyboardWillShowNotification, object: nil)
            NotificationCenter.default.removeObserver(self, name: UIResponder.keyboardWillHideNotification, object: nil)
        }
        textField.text = ""
    }
    
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        textField.resignFirstResponder()

        return true
    }
}

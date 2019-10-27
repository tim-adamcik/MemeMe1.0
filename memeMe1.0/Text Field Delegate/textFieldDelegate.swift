//
//  textFieldDelegate.swift
//  memeMe1.0
//
//  Created by Timothy Adamcik on 10/27/19.
//  Copyright © 2019 Timothy Adamcik. All rights reserved.
//

import Foundation
import UIKit

class TextFieldDelegate: NSObject, UITextFieldDelegate {
    
    func textFieldDidBeginEditing(_ textField: UITextField) {
        textField.text = ""        
    }
    
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        textField.resignFirstResponder()

        return true
    }
}

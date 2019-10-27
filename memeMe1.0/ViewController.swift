//
//  ViewController.swift
//  memeMe1.0
//
//  Created by Timothy Adamcik on 10/27/19.
//  Copyright © 2019 Timothy Adamcik. All rights reserved.
//

import UIKit

class ViewController: UIViewController, UIImagePickerControllerDelegate, UINavigationControllerDelegate, UITextFieldDelegate {

    @IBOutlet weak var imagePickerView: UIImageView!
    @IBOutlet weak var topTextField: UITextField!
    @IBOutlet weak var bottomTextField: UITextField!
    @IBOutlet weak var cameraButton: UIBarButtonItem!
    
    let textFieldDel = TextFieldDelegate()
    

    override func viewDidLoad() {
        super.viewDidLoad()
        self.topTextField.delegate = textFieldDel
        self.bottomTextField.delegate = textFieldDel
        topTextField.text = "TOP"
        bottomTextField.text = "BOTTOM"
        
        let memeTextAttributes: [NSAttributedString.Key: Any] = [
                 NSAttributedString.Key.strokeColor : UIColor.black ,
                 NSAttributedString.Key.foregroundColor: UIColor.white ,
                 NSAttributedString.Key.font: UIFont(name: "HelveticaNeue-CondensedBlack", size: 40)!,
                 NSAttributedString.Key.strokeWidth: -3.0
             ]
             
             topTextField.defaultTextAttributes = memeTextAttributes
             bottomTextField.defaultTextAttributes = memeTextAttributes
             topTextField.textAlignment = .center
             bottomTextField.textAlignment = .center
             topTextField.backgroundColor = UIColor.clear
             bottomTextField.backgroundColor = UIColor.clear
            topTextField.borderStyle = .none
            bottomTextField.borderStyle = .none
        // Do any additional setup after loading the view.
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        cameraButton.isEnabled = UIImagePickerController.isSourceTypeAvailable(.camera)
    }

    @IBAction func pickImageFromLibrary(_ sender: Any) {
        let imagePicker = UIImagePickerController()
        imagePicker.delegate = self
        imagePicker.allowsEditing = true
        imagePicker.sourceType = .photoLibrary
        present(imagePicker, animated: true, completion: nil)
        
    }
    @IBAction func pickImageFromCamera(_ sender: Any) {
        let imagePicker = UIImagePickerController()
        imagePicker.delegate = self
        imagePicker.sourceType = .camera
        present(imagePicker, animated: true, completion: nil)
    }
    
    func imagePickerController(_ picker: UIImagePickerController,
                                  didFinishPickingMediaWithInfo info: [UIImagePickerController.InfoKey : Any]) {
           if let image = info[.editedImage] as? UIImage {
               imagePickerView.image = image
           }
           dismiss(animated: true, completion: nil)
       }
    
    func imagePickerControllerDidCancel(_ picker: UIImagePickerController) {
          dismiss(animated: true, completion: nil)
      }
}


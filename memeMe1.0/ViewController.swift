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
    

    fileprivate func configureFor(_ textField: UITextField, with placeholder: String) {
        
        let memeTextAttributes: [NSAttributedString.Key: Any] = [
                   NSAttributedString.Key.strokeColor : UIColor.black ,
                   NSAttributedString.Key.foregroundColor: UIColor.white ,
                   NSAttributedString.Key.font: UIFont(name: "HelveticaNeue-CondensedBlack", size: 40)!,
                   NSAttributedString.Key.strokeWidth: -3.0
               ]
        
        textField.defaultTextAttributes = memeTextAttributes
        textField.textAlignment = .center
        textField.autocapitalizationType = .allCharacters
        textField.backgroundColor = UIColor.clear
        textField.borderStyle = .none
        textField.delegate = textFieldDel
        textField.text = placeholder
    }
    
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
       
             NotificationCenter.default.addObserver(self, selector: #selector(ViewController.keyboardWillShow), name: UIResponder.keyboardWillShowNotification, object: nil)
             
             NotificationCenter.default.addObserver(self, selector: #selector(ViewController.keyboardWillHide), name: UIResponder.keyboardWillHideNotification, object: nil)
        
        configureFor(topTextField, with: TextField.top.rawValue.uppercased())
        configureFor(bottomTextField, with: TextField.bottom.rawValue.uppercased())
        
       
        // Do any additional setup after loading the view.
    }
    
  @objc func keyboardWillShow(notification: NSNotification) {
           guard let userInfo = notification.userInfo else {return}
           guard let keyboardSize = userInfo[UIResponder.keyboardFrameEndUserInfoKey] as? NSValue else {return}
           let keyboardFrame = keyboardSize.cgRectValue
           if self.view.frame.origin.y == 0{
               self.view.frame.origin.y -= keyboardFrame.height
           }
       }

       @objc func keyboardWillHide(notification: NSNotification) {
           if self.view.frame.origin.y != 0 {
               self.view.frame.origin.y = 0
           }
       }
    
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        cameraButton.isEnabled = UIImagePickerController.isSourceTypeAvailable(.camera)
        
    }
    
    override func viewWillDisappear(_ animated: Bool) {
        super.viewWillDisappear(animated)
       
    }
    
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        textField.resignFirstResponder()
        return true
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
    
//    struct Meme {
//        var topText: String
//        var bottomText: String
//        var originalImage: UIImage
//        var memeImage: UIImage
//    }
//
//    func save() {
//            // Create the meme
//            let meme = Meme(topText: topTextField.text!, bottomText: bottomTextField.text!, originalImage: imagePickerView.image!, memedImage: memedImage)
//    }
//
//
//    func generateMemedImage() -> UIImage {
//
//        // TODO: Hide toolbar and navbar
//
//        // Render view to an image
//        UIGraphicsBeginImageContext(self.view.frame.size)
//        view.drawHierarchy(in: self.view.frame, afterScreenUpdates: true)
//
//        let memedImage: UIImage = UIGraphicsGetImageFromCurrentImageContext()!
//        UIGraphicsEndImageContext()
//
//        // TODO: Show toolbar and navbar
//
//        return memedImage
//    }
    
    
}


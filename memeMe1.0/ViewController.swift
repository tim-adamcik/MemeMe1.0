//
//  ViewController.swift
//  memeMe1.0
//
//  Created by Timothy Adamcik on 10/27/19.
//  Copyright © 2019 Timothy Adamcik. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var imagePickerView: UIImageView!
    @IBOutlet weak var topTextField: UITextField!
    @IBOutlet weak var bottomTextField: UITextField!
    @IBOutlet weak var cameraButton: UIBarButtonItem!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
    }

    @IBAction func pickImageFromLibrary(_ sender: Any) {
    }
    @IBAction func pickImageFromCamera(_ sender: Any) {
    }
    
}


//
//  MemeDetailVC.swift
//  memeMe1.0
//
//  Created by Timothy Adamcik on 12/29/19.
//  Copyright © 2019 Timothy Adamcik. All rights reserved.
//

import Foundation
import UIKit

class MemeDetailVC: UIViewController {
    
    @IBOutlet weak var imageDetailView: UIImageView!
    
    
    
    @IBAction func sendMemeDetail(_ sender: Any) {
        
        
        let controller = UIActivityViewController
        
    }
    
    @IBAction func backButton(_ sender: Any) {
        if let tabVC = self.storyboard?.instantiateViewController(withIdentifier: "TabVC") as? UITabBarController {
        tabVC.modalPresentationStyle = .fullScreen
        present(tabVC, animated: false, completion: nil)
        }
    }
    
}

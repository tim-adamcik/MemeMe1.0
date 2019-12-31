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
    
    var meme: Meme!
    
    @IBOutlet weak var imageDetailView: UIImageView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        imageDetailView.image = meme.memedImage
    }
    
    @IBAction func sendMemeDetail(_ sender: Any) {
        
        
        
    }
    
    
}

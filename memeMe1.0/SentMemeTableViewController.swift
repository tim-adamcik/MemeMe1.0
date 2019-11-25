//
//  SentMemeTableViewController.swift
//  memeMe1.0
//
//  Created by Timothy Adamcik on 11/25/19.
//  Copyright © 2019 Timothy Adamcik. All rights reserved.
//

import UIKit

class SentMemeTableViewController: UIViewController, UITableViewDelegate, UITableViewDataSource {
    
    var memes: [Meme]! {
           let object = UIApplication.shared.delegate
           let appDelegate = object as! AppDelegate
           return appDelegate.memes
        
       }
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return self.memes.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "MemeCell", for: indexPath)
        
        return cell
    }
    
    
}

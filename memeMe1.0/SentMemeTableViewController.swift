//
//  SentMemeTableViewController.swift
//  memeMe1.0
//
//  Created by Timothy Adamcik on 11/25/19.
//  Copyright © 2019 Timothy Adamcik. All rights reserved.
//

import UIKit

class SentMemeTableViewController: UIViewController, UITableViewDelegate, UITableViewDataSource {
    
    
    @IBOutlet weak var addNewMemeButton: UIBarButtonItem!
    
    @IBOutlet weak var sentMemeTableView: UITableView!
    
    var memes: [Meme]! {
           let object = UIApplication.shared.delegate
           let appDelegate = object as! AppDelegate
           return appDelegate.memes
        
       }
    
    override func viewDidLoad() {
        super.viewDidAppear(true)
        sentMemeTableView.reloadData()
    }
    
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return self.memes.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let cell = tableView.dequeueReusableCell(withIdentifier: "MemeCell", for: indexPath) as? MemeTableViewCell else { return UITableViewCell()}
        let meme = self.memes[(indexPath as NSIndexPath).row]
        
        cell.textLabel?.text = meme.topText + meme.bottomText
        cell.imageView?.image = meme.memedImage
        
        return cell
    }
    
    
    @IBAction func createNewMeme() {
        if let memeEditorNC = self.storyboard?.instantiateViewController(withIdentifier: "MemeEditorNC") as? UINavigationController {
            memeEditorNC.modalPresentationStyle = .fullScreen
            present(memeEditorNC, animated: false, completion: nil)
        }
    }
}

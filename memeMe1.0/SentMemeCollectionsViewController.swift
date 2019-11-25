//
//  SentMemeCollectionsViewController.swift
//  memeMe1.0
//
//  Created by Timothy Adamcik on 11/24/19.
//  Copyright © 2019 Timothy Adamcik. All rights reserved.
//

import UIKit

class SentMemeCollectionsViewController: UICollectionViewController {
    
    var memes: [Meme]! {
        let object = UIApplication.shared.delegate
        let appDelegate = object as! AppDelegate
        return appDelegate.memes
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        self.tabBarController?.tabBar.isHidden = false
    }
    
    override func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return self.memes.count
    }
    
    override func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "SentMemeCollectionViewCell", for: indexPath)
        return cell
    }
    
    override func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
       
        let detailController = self.storyboard!.instantiateViewController(withIdentifier: "MemeEditorViewController") as! MemeEditorViewController
        self.navigationController!.pushViewController(detailController, animated: true)
        
    }
    
}

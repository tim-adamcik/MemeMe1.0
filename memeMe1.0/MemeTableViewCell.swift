//
//  MemeTableViewCell.swift
//  memeMe1.0
//
//  Created by Timothy Adamcik on 11/26/19.
//  Copyright © 2019 Timothy Adamcik. All rights reserved.
//

import UIKit

class MemeTableViewCell: UITableViewCell {

    @IBOutlet weak var savedMemeImage: UIImageView!
    @IBOutlet weak var savedMemeLabel: UILabel!
    
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}

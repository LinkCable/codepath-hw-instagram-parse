//
//  PostCell.swift
//  Swiftounce
//
//  Created by Philippe Kimura-Thollander on 3/6/16.
//  Copyright © 2016 Philippe Kimura-Thollander. All rights reserved.
//

import UIKit
import Parse
import ParseUI

class PostCell: UITableViewCell {

    @IBOutlet weak var postImageView: PFImageView!
    @IBOutlet weak var captionLabel: UILabel!
    
    var swiftouncePost: PFObject! {
        didSet {
            self.postImageView.file = swiftouncePost["media"] as? PFFile
            self.postImageView.loadInBackground()
            self.captionLabel.text = swiftouncePost["caption"] as? String
        }
    }
    
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
        print(postImageView.image)
    }

    override func setSelected(selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}

//
//  userTableViewCell.swift
//  MovieKernel
//
//  Created by malith on 4/27/19.
//  Copyright © 2019 malith. All rights reserved.
//

import UIKit

class userTableViewCell: UITableViewCell {

    @IBOutlet weak var logoImage: UIImageView!
    @IBOutlet weak var titleLabel: UILabel!
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
    func commonInit(_ image: UIImage, title: String){
        logoImage.image = image
        titleLabel.text = title
    }
    
}

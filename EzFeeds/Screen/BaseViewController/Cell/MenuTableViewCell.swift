//
//  MenuTableViewCell.swift
//  EzFeeds
//
//  Created by Nam on 05/04/2021.
//

import UIKit

class MenuTableViewCell: UITableViewCell {

    @IBOutlet weak var menuImageView: UIImageView!
    @IBOutlet weak var menuTitleLabel: UILabel!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    func config(image: String, title: String) {
        menuImageView.image = UIImage(named: image)
        menuTitleLabel.text = title
    }
    
}

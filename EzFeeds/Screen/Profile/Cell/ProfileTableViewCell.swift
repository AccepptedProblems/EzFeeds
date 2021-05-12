//
//  ProfileTableViewCell.swift
//  EzFeeds
//
//  Created by Nam on 26/04/2021.
//

import UIKit

class ProfileTableViewCell: UITableViewCell {
    
    @IBOutlet weak var titleImageView: UIImageView!
    @IBOutlet weak var titleLabel: UILabel!
    @IBOutlet weak var infoLabel: UILabel!
    

    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }
    
    func configData(data: ProfileModel) {
        titleImageView.image = data.image()
        titleLabel.text = data.title
        infoLabel.text = data.info
        titleImageView.isHidden = !data.isConfig
    }
    
}

//
//  ListNewsTableViewCell.swift
//  EzFeeds
//
//  Created by Nam on 27/03/2021.
//

import UIKit

class ListNewsTableViewCell: UITableViewCell {

    @IBOutlet weak var sourceNameLabel: UILabel!
    @IBOutlet weak var titleLabel: UILabel!
    @IBOutlet weak var categoryLabel: UILabel!
    @IBOutlet weak var timeLabel: UILabel!
    @IBOutlet weak var subtitleSeparateView: UIView!
    
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
        subtitleSeparateView.layer.masksToBounds = true
        subtitleSeparateView.layer.cornerRadius = subtitleSeparateView.bounds.height / 2
    }

    
    
}

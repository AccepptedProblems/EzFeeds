//
//  CategoryTableViewCell.swift
//  EzFeeds
//
//  Created by Nam on 12/04/2021.
//

import UIKit

class CategoryTableViewCell: UITableViewCell {

    @IBOutlet weak var categoryImage: UIImageView!
    @IBOutlet weak var titleLabel: UILabel!
    @IBOutlet weak var subtitleLabel: UILabel!
    
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
        self.selectionStyle = .none
        categoryImage.layer.cornerRadius = 7
    }
    
    func configData(data: CategoryType) {
        categoryImage.image = UIImage(named: data.imageStr())
        titleLabel.text = data.title()
        subtitleLabel.text = data.subtitle()
    }
    
}

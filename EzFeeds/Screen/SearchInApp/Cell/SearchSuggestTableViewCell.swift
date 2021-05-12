//
//  SearchSuggestTableViewCell.swift
//  EzFeeds
//
//  Created by Nam on 17/04/2021.
//

import UIKit

class SearchSuggestTableViewCell: UITableViewCell {
    
    @IBOutlet weak var suggestButtonView: UIView!
    @IBOutlet weak var keywordLabel: UILabel!
    @IBOutlet weak var contentLabel: UILabel!
    
    var searchKey: ((_ text: String)->())?
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
        suggestButtonView.layer.cornerRadius = 5
        suggestButtonView.layer.borderWidth = 0.5
        suggestButtonView.layer.borderColor = UIColor.ezColor.cgColor
        self.selectionStyle = .none
    }
    
    func configData(keyword: String, title: String ) {
        keywordLabel.text = keyword
        contentLabel.text = title
    }

    @IBAction func searchAction(_ sender: Any) {
        if let textSearch = keywordLabel.text {
            searchKey?(textSearch)
        }
    }
    
}

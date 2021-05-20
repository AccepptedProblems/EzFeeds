//
//  BookmarkTableViewCell.swift
//  EzFeeds
//
//  Created by Nam on 20/05/2021.
//

import UIKit

class BookmarkTableViewCell: UITableViewCell {
    @IBOutlet weak var bookmarkImg: UIImageView!
    @IBOutlet weak var bookmarkTitle: UILabel!
    @IBOutlet weak var descLabel: UILabel!
    
    var bookmark: BookmarkModel?
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
        selectionStyle = .none
    }
    
    func configData(data: BookmarkModel) {
        bookmark = data
        bookmarkImg.sd_setImage(with: URL(string: data.urlArticle), completed: nil)
        descLabel.text = data.desc
        bookmarkTitle.text = data.title
    }
    
}

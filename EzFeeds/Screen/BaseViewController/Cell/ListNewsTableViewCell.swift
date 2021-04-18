//
//  ListNewsTableViewCell.swift
//  EzFeeds
//
//  Created by Nam on 27/03/2021.
//

import UIKit
import SDWebImage

class ListNewsTableViewCell: UITableViewCell {

    @IBOutlet weak var sourceNameLabel: UILabel!
    @IBOutlet weak var titleLabel: UILabel!
    @IBOutlet weak var categoryLabel: UILabel!
    @IBOutlet weak var timeLabel: UILabel!
    @IBOutlet weak var subtitleSeparateView: UIView!
    @IBOutlet weak var moreActionButton: UIButton!
    @IBOutlet weak var newsImageView: UIImageView!
    
    let menu = MenuCustomView()
    var isShowMenu: Bool = false
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
        subtitleSeparateView.layer.masksToBounds = true
        subtitleSeparateView.layer.cornerRadius = subtitleSeparateView.bounds.height / 2
        configMenu()
        configUI()
    }
    
    func configUI() {
        newsImageView.layer.cornerRadius = 5
        self.selectionStyle = .none
    }
    
    func configMenu() {
        menu.parentView = moreActionButton
        menu.awakeFromNib()
    }
    
    func configData(data: NewsDetail) {
        newsImageView.sd_setImage(with: URL(string: data.urlToImage), completed: nil)
        sourceNameLabel.text = data.sources?.sourceName
        titleLabel.text = data.title
        timeLabel.text = data.createAt
        categoryLabel.text = "category"
    }
    
    
    @IBAction func moreAction(_ sender: Any) {
        print("tap")
        isShowMenu = !isShowMenu
        if isShowMenu {
            menu.show()
        } else {
            menu.hide()
        }
    }
    
    
}

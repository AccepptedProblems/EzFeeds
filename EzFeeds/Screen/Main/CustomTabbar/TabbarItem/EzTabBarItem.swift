//
//  EzTabBarItem.swift
//  EZFeed
//
//  Created by Nam on 26/03/2021.
//

import UIKit

class EzTabBarItem: BaseCustomView {
    
    @IBOutlet weak var imageView: UIImageView!
    @IBOutlet weak var ezButtonItem: UIButton!
    
    var itemType: EZFeedTabbarItemType?
    var didSelectItem: ((_ itemType: EZFeedTabbarItemType)->())?
    var isSelect: Bool = false
    
    override func awakeFromNib() {
        super.awakeFromNib()
    }
    
    func setupData(itemType: EZFeedTabbarItemType) {
        self.itemType = itemType
        imageView.image = UIImage(named: itemType.imageForItem(), in: .main, compatibleWith: nil)
    }
    
    func setSelected(isSelected: Bool) {
        isSelect = isSelected
        imageView.setTintColor(color: isSelected ? .ezColor : .black)
    }
    
    @IBAction func selectItem(_ sender: Any) {
        if isSelect {return}
        if let item = itemType {
            didSelectItem?(item)
        }
    }
    

}

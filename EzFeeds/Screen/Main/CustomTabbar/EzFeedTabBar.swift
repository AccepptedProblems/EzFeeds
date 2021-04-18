//
//  EzFeedTabBar.swift
//  EZFeed
//
//  Created by Nam on 26/03/2021.
//

import UIKit

class EzFeedTabBar: BaseCustomView {
    
    @IBOutlet weak var homeViewItem: EzTabBarItem!
    @IBOutlet weak var bookmarkViewItem: EzTabBarItem!
    @IBOutlet weak var searchView: EzTabBarItem!
    @IBOutlet weak var categoryViewItem: EzTabBarItem!
    @IBOutlet weak var profileViewItem: EzTabBarItem!
    
    var didSelectItem: ((_ itemType: EZFeedTabbarItemType)->())?
    
    override func awakeFromNib() {
        super.awakeFromNib()
        
        //Setup data
        homeViewItem.setupData(itemType: .home)
        bookmarkViewItem.setupData(itemType: .bookmark)
        searchView.setupData(itemType: .search)
        categoryViewItem.setupData(itemType: .category)
        profileViewItem.setupData(itemType: .profile)
        
        //Setup UI
        configTabbar()
        
        // Select first item
        selectItem(itemType: .home)
        homeViewItem.setSelected(isSelected: true)
    }
    
    func selectItem(itemType: EZFeedTabbarItemType) {
        didSelectItem?(itemType)
    }
    
    func resetSelection() {
        homeViewItem.setSelected(isSelected: false)
        bookmarkViewItem.setSelected(isSelected: false)
        searchView.setSelected(isSelected: false)
        categoryViewItem.setSelected(isSelected: false)
        profileViewItem.setSelected(isSelected: false)
    }
    
    func configTabbar() {
        homeViewItem.didSelectItem = { [weak self] (itemType) in
            self?.resetSelection()
            self?.homeViewItem.setSelected(isSelected: true)
            self?.selectItem(itemType: itemType)
        }
        bookmarkViewItem.didSelectItem = { [weak self] (itemType) in
            self?.resetSelection()
            self?.bookmarkViewItem.setSelected(isSelected: true)
            self?.selectItem(itemType: itemType)
        }
        searchView.didSelectItem = { [weak self] (itemType) in
            self?.resetSelection()
            self?.searchView.setSelected(isSelected: true)
            self?.selectItem(itemType: itemType)
        }
        categoryViewItem.didSelectItem = { [weak self] (itemType) in
            self?.resetSelection()
            self?.categoryViewItem.setSelected(isSelected: true)
            self?.selectItem(itemType: itemType)
        }
        profileViewItem.didSelectItem = { [weak self] (itemType) in
            self?.resetSelection()
            self?.profileViewItem.setSelected(isSelected: true)
            self?.selectItem(itemType: itemType)
        }
    }

}

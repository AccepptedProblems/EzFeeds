//
//  TabbarData.swift
//  EzFeeds
//
//  Created by Nam on 26/03/2021.
//

import Foundation
import UIKit

enum EZFeedTabbarItemType {
    case home
    case bookmark
    case search
    case category
    case profile
    
    func getIndex() -> Int {
        switch self {
        case .home:
            return 0
        case .bookmark:
            return 1
        case .search:
            return 2
        case .category:
            return 3
        case .profile:
            return 4
        }
    }
    
    func viewController() -> UIViewController {
        switch self {
        case .home:
            let vc = EzListNewsViewController.newViewController(type: .topHeadline)
            return vc
        case .bookmark:
            let vc = ListBookmarkViewController.newController()
            return vc
        case .search:
            let vc = SearchNewsViewController()
            return vc
        case .category:
            let vc = ListCategoryViewController.newController()
            return vc
        case .profile:
            let vc = ProfileViewController()
            return vc
        }
    }
    
    func imageForItem() -> String {
        switch self {
        case .home:
            return "icon_home"
        case .bookmark:
            return "icon_bookmark"
        case .search:
            return "icon_search"
        case .category:
            return "icon_grid"
        case .profile:
            return "icon_profile"
        }
    }
}

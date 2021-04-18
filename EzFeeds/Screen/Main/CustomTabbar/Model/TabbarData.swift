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
            let vc = EzListNewsViewController.newViewController()
            return vc
        case .bookmark:
            let vc = ListBookmarkViewController.newController()
            vc.view.backgroundColor = .blue
            return vc
        case .search:
            let vc = ViewController()
            vc.view.backgroundColor = .gray
            return vc
        case .category:
            let vc = ListCategoryViewController.newController()
            vc.view.backgroundColor = .green
            return vc
        case .profile:
            let vc = ViewController()
            vc.view.backgroundColor = .orange
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

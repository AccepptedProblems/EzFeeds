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
    case category
    case profile
    
    func getIndex() -> Int {
        switch self {
        case .home:
            return 0
        case .bookmark:
            return 1
        case .category:
            return 2
        case .profile:
            return 3
        }
    }
    
    func viewController() -> UIViewController {
        switch self {
        case .home:
            let vc = EzListNewsViewController.newViewController()
            return vc
        case .bookmark:
            let vc = ViewController()
            vc.view.backgroundColor = .blue
            return vc
        case .category:
            let vc = ViewController()
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
        case .category:
            return "icon_grid"
        case .profile:
            return "icon_profile"
        }
    }
}

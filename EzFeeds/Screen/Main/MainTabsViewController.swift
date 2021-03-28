//
//  MainTabsViewController.swift
//  EZFeed
//
//  Created by Nam on 26/03/2021.
//

import UIKit

class MainTabsViewController: UIViewController {
    
    @IBOutlet weak var containerView: UIView!
    @IBOutlet weak var ezTabbar: EzFeedTabBar!
    
    class func newViewController() -> MainTabsViewController {
        let mainVc = MainTabsViewController(nibName: String(describing: self), bundle: nil)
        return mainVc
    }

    override func viewDidLoad() {
        super.viewDidLoad()
        configTabbar()
        
        gotoVc(itemType: .home)
    }
    
    func gotoVc(itemType: EZFeedTabbarItemType) {
        let vc = itemType.viewController()
        let nav = UINavigationController(rootViewController: vc)
        nav.setNavigationBarHidden(true, animated: false)
        nav.view.frame = self.containerView.bounds
        addChild(nav)
        self.containerView.addSubview(nav.view)
        nav.didMove(toParent: self)
    }
    
    func configTabbar(){
        ezTabbar.didSelectItem = { [weak self] (itemType) in
            self?.gotoVc(itemType: itemType)
        }
    }
    
    

}

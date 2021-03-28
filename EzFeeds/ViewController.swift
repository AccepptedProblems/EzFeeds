//
//  ViewController.swift
//  EzFeeds
//
//  Created by Nam on 26/03/2021.
//

import UIKit

class ViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        let mainVc = MainTabsViewController.newViewController()
        navigationController?.setNavigationBarHidden(true, animated: false)
        navigationController?.pushViewController(mainVc, animated: true)
    }


}


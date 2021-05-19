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
        setupForLogin()
    }
    
    func gotoMainVC() {
        let mainVc = MainTabsViewController.newViewController()
        navigationController?.setNavigationBarHidden(true, animated: false)
        navigationController?.pushViewController(mainVc, animated: false)
    }
    
    func gotoLoginController() {
        let mainVc = LoginViewController()
        navigationController?.setNavigationBarHidden(true, animated: false)
        navigationController?.pushViewController(mainVc, animated: false)
    }
    
    func setupForLogin () {
        let username = UserLogin.current.username
        let password = UserLogin.current.password
        
        if username == "" || password == "" {
            gotoLoginController()
        }
        
        APIRequest.request(apiRouter: EZAppApỉouter.signin(username: username, password: password), object: EzUser.self) { [weak self] (result) in
            if result != nil {
                self?.gotoMainVC()
            } else {
                self?.gotoLoginController()
            }
        } failure: { (error) in
            print("Dang nhap khong thanh cong!!!!" + error)
        }

    }


}


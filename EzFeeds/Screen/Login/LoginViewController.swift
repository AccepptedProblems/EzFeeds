//
//  LoginViewController.swift
//  EZFeed
//
//  Created by Nam on 25/03/2021.
//

import UIKit

class LoginViewController: UIViewController {
    
    
    @IBOutlet weak var usernameTextfield: UITextField!
    @IBOutlet weak var passwordTextField: UITextField!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        config()
    }
    
    func config() {
        usernameTextfield.delegate = self
        passwordTextField.delegate = self
    }
    
    func gotoMainController() {
        guard var controllers = navigationController?.viewControllers else {return}
        let mainVc = MainTabsViewController.newViewController()
        while controllers.count > 1 {
            controllers.removeLast()
        }
        
        controllers.append(mainVc)
        navigationController?.viewControllers = controllers
    }
    
    func canLogin() -> Bool {
        return usernameTextfield.text != "" && passwordTextField.text != ""
    }
    
    @IBAction func signinButton(_ sender: Any) {
        if !self.canLogin() {
            return
        }
        self.showLoadingView()
        APIRequest.request(apiRouter: EZAppApỉouter.signin(username: usernameTextfield.text! , password: passwordTextField.text!), object: EzUser.self) { [weak self] (result) in
            self?.hideLoadingView()
            if let data = result, let user = data.first {
                UserLogin.setValueForUser(user: user)
                UserLogin.current.password = self?.passwordTextField.text! ?? ""
                self?.gotoMainController()
                return
            }
            print("login unsuccess")
        } failure: { [weak self] (error) in
            self?.hideLoadingView()
            print(error)
        }

    }
    
    @IBAction func signupAction(_ sender: Any) {
        let signupVc = RegisterViewController()
        navigationController?.pushViewController(signupVc, animated: true)
    }
    
}

extension LoginViewController: UITextFieldDelegate {
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        return self.canLogin()
    }
}


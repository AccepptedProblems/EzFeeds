//
//  RegisterViewController.swift
//  EzFeeds
//
//  Created by Nam on 19/05/2021.
//

import UIKit

class RegisterViewController: UIViewController {
    
    @IBOutlet weak var usernameTf: UITextField!
    @IBOutlet weak var emailTf: UITextField!
    @IBOutlet weak var passwordTf: UITextField!
    @IBOutlet weak var countryTf: UITextField!
    @IBOutlet weak var cityTf: UITextField!
    
    var param = [String: Any]()

    override func viewDidLoad() {
        super.viewDidLoad()
    }
    
    func isCanSignUp() -> Bool {
        if usernameTf.text == "" {
            self.showAlert(message: "Missing username!!")
            return false
        }
        if passwordTf.text == "" {
            self.showAlert(message: "Missing password!!")
            return false
        }
        if emailTf.text == "" {
            self.showAlert(message: "Missing email!!")
            return false
        }
        if !isValidEmail(emailTf.text ?? "") {
            self.showAlert(message: "Wrong email format!!")
            return false
        }
        if countryTf.text == "" {
            self.showAlert(message: "Missing country!!")
            return false
        }
        if cityTf.text == "" {
            self.showAlert(message: "Missing country!!")
            return false
        }
        return true
    }
    
    func gotoLogin() {
        navigationController?.popViewController(animated: true)
    }
    
    @IBAction func signupAction(_ sender: Any) {
        if !isCanSignUp() {
            return
        }
        param["username"] = usernameTf.text
        param["password"] = passwordTf.text
        param["email"] = emailTf.text
        param["city"] = cityTf.text
        param["country"] = countryTf.text
        APIRequest.request(apiRouter: EZAppApỉouter.signup(param: param), object: EzUser.self) { [weak self] (_) in
            let alert = UIAlertController(title: "Đăng ký thành công", message: nil, preferredStyle: .alert)
            let cancel = UIAlertAction(title: "OK", style: .cancel) { [weak self] (action) in
                self?.gotoLogin()
            }
            alert.addAction(cancel)
            self?.present(alert, animated: true, completion: nil)
        } failure: { (error) in
            print(error)
        }

    }
    @IBAction func beckToLoginButton(_ sender: Any) {
        gotoLogin()
    }
    
    func isValidEmail(_ email: String) -> Bool {
        let emailRegEx = "[A-Z0-9a-z._%+-]+@[A-Za-z0-9.-]+\\.[A-Za-z]{2,64}"

        let emailPred = NSPredicate(format:"SELF MATCHES %@", emailRegEx)
        return emailPred.evaluate(with: email)
    }

}


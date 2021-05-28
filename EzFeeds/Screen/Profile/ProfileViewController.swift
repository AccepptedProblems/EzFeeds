//
//  ProfileViewController.swift
//  EzFeeds
//
//  Created by Nam on 21/04/2021.
//

import UIKit

class ProfileViewController: UIViewController {

    @IBOutlet weak var greetingLabel: UILabel!
    @IBOutlet weak var addressLabel: UILabel!
    @IBOutlet weak var profileTableView: UITableView!
    
    let profileDataManager = ProfileDataManager()
    var delegate: EmbeddedViewControllerDelegate?
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        configUI()
        configTableView()
    }
    
    func configUI() {
        greetingLabel.text = "Hello, \(UserLogin.current.username)"
        addressLabel.text = "User"
    }
    
    func configTableView() {
        profileTableView.register(cellType: ProfileTableViewCell.self)
        profileTableView.delegate = self
        profileTableView.dataSource = self
    }

}


extension ProfileViewController: UITableViewDelegate, UITableViewDataSource {
    func numberOfSections(in tableView: UITableView) -> Int {
        return 3
    }
    
    func tableView(_ tableView: UITableView, heightForHeaderInSection section: Int) -> CGFloat {
        return 10
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        switch section {
        case 0:
            return profileDataManager.listEmail.count
        case 1:
            return profileDataManager.listInfo.count
        case 2:
            return profileDataManager.listConfig.count
        default:
            return 0
        }
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(with: ProfileTableViewCell.self, for: indexPath)
        switch indexPath.section {
        case 0:
            cell.configData(data: profileDataManager.listEmail[indexPath.row])
        case 1:
            cell.configData(data: profileDataManager.listInfo[indexPath.row])
        case 2:
            cell.configData(data: profileDataManager.listConfig[indexPath.row])
        default:
            break
        }
        return cell 
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        if indexPath.section == 2 {
            let data = profileDataManager.listConfig[indexPath.row]
            switch data.type {
            case .log_out:
                let alert = UIAlertController(title: "Bạn có chắc muốn đăng xuất?", message: nil, preferredStyle: .alert)
                let action = UIAlertAction(title: "Có", style: .default) { [weak self] (action) in
                    UserLogin.current.resetDataForLogout()
                    self?.delegate?.returnToMainVC()
                }
                let cancel = UIAlertAction(title: "Không", style: .destructive, handler: nil)
                alert.addAction(action)
                alert.addAction(cancel)
                self.present(alert, animated: true, completion: nil)
                
            default:
                break
            }
        }
    }
    
    
}

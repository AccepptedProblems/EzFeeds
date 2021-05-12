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
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        configTableView()
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
    
    
}

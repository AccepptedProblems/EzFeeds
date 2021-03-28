//
//  EzBaseViewController.swift
//  EzFeeds
//
//  Created by Nam on 27/03/2021.
//

import UIKit

class EzListNewsViewController: UIViewController {

    @IBOutlet weak var headerTittleLabel: UILabel!
    @IBOutlet weak var backButton: UIButton!
    @IBOutlet weak var searchButton: UIButton!
    @IBOutlet weak var listNewsTableView: UITableView!
    
    class func newViewController() -> EzListNewsViewController {
        let vc = EzListNewsViewController(nibName: String(describing: self), bundle: nil)
        return vc
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        configTableView()
    }
    
    func configTableView() {
        listNewsTableView.register(cellType: ListNewsTableViewCell.self)
        
        listNewsTableView.delegate = self
        listNewsTableView.dataSource = self
        listNewsTableView.tableFooterView = UIView()
        listNewsTableView.estimatedRowHeight = 300
        listNewsTableView.rowHeight = UITableView.automaticDimension
    }

    
}

extension EzListNewsViewController: UITableViewDelegate, UITableViewDataSource {
    func tableView(_ tableView: UITableView, heightForHeaderInSection section: Int) -> CGFloat {
        return 0.01
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 5
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(with: ListNewsTableViewCell.self, for: indexPath) 
        return cell
    }
    
    
}

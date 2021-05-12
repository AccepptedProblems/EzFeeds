//
//  ListCategoryViewController.swift
//  EzFeeds
//
//  Created by Nam on 08/04/2021.
//

import UIKit

class ListCategoryViewController: UIViewController {
    
    @IBOutlet weak var headerTitleLabel: UILabel!
    @IBOutlet weak var categoryTableView: UITableView!
    
    var categories = [CategoryType]()
    
    class func newController() -> ListCategoryViewController {
        let vc = ListCategoryViewController(nibName: ListCategoryViewController.className, bundle: nil)
        return vc 
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        getData()
        configTable()
    }
    
    func configTable() {
        categoryTableView.register(cellType: CategoryTableViewCell.self)
        categoryTableView.delegate = self
        categoryTableView.dataSource = self 
    }
    
    func getData() {
        for value in CategoryType.allCases {
            categories.append(value)
        }
    }
}

extension ListCategoryViewController: UITableViewDelegate, UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return categories.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(with: CategoryTableViewCell.self, for: indexPath)
        let data = categories[indexPath.row]
        cell.configData(data: data)
        return cell
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let listNewsVc = EzListNewsViewController.newViewController(type: .topHeadline)
        listNewsVc.category = categories[indexPath.row]
        navigationController?.pushViewController(listNewsVc, animated: true)
    }
    
}

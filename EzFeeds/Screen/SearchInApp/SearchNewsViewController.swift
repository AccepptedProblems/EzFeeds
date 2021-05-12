//
//  SearchNewsViewController.swift
//  EzFeeds
//
//  Created by Nam on 17/04/2021.
//

import UIKit

class SearchNewsViewController: UIViewController {

    @IBOutlet weak var searchTextField: UITextField!
    @IBOutlet weak var searchImage: UIImageView!
    @IBOutlet weak var searchContentView: UIView!
    @IBOutlet weak var suggestTableView: UITableView!
    
    var data = [(keyword: String, title: String)] ()
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        searchTextField.delegate = self
        configData()
        configUI()
        configTable()
        
    }
    
    func configUI() {
        searchContentView.layer.cornerRadius = searchContentView.bounds.height/2
    }
    
    func configData() {
        data.append(("\"Elon Musk\"", "Put phrase inside quotes for an exact match"))
        data.append((keyword: "\"Elon Musk\"-Tesla", title: "Use the minus(-) operator to exclude result with match specific keywords"))
        data.append(("Tesla AND \"Elon Musk\"","Use AND to search for multiple keywords in the same article"))
        data.append(("Tesla OR \"Elon Musk\"","Use OR to combine the searh query"))
    }
    
    func configTable() {
        suggestTableView.register(cellType: SearchSuggestTableViewCell.self)
        suggestTableView.delegate = self
        suggestTableView.dataSource = self
        suggestTableView.estimatedRowHeight = 80
        suggestTableView.rowHeight = UITableView.automaticDimension
        suggestTableView.tableFooterView = UIView()
    }
    
    func searchForWord(text: String) {
        let listNewsVC = EzListNewsViewController.newViewController(type: .getListNew)
        listNewsVC.textSearch = text
        navigationController?.pushViewController(listNewsVC, animated: true)
    }

}

extension SearchNewsViewController: UITableViewDelegate, UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return data.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(with: SearchSuggestTableViewCell.self, for: indexPath)
        let dataa = data[indexPath.row]
        cell.configData(keyword: dataa.keyword, title: dataa.title)
        cell.searchKey = { [weak self] (keyword) in
            self?.searchForWord(text: keyword)
        }
        return cell
    }
    
    
}

extension SearchNewsViewController: UITextFieldDelegate {
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        if textField.text == "" {
            return false
        }
        searchForWord(text: textField.text ?? "")
        return true
        
    }
}

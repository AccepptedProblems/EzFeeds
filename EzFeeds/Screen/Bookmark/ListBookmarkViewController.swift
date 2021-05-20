//
//  ListBookmarkViewController.swift
//  EzFeeds
//
//  Created by Nam on 14/04/2021.
//

import UIKit
import RealmSwift

class ListBookmarkViewController: UIViewController {

    @IBOutlet weak var listBookmarkTableView: UITableView!
    let bookmarkDataManager = BookmarkDataManager()
    
    class func newController() ->ListBookmarkViewController {
        let vc = ListBookmarkViewController(nibName: ListBookmarkViewController.className, bundle: nil)
        return vc 
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        configTableView()
        getInfo()
    }
    
    func configTableView() {
        listBookmarkTableView.register(cellType: BookmarkTableViewCell.self )
        listBookmarkTableView.delegate = self
        listBookmarkTableView.dataSource = self
        listBookmarkTableView.estimatedRowHeight = 100
        listBookmarkTableView.rowHeight = UITableView.automaticDimension
        listBookmarkTableView.tableFooterView = UIView()
    }
    
    func getInfo() {
        bookmarkDataManager.getListBookmark { [weak self] in
            self?.listBookmarkTableView.reloadData()
        } failure: { (error) in
            print(error)
        }

    }

}

extension ListBookmarkViewController: UITableViewDelegate, UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return bookmarkDataManager.listBookmark.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(with: BookmarkTableViewCell.self, for: indexPath)
        cell.configData(data: bookmarkDataManager.listBookmark[indexPath.row])
        return cell
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let data = bookmarkDataManager.listBookmark[indexPath.row]
        
        let webVC = WebViewController.newViewController(url: data.urlArticle, title: "Book mark")
        self.present(webVC, animated: true, completion: nil) 
        
    }
    
}

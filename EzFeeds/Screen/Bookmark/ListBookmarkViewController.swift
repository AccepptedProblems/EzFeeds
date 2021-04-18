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
    let listBookmark = [NewsDetail]()
    
    class func newController() ->ListBookmarkViewController {
        let vc = ListBookmarkViewController(nibName: ListBookmarkViewController.className, bundle: nil)
        return vc 
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        configTableView()
        
    }
    
    func configTableView() {
        listBookmarkTableView.register(cellType: ListNewsTableViewCell.self )
        listBookmarkTableView.delegate = self
        listBookmarkTableView.dataSource = self
    }

}

extension ListBookmarkViewController: UITableViewDelegate, UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return listBookmark.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        return UITableViewCell()
    }
    
    
}

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
    @IBOutlet weak var suggestTableView: UITableView!
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        
    }

}
extension SearchNewsViewController: UITextFieldDelegate {
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        if textField.text == "" {
            return false
        }
        let listNewsVC = EzListNewsViewController.newViewController()
        return true
    }

}

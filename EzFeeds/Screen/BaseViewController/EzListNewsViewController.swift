//
//  EzBaseViewController.swift
//  EzFeeds
//
//  Created by Nam on 27/03/2021.
//

import UIKit

class EzListNewsViewController: UIViewController {

    @IBOutlet weak var headerTittleLabel: UILabel!
    @IBOutlet weak var backView: UIView!
    @IBOutlet weak var backButton: UIButton!
    @IBOutlet weak var backImageView: UIImageView!
    @IBOutlet weak var listNewsTableView: UITableView!
    
    var listNewsDataManager = ListNewsDataManager()
    var delegate: EmbeddedViewControllerDelegate?
    
    var type: NewsType = .topHeadline
    var textSearch: String?
    var category: CategoryType?
    var sources: String?
    
    var titleHeader: String = ""
    
    class func newViewController(type: NewsType) -> EzListNewsViewController {
        let vc = EzListNewsViewController(nibName: String(describing: self), bundle: nil)
        vc.type = type
        return vc
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        configUI()
        configTableView()
        configViewModel()
        getNewsData()
        
    }
    
    func configUI() {
        backImageView.setTintColor(color: .ezColor)
        if let category = category?.title() {
            headerTittleLabel.text = category
        }
        
        if let headerTitleStr = textSearch {
            headerTittleLabel.text = "Search result for \"\(headerTitleStr)\""
            headerTittleLabel.font = UIFont.boldSystemFont(ofSize: 20)
        }
        
        if type == .topHeadline {
            backView.isHidden = true
        }
    }
    
    func configTableView() {
        listNewsTableView.register(cellType: ListNewsTableViewCell.self)
        
        listNewsTableView.delegate = self
        listNewsTableView.dataSource = self
        listNewsTableView.tableFooterView = UIView()
        listNewsTableView.estimatedRowHeight = 300
        listNewsTableView.rowHeight = UITableView.automaticDimension
        if self == navigationController?.viewControllers[0] {
            backButton.isHidden = true
        }
    }
    
    func configViewModel() {
        listNewsDataManager.getListNewsSucces = { [weak self] in
            self?.listNewsTableView.reloadData()
        }
    }
    
    func getNewsData() {
        listNewsDataManager.getListNew(type: type, text: textSearch, category: category?.param(), country: type == .topHeadline ? "us" : nil)
    }
    
    @IBAction func backButtonPressed(_ sender: Any) {
        navigationController?.popViewController(animated: true)
    }
    
    
}

extension EzListNewsViewController: UITableViewDelegate, UITableViewDataSource {
    func tableView(_ tableView: UITableView, heightForHeaderInSection section: Int) -> CGFloat {
        return 0.01
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return listNewsDataManager.listNews.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(with: ListNewsTableViewCell.self, for: indexPath)
        cell.configData(data: listNewsDataManager.listNews[indexPath.row])
        return cell
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let newDetailVc = NewsDetailViewController()
        newDetailVc.news = listNewsDataManager.listNews[indexPath.row]
        navigationController?.pushViewController(newDetailVc, animated: true)
    }
    
}

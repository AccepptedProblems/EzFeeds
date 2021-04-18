//
//  NewsDetailViewController.swift
//  EzFeeds
//
//  Created by Nam on 08/04/2021.
//

import UIKit
import WebKit

class NewsDetailViewController: UIViewController {
    @IBOutlet weak var readMoreButton: UIView!
    @IBOutlet weak var shareButton: UIView!
    @IBOutlet weak var saveButton: UIButton!
    @IBOutlet weak var avatarView: UIView!
    @IBOutlet weak var newsImage: UIImageView!
    @IBOutlet weak var titleLabel: UILabel!
    @IBOutlet weak var contentLabel: UILabel!
    @IBOutlet weak var sourcesLabel: UILabel!
    @IBOutlet weak var authorLabel: UILabel!
    
    var news: NewsDetail?
    var webView: WKWebView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        configUI()
        configData()
    }
    
    func configUI() {
        readMoreButton.layer.cornerRadius = 5
        shareButton.layer.cornerRadius = 5
        avatarView.layer.cornerRadius = avatarView.bounds.height/2
    }
    
    func configData(){
        if let data = news?.content,
           let dotRange = data.lastIndex(of: ".") {
            contentLabel.text = data.replacingCharacters(in: dotRange..<data.endIndex, with: "")
        }
        titleLabel.text = news?.title
        newsImage.sd_setImage(with: URL(string: news?.urlToImage ?? ""), completed: nil)
        sourcesLabel.text = news?.sources?.sourceName ?? "Undefine"
        authorLabel.text = news?.authorUrl
    }
    
    
    @IBAction func showWebContent(_ sender: Any) {
        guard let data = news else {return}
        let webVc = WebViewController.newViewController(url: data.urlToArticle, title: data.sources?.sourceName ?? "Undefine")
        present(webVc, animated: true, completion: nil)
    }
    
    @IBAction func backButtonPressed(_ sender: Any) {
        navigationController?.popViewController(animated: true)
    }
    

}

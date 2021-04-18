//
//  WebViewController.swift
//  EzFeeds
//
//  Created by Nam on 08/04/2021.
//

import UIKit
import WebKit

class WebViewController: UIViewController {
    
    @IBOutlet weak var backButton: UIButton!
    @IBOutlet weak var titleLabel: UILabel!
    @IBOutlet weak var contentView: UIView!
    
    var webTitle: String?
    var urlString: String?
    var webView: WKWebView!
    
    class func newViewController(url: String, title: String) -> WebViewController {
        let vc = WebViewController(nibName: WebViewController.className, bundle: nil)
        vc.webTitle = title
        vc.urlString = url
        return vc
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        configWebView()
        showData()
    }
    
    func configWebView() {
        titleLabel.text = webTitle
        let webConfiguration = WKWebViewConfiguration()
        webView = WKWebView(frame: CGRect(x: 0, y: 0, width: contentView.bounds.width, height: contentView.bounds.height), configuration: webConfiguration)
        webView.uiDelegate = self
    }
    
    func showData() {
        guard let url = urlString else {
            return
        }
        if let myURL = URL(string: url) {
            let myRequest = URLRequest(url: myURL)
            webView.load(myRequest)
            contentView.addSubview(webView)
        }
        
    }
    
    //MARK: Action
    @IBAction func backAction(_ sender: Any) {
        self.dismiss(animated: true, completion: nil)
    }
    

}

extension WebViewController: WKUIDelegate {
}

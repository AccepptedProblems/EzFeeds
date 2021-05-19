//
//  UIViewControllerExtension.swift
//  EzFeeds
//
//  Created by Nam on 28/03/2021.
//

import Foundation
import UIKit

extension UIViewController{
    func showAlert(message: String) {
        let alert = UIAlertController(title: message, message: nil, preferredStyle: .alert)
        let cancel = UIAlertAction(title: "OK", style: .cancel, handler: nil)
        alert.addAction(cancel)
        self.present(alert, animated: true, completion: nil)
    }
    
    func showLoadingView() {
        let indicatorView = UIActivityIndicatorView()
        indicatorView.tag = 710
        
        indicatorView.style = .large
        indicatorView.color = UIColor.ezColor
        
        indicatorView.startAnimating()
        
        indicatorView.autoresizingMask = [
            .flexibleLeftMargin, .flexibleRightMargin,
            .flexibleTopMargin, .flexibleBottomMargin
        ]
        indicatorView.frame = view.frame
        
        self.view.addSubview(indicatorView)
    }
    
    func hideLoadingView() {
        if let view = view.viewWithTag(710) as? UIActivityIndicatorView {
            view.stopAnimating()
            view.removeFromSuperview()
        }
    }
}

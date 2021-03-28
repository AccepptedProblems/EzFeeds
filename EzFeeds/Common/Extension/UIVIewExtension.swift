//
//  UIVIewExtension.swift
//  EZFeed
//
//  Created by Nam on 26/03/2021.
//

import Foundation
import UIKit

extension UINib {
    func instantiate() -> Any? {
        return self.instantiate(withOwner: nil, options: nil).first
    }
}

extension UIView {
    func loadViewFromNib() -> UIView? {
        let nib = UINib(nibName: "\(type(of: self))", bundle: Bundle.main)
        return nib.instantiate(withOwner: self, options: nil).first as? UIView
    }
    
    func initViewWithNib() {
        guard let view = loadViewFromNib() else {
            return
        }
        view.frame = bounds
        view.autoresizingMask = [.flexibleWidth, .flexibleHeight]
        view.tag = 999
        addSubview(view)
    }
}

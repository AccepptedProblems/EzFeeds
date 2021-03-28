//
//  BaseCustomView.swift
//  EZFeed
//
//  Created by Nam on 26/03/2021.
//

import UIKit

class BaseCustomView: UIView {
    override init(frame: CGRect) {
        super.init(frame: frame)
        initViewWithNib()
    }
    
    required init?(coder: NSCoder) {
        super.init(coder: coder)
        initViewWithNib()
    }

}

//
//  UIImageViewExtension.swift
//  EzFeeds
//
//  Created by Nam on 27/03/2021.
//

import Foundation
import UIKit

extension UIImageView {
    func setTintColor(color: UIColor) {
        image = image?.withRenderingMode(.alwaysTemplate)
        tintColor = color
    }
}

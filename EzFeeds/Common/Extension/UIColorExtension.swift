//
//  UIColorExtension.swift
//  EzFeeds
//
//  Created by Nam on 27/03/2021.
//

import Foundation
import UIKit

extension UIColor {
    static let ezColor = UIColor(hex: "6B9F2D")
    
    convenience init(hex: String) {
        let r, g, b: CGFloat
        var hexString = hex
        if hex.hasPrefix("#") {
            let start = hex.index(hex.startIndex, offsetBy: 1)
            hexString = String(hex[start...])
        }
        let scanner = Scanner(string: hexString)
        var hexNumber: UInt64 = 0
        
        if scanner.scanHexInt64(&hexNumber) {
            r = CGFloat((hexNumber & 0xff0000) >> 16) / 255.0
            g = CGFloat((hexNumber & 0x00ff00) >> 8) / 255.0
            b = CGFloat((hexNumber & 0x0000ff) >> 0) / 255.0
            
            self.init(red: r, green: g, blue: b, alpha: 1)
            return
        }
        self.init(red: 1, green: 1, blue: 1, alpha: 0)
    }

}

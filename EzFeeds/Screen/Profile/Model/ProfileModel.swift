//
//  ProfileModel.swift
//  EzFeeds
//
//  Created by Nam on 03/05/2021.
//

import UIKit

enum ProfileId: Int, CaseIterable {
    case email = 0
    case name = 1
    case country = 2
    case city = 3
    case setting = 4
    case about_us = 5
    case log_out = 6
    
    func title() -> String {
        switch self {
        case .email:
            return "Email"
        case .name:
            return "Name"
        case .country:
            return "Country"
        case .city:
            return "City"
        case .setting:
            return "Setting"
        case .about_us:
            return "About us"
        case .log_out:
            return "Log out"
        }
    }
    
    func imgStr() -> String {
        switch self {
        case .log_out:
            return "icon_sign_out"
        case .about_us:
            return "icon_help"
        case .setting:
            return "icon_setting"
        default:
            return ""
        }
    }
    
    func isConfig() -> Bool {
        switch self {
        case .log_out, .setting, .about_us:
            return true
        default:
            return false
        }
    }
    
    
}

class ProfileModel {
    var type: ProfileId = .name
    var title: String = ""
    var imageStr: String = ""
    var info: String = ""
    var isConfig: Bool = false
    
    init(type: ProfileId) {
        self.type = type
        self.title = type.title()
        self.imageStr = type.imgStr()
        self.isConfig = type.isConfig()
    }
    
    func image() -> UIImage {
        return UIImage(named: imageStr) ?? UIImage()
    }
}

//
//  EzUser.swift
//  EzFeeds
//
//  Created by Nam on 17/05/2021.
//

import Foundation
import UIKit
import ObjectMapper

class EzUser: NSObject, Mappable {
    var id: Int?
    var username: String?
    var email: String?
    var country: String?
    var city: String?
    
    required init?(map: Map) {
    }
    
    func mapping(map: Map) {
        id <- map["id"]
        username <- map["username"]
        email <- map["email"]
        country <- map["country"]
        city <- map["city"]
    }
}

struct UserLogin {
    static var current = UserLogin()
    
    var id: Int{
        set {
            UserDefaults.standard.setValue(newValue, forKey: "userId")
        }
        get {
            return UserDefaults.standard.integer(forKey: "userId")
        }
    }
    
    var username: String {
        set {
            UserDefaults.standard.setValue(newValue, forKey: "username")
        }
        get {
            return UserDefaults.standard.string(forKey: "username") ?? ""
        }
    }
    
    var password: String {
        set {
            UserDefaults.standard.setValue(newValue, forKey: "password")
        }
        get {
            return UserDefaults.standard.string(forKey: "password") ?? ""
        }
    }
    
    var email: String{
        set {
            UserDefaults.standard.setValue(newValue, forKey: "email")
        }
        get {
            return UserDefaults.standard.string(forKey: "email") ?? ""
        }
    }
    
    var country: String{
        set {
            UserDefaults.standard.setValue(newValue, forKey: "userCountry")
        }
        get {
            return UserDefaults.standard.string(forKey: "userCountry") ?? ""
        }
    }
    
    var city: String{
        set {
            UserDefaults.standard.setValue(newValue, forKey: "userCity")
        }
        get {
            return UserDefaults.standard.string(forKey: "userCity") ?? ""
        }
    }
    
    static func setValueForUser(user: EzUser) {
        current.id = user.id ?? -1
        current.username = user.username ?? ""
        current.email = user.email ?? ""
        current.country = user.country ?? ""
        current.city = user.city ?? ""
    }
    
    mutating func resetDataForLogout() {
        id = 0
        username = ""
        password = ""
        email = ""
        country = ""
        city = ""
    }
    
    
}

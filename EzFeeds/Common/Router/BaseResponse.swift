//
//  BaseResponse.swift
//  EzFeeds
//
//  Created by Nam on 15/05/2021.
//

import UIKit
import ObjectMapper

class BaseResponse <T: Mappable>: NSObject, Mappable {
    var success: String?
    var message: String?
    var data: [T]?
    
    required init?(map: Map) {}
    
    override init() {}
    
    func mapping(map: Map) {
        success <- map["success"]
        message <- map["message"]
        data <- map["data"]
    }
    

}

//
//  SourceDetail.swift
//  EzFeeds
//
//  Created by Nam on 31/03/2021.
//

import UIKit
import ObjectMapper

class SourceDetail: NSObject, Mappable {
    var id: String?
    var sourceName: String = ""
    var desc: String = ""
    var url: String = ""
    var category: String = ""
    var language: String = ""
    var country: String = ""
    
    required init?(map: Map) {
    }
    
    func mapping(map: Map) {
        id <- map["id"]
        sourceName <- map["name"]
        desc <- map["description"]
        url <- map["url"]
        category <- map["category"]
        language <- map["language"]
        country <- map["country"]
    }
    

}

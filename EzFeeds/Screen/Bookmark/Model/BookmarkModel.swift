//
//  BookmarkModel.swift
//  EzFeeds
//
//  Created by Nam on 15/04/2021.
//

import Foundation
import ObjectMapper

class BookmarkModel: NSObject, Mappable {
    var title: String = ""
    var desc: String = ""
    var urlImg: String = ""
    var urlArticle: String = ""
    
    required init?(map: Map) {}
    
    func mapping(map: Map) {
        urlArticle <- map["thumbnail_new"]
        urlImg <- map["thumbnail_image"]
        title <- map["title"]
        desc <- map["description"]
    }
}

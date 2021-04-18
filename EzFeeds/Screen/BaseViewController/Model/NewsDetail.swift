//
//  NewsDetail.swift
//  EzFeeds
//
//  Created by Nam on 31/03/2021.
//

import Foundation
import ObjectMapper

class NewsDetail: NSObject, Mappable {
    var sources: SourceDetail?
    var authorUrl: String = ""
    var title: String = ""
    var desc: String = ""
    var urlToArticle: String = ""
    var urlToImage: String = ""
    var createAt: String = ""
    var content: String = ""
    
    required init?(map: Map) {
    }
    
    func mapping(map: Map) {
        sources <- map["source"]
        authorUrl <- map["author"]
        title <- map["title"]
        desc <- map["description"]
        urlToArticle <- map["url"]
        urlToImage <- map["urlToImage"]
        createAt <- map["publishedAt"]
        content <- map["content"]
        
        let dateFormmater = DateFormatter()
        dateFormmater.dateFormat = "yyyy-MM-dd'T'HH:mm:ss'Z'"
        if let date = dateFormmater.date(from: createAt) {
            dateFormmater.dateFormat = "dd/MM/yyyy"
            createAt = dateFormmater.string(from: date)
        }
        
    }
    
    
}

//
//  NewsResponse.swift
//  EzFeeds
//
//  Created by Nam on 01/04/2021.
//

import Foundation
import ObjectMapper

class ResponseObject: NSObject, Mappable {
    
    var totalResult: Int = 0
    var listNews = [NewsDetail]()
    var status: String = ""
    var message: String = ""
    var error: String = ""
    
    override init() {
    }
    
    required init?(map: Map) {
    }
    
    func transformFromJSON(_ value: Any?) -> [NewsDetail]? {
        guard let listNews = value as? [[String: Any]] else { return nil }
        return listNews.compactMap { dictionary -> NewsDetail? in
            if let news = NewsDetail(JSON: dictionary) {
                return news
            }
            return nil
        }
    }
    
    func mapping(map: Map) {
        totalResult <- map["totalResults"]
        listNews <- map["articles"]
        status <- map["status"]
    }
}

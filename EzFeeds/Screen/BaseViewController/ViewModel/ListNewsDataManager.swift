//
//  ListNewsDataManager.swift
//  EzFeeds
//
//  Created by Nam on 30/03/2021.
//

import Foundation
import Alamofire
import ObjectMapper

class ListNewsDataManager {
    var listNews = [NewsDetail]()
    var newsData = ResponseObject()
    var getListNewsSucces: (()->())?
    
    func getListNew(type: NewsType, text: String? = nil, source: String? = nil, category: String? = nil, country: String? = nil) {
        let urlRequest = try! type.asURLRequest(text: text, sources: source, category: category, country: country)
    
        AF.request(urlRequest).validate().responseJSON { [self] (response) in
            if response.error != nil {
                return
            }
            if let data = response.data {
                let json = dataToJSON(data: data)
                if let jsonData = ResponseObject(JSON: json as! [String : Any]) {
                    newsData = jsonData
                }
                listNews = newsData.listNews
                getListNewsSucces?()
            }
        }
    }
    
    
    
    func dataToJSON(data: Data) -> Any? {
       do {
           return try JSONSerialization.jsonObject(with: data, options: .mutableContainers)
       } catch let myJSONError {
           print(myJSONError)
       }
       return nil
    }
}

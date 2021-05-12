//
//  APIHeader.swift
//  EzFeeds
//
//  Created by Nam on 30/03/2021.
//

import Foundation
import Alamofire
import ObjectMapper

enum NewsType: Alamofire.URLRequestConvertible {
    case getListNew
    case source
    case topHeadline
    
    func getPath() -> String {
        switch self {
        case .getListNew:
            return EzRouter.baseRouter + "everything"
        case .source:
            return EzRouter.baseRouter + "sources"
        default:
            return EzRouter.baseRouter + "top-headlines"
        }
    }
    
    func getParam(text: String?, source: String?, category: String?, country: String?) -> Parameters{
        var param = [String: Any]()
        
        if let textParam = text {
            param["q"] = textParam
        }
        if let sourceParam = source {
            param["source"] = sourceParam
        }
        if let categoryParam = category {
            param["category"] = categoryParam
        }
        if let countryParam = country {
            param["country"] = countryParam
        }
        return param
    }
    
    func HTTPMethod() -> String {
        return "GET"
    }
    
    func asURLRequest() throws -> URLRequest {
        let request = try URLRequest(url: self.getPath(), method: Alamofire.HTTPMethod(rawValue: self.HTTPMethod()), headers: [EzRouter.header])
        return request
    }
    
    func asURLRequest(text: String?, sources: String?, category:String?, country: String?) throws -> URLRequest {
        var paramStr = ""
        for param in self.getParam(text: text, source: sources, category: category, country: country) {
            paramStr += param.key + "=" + (param.value as! String) + "&"
        }
        paramStr.remove(at: paramStr.index(before: paramStr.endIndex))
        paramStr = paramStr.addingPercentEncoding(withAllowedCharacters: .urlHostAllowed) ?? ""
        let request = try URLRequest(url: self.getPath() + "?" + paramStr , method: Alamofire.HTTPMethod(rawValue: self.HTTPMethod()), headers: [EzRouter.header])
        return request
    }
}

struct EzRouter {
    static let baseRouter = "https://newsapi.org/v2/"
    static let header: HTTPHeader = HTTPHeader(name: "x-api-key", value: "7d08d511479244d1b26d811e91eb456c")
}


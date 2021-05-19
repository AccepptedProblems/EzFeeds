//
//  BaseAPIRouter.swift
//  EzFeeds
//
//  Created by Nam on 30/03/2021.
//

import Foundation
import Alamofire

struct FormData {
    var data: Data?
    var mimeType: String?
    var filename: String?
    var key: String?
}

protocol BaseAPIRouter: Alamofire.URLRequestConvertible {
    func header() -> HTTPHeaders
    func baseURL() -> String
    func path() -> String
    func param() -> Parameters
    func method() -> HTTPMethod
    func fullURL() -> String
    func multipartFormData() -> [FormData]?
    func asURLRequest() throws -> URLRequest
}

extension BaseAPIRouter {
    
    func header() -> HTTPHeaders {
        var httpHeader = HTTPHeaders()
        httpHeader.add(name: "Content-Type", value: "application/json")
        httpHeader.add(name: "Accept", value: "application/json")
        return httpHeader
    }
    
    func fullURL() -> String {
        return baseURL() + path()
    }
    
    func asURLRequest() throws -> URLRequest {
        let url = URL(string: fullURL())!
        var urlRequest =  URLRequest(url: url)
        urlRequest.headers = header()
        return urlRequest
    }
    
    func multipartFormData() -> [FormData]? {
        return nil 
    }
}

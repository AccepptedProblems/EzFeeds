//
//  EzAppRouter.swift
//  EzFeeds
//
//  Created by Nam on 13/05/2021.
//

import Foundation
import Alamofire

enum EZAppApỉouter: BaseAPIRouter {
    case signin(username: String, password: String)
    case signup(param: [String: Any])
    case getlistBookmark(id: String)
    case bookmark(param: [String: Any])
    
    func baseURL() -> String {
        return "https://apinewappezfeed.herokuapp.com/"
    }
    
    func path() -> String {
        switch self {
        case .signup:
            return "api/auth/signup"
        case .signin:
            return "api/auth/signin"
        case .getlistBookmark, .bookmark:
            return "bookmark"
        }
    }
    
    func param() -> Parameters {
        switch self {
        case .signin(let username, let password):
            let param = ["username": username,
                         "password": password]
            return param
        case .signup(let param):
            return param
        case.bookmark(let param):
            return param
        case .getlistBookmark(let id):
            return ["id":id]
        }
    }
    
    func method() -> HTTPMethod {
        switch self {
        case .signin, .signup, .bookmark:
            return .post
        case.getlistBookmark:
            return .get
        }
    }
    
}

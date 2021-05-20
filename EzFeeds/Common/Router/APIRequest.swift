//
//  APIRequest.swift
//  EzFeeds
//
//  Created by Nam on 28/03/2021.
//

import Foundation
import Alamofire
import ObjectMapper

struct APIRequest {
    static func request <T: Mappable>(apiRouter:  BaseAPIRouter, object: T.Type, success: (([T]?)->())?, failure: ((_ message: String)->())?) {
        print("=========== API LOG ================")
        print("\(apiRouter.method().rawValue) request: \(apiRouter.fullURL())\n ======================= \n")
        print("Param: \(apiRouter.param()) \n ============================== \n")
        
//        if apiRouter.method() == .post {
//            requestPOST(apiRouter: apiRouter, object: T.self, success: success, failure: failure)
//            return
//        }
        
        AF.request(apiRouter.fullURL(), method: apiRouter.method(), parameters: apiRouter.param(), encoding: JSONEncoding.default, headers: apiRouter.header()).responseJSON { (response) in
            if let json = response.data?.toJSONSTring() {
                let data = BaseResponse<T>(JSONString: json)
                switch response.result {
                case .success:
                    success?(data?.data)
                case .failure:
                    failure?(data?.message ?? "Lỗi request")
                }
            } else {
                failure?("Cannot parse json")
            }
        }
    }
    
    static func requestList <T: Mappable>(apiRouter:  BaseAPIRouter, object: T.Type, success: (([T]?)->())?, failure: ((_ message: String)->())?) {
        
        print("=========== API LOG ================")
        print("\(apiRouter.method().rawValue) request: \(apiRouter.fullURL())\n ======================= \n")
        print("Param: \(apiRouter.param()) \n ============================== \n")
        
        AF.request(apiRouter.fullURL(), method: apiRouter.method(), parameters: apiRouter.param(), headers: apiRouter.header()).responseJSON { (response) in
            if let json = response.data?.toJSONSTring() {
                let data = BaseResponse<T>(JSONString: json)
                switch response.result {
                case .success:
                    success?(data?.data)
                case .failure:
                    failure?(data?.message ?? "Lỗi request list")
                }
            }
        }
    }
}

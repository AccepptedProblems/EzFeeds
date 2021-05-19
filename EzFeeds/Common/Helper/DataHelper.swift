//
//  DataHelper.swift
//  EzFeeds
//
//  Created by Nam on 15/05/2021.
//

import Foundation
import ObjectMapper

struct DataHelper {
    static func dicToData(dic: [String: Any]) -> Data{
        if let jsonData = try? JSONSerialization.data(withJSONObject: dic, options: .prettyPrinted) {
            return jsonData
        }
        return Data()
    }
    
    static func jsonToString(json: [String: Any]) -> String{
        do {
            let data1 = try JSONSerialization.data(withJSONObject: json, options: JSONSerialization.WritingOptions.sortedKeys)
            let convertedString = String(data: data1, encoding: String.Encoding.utf8) as NSString? ?? ""
            return convertedString as String
        } catch let myJSONError {
            debugPrint(myJSONError)
            return ""
        }
    }
    
    static func dataToDict (data: Data?) -> [String: Any] {
        guard let trueData = data else {return [:]}
        do{
            if let json = try JSONSerialization.jsonObject(with: trueData, options: []) as? [String : Any] {
                return json
            }
        }catch{ print("erroMsg") }
        return [:]
    }
}

extension Data {
    func toJSONSTring() -> String {
        do{
            if let json = try JSONSerialization.jsonObject(with: self, options:[]) as? [String : Any] {
                return DataHelper.jsonToString(json: json)
            }
        }catch{ print("erroMsg") }
        return ""
    }
}

extension String {
}

//
//  BookmarkDataManager.swift
//  EzFeeds
//
//  Created by Nam on 20/05/2021.
//

import Foundation

class BookmarkDataManager {
    var listBookmark = [BookmarkModel] ()
    
    func getListBookmark(success: (()->())?, failure: ((_ error: String)->())?){
        APIRequest.requestList(apiRouter: EZAppApỉouter.getlistBookmark(id: ""), object: BookmarkModel.self) { [weak self] (result) in
            if let data = result {
                self?.listBookmark = data
                success?()
                return 
            }
            failure?("Không thể lấy list bookmark")
        } failure: { (error) in
            print(error)
        }

    }
}

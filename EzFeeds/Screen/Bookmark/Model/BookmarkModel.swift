//
//  BookmarkModel.swift
//  EzFeeds
//
//  Created by Nam on 15/04/2021.
//

import Foundation
import RealmSwift

class BookmarkModel: Object {
    @objc dynamic var title: String = ""
    @objc dynamic var desc: String = ""
    @objc dynamic var urlImg: String = ""
    @objc dynamic var urlArticle: String = ""
}

//
//  CategoryModel.swift
//  EzFeeds
//
//  Created by Nam on 10/04/2021.
//

import Foundation
import UIKit

enum CategoryType: CaseIterable {
    case general
    case business
    case entertainment
    case health
    case science
    case sport
    case technology
    
    func param() -> String {
        switch self {
        case .general:
            return "general"
        case .business:
            return "business"
        case .entertainment:
            return "entertainment"
        case .health:
            return "health"
        case .science:
            return "science"
        case .sport:
            return "sports"
        case .technology:
            return "technology"
        }
    }
    
    func title() -> String {
        switch self {
        case .general:
            return "General"
        case .business:
            return "Business"
        case .entertainment:
            return "Entertainment"
        case .health:
            return "Health"
        case .science:
            return "Science"
        case .sport:
            return "Sports"
        case .technology:
            return "Technology"
        }
    }
    
    func imageStr() -> String {
        switch self {
        case .general:
            return "General"
        case .business:
            return "Business"
        case .entertainment:
            return "Entertainment"
        case .health:
            return "Health"
        case .science:
            return "Science"
        case .sport:
            return "sport_img"
        case .technology:
            return "techno_img"
        }
    }
    
    func subtitle() -> String {
        switch self {
        case .general:
            return "General"
        case .business:
            return "Business"
        case .entertainment:
            return "Entertainment"
        case .health:
            return "Health"
        case .science:
            return "Science"
        case .sport:
            return "Sports"
        case .technology:
            return "techno_img"
        }
    }
}

//
//  ProfileDataManager.swift
//  EzFeeds
//
//  Created by Nam on 05/05/2021.
//

import UIKit

class ProfileDataManager {
    var listEmail = [ProfileModel]()
    var listInfo = [ProfileModel]()
    var listConfig = [ProfileModel]()
    
    init() {
        for type in ProfileId.allCases {
            let model = ProfileModel(type: type)
            if type == .email {
                listEmail.append(model)
            } else if type == .name || type == .country || type == .city {
                listInfo.append(model)
            } else {
                listConfig.append(model)
            }
        }
    }
}

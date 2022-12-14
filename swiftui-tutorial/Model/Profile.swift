//
//  Profile.swift
//  swiftui-tutorial
//
//  Created by ιΆι’ε on 2022/12/3.
//

import Foundation


struct Profile {
    var username: String
    var prefersNotifications: Bool = true
    var sesonalPhoto = Season.winter
    var goalDate = Date()
    
    static let `default` = Profile(username: "g_kumar")
    
    enum Season: String, CaseIterable, Identifiable {
        case spring = "π·"
        case summer = "π"
        case autumn = "π"
        case winter = "βοΈ"
        
        var id: String { rawValue }
    }
}

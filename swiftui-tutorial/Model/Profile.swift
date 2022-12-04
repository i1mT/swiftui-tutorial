//
//  Profile.swift
//  swiftui-tutorial
//
//  Created by 陶逢华 on 2022/12/3.
//

import Foundation


struct Profile {
    var username: String
    var prefersNotifications: Bool = true
    var sesonalPhoto = Season.winter
    var goalDate = Date()
    
    static let `default` = Profile(username: "g_kumar")
    
    enum Season: String, CaseIterable, Identifiable {
        case spring = "🌷"
        case summer = "🌞"
        case autumn = "🍂"
        case winter = "☃️"
        
        var id: String { rawValue }
    }
}

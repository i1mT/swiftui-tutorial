//
//  todoApp.swift
//  todo
//
//  Created by 陶逢华 on 2022/11/27.
//

import SwiftUI

@main
struct tutorialApp: App {
    @StateObject private var modelData = ModelData()
    var body: some Scene {
        WindowGroup {
            ContentView()
                .environmentObject(modelData)
        }
    }
}

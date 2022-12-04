//
//  ModelData.swift
//  swiftui-tutorial
//
//  Created by 陶逢华 on 2022/11/29.
//

import Foundation
import Combine

final class ModelData: ObservableObject {
    @Published var landmarks: [LandMark] = load("landmarkData.json")
    @Published var profile = Profile.default
    
    var hikes: [Hike] = load("hikeData.json")
    
    var categories: [String: [LandMark]] {
        Dictionary(grouping: landmarks, by: {$0.category.rawValue})
    }
    var features: [LandMark] {
        landmarks.filter { $0.isFeatured }
    }
}


func load<T: Decodable>(_ fileName: String) -> T {
    let data: Data
    
    guard let file = Bundle.main.url(forResource: fileName, withExtension: nil)
    else {
        fatalError("Could not find \(fileName) in the main bundle.")
    }
    
    do {
        data = try Data(contentsOf: file)
    } catch {
        fatalError("Could not load \(fileName) from main bundle: \n\(error)")
    }
    
    do {
        let decoder = JSONDecoder()
        return try decoder.decode(T.self, from: data)
    } catch {
        fatalError("Could not parse \(fileName) as \(T.self): \n\(error)")
    }
}

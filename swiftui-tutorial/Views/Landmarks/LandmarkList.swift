//
//  LandmarkList.swift
//  swiftui-tutorial
//
//  Created by 陶逢华 on 2022/11/29.
//

import SwiftUI

struct LandmarkList: View {
    @EnvironmentObject var modelData: ModelData
    @State private var showFavoritesOnly = false
    
    var filtererLandmarks: [LandMark] {
        modelData.landmarks.filter { landmark in
            (!showFavoritesOnly || landmark.isFavorite)
        }
    }
    
    var body: some View {
        NavigationView {
            List {
                Toggle(isOn: $showFavoritesOnly) {
                    Text("Favorites only")
                }
                
                ForEach(filtererLandmarks) { landmark in
                    NavigationLink {
                        LandmarkDetail(landmadk: landmark)
                    } label: {
                        LandmarkRow(landmark: landmark)
                    }
                    .navigationTitle("Landmarks")
                }
            }
        }
        
    }
}

struct LandmarkList_Previews: PreviewProvider {
    static var previews: some View {
        LandmarkList()
            .environmentObject(ModelData())
    }
}

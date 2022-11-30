//
//  LandmarkDetail.swift
//  swiftui-tutorial
//
//  Created by 陶逢华 on 2022/11/29.
//

import SwiftUI

struct LandmarkDetail: View {
    @EnvironmentObject var modelData: ModelData
    var landmadk: LandMark
    var landmarkIndex: Int {
        modelData.landmarks.firstIndex(where: { $0.id == landmadk.id })!
    }
    
    var body: some View {
        ScrollView {
            MapView(coordinate: landmadk.locationCoordinate)
                .frame(height: 300)
                .ignoresSafeArea(edges: .top)
            CircleImage(image: landmadk.image)
                .offset(y: -130)
                .padding(.bottom, -130)
            VStack(alignment: .leading) {
                HStack{
                    Text(landmadk.name)
                        .font(.title)
                    FavoriteButton(isSet: $modelData.landmarks[landmarkIndex].isFavorite)
                }
                HStack {
                    Text(landmadk.park)
                        .font(.subheadline)
                    Spacer()
                    Text(landmadk.state)
                        .font(.subheadline)
                }
                
                Divider()
                
                Text("Abour \(landmadk.name)")
                    .font(.title2)
                Text(landmadk.description)
                
            }
            .padding()
        }
        .navigationTitle(landmadk.name)
        .navigationBarTitleDisplayMode(.inline)
    }
}

struct LandmarkDetail_Previews: PreviewProvider {
    static let modelData = ModelData()
    
    static var previews: some View {
        LandmarkDetail(landmadk: modelData.landmarks[0])
            .environmentObject(modelData)
    }
}

//
//  LandmarkRow.swift
//  swiftui-tutorial
//
//  Created by 陶逢华 on 2022/11/29.
//

import SwiftUI

struct LandmarkRow: View {
    var landmark: LandMark
    
    var body: some View {
        HStack{
            landmark.image
                .resizable()
                .frame(width: 50, height: 50)
            Text(landmark.name)
            Spacer()
        }
    }
}

struct LandmarkRow_Previews: PreviewProvider {
    static var previews: some View {
        Group {
            LandmarkRow(landmark: landmarks[0])
        }
        .previewLayout(.fixed(width: 300, height: 70))
        
    }
}

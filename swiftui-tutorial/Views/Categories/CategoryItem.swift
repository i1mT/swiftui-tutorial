//
//  CategoryItem.swift
//  swiftui-tutorial
//
//  Created by 陶逢华 on 2022/12/3.
//

import SwiftUI

struct CategoryItem: View {
    var landmark: LandMark
    var body: some View {
        VStack(alignment: .leading) {
            landmark.image
                .renderingMode(.original)
                .resizable()
                .frame(width: 155, height: 155)
                .cornerRadius(5)
            
            Text(landmark.name)
                .foregroundColor(.primary)
                .font(.caption)
        }
        .padding(.leading, 15)
    }
}

struct CategoryItem_Previews: PreviewProvider {
    static var landmark = ModelData().landmarks[0]
    static var previews: some View {
        CategoryItem(landmark: landmark)
    }
}

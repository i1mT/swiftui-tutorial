//
//  CircleImage.swift
//  swiftui-tutorial
//
//  Created by 陶逢华 on 2022/11/29.
//

import SwiftUI


struct CircleImage: View {
    var image: Image
    var body: some View {
        image
            .clipShape(Circle())
            .overlay{
                Circle().stroke(.white, lineWidth: 4)
            }
            .shadow(radius: 7)
    }
}

struct Circle_ImagePreviews: PreviewProvider {
    static var previews: some View {
        CircleImage(image: Image("icybay"))
    }
}

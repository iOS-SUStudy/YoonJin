//
//  CircleImage.swift
//  Landmarks
//
//  Created by 이윤진 on 2020/08/20.
//  Copyright © 2020 이윤진. All rights reserved.
//
//
import SwiftUI

struct CircleImage: View {
    var image: Image
    var body: some View {
        
        image
            .clipShape(Circle())
            .overlay(
                Circle().stroke(Color.white, lineWidth: 4))
            .shadow(radius: 10)
        
    }
}

struct CircleImage_Previews: PreviewProvider {
    static var previews: some View {
        CircleImage(image: Image("turtlerock"))
    }
}

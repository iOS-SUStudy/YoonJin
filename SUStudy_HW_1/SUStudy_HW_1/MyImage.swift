//
//  MyImage.swift
//  SUStudy_HW_1
//
//  Created by 이윤진 on 2020/08/20.
//  Copyright © 2020 이윤진. All rights reserved.
//

import SwiftUI

struct MyImage: View {
    var body: some View {
        Image("myImage").resizable()
            .frame(width: 100.0)
            .frame(height: 100.0)
            .clipShape(Circle()) // 이미지 모양 결정
            .overlay( // 이미지 속성 결정, 색삭 및 라인두께
                Circle().stroke(Color.white,lineWidth: 4))
            .shadow(radius: 10)
    }
}

struct MyImage_Previews: PreviewProvider {
    static var previews: some View {
        MyImage()
    }
}

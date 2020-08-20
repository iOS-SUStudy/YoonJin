//
//  ContentView.swift
//  SUStudy_HW_1
//
//  Created by 이윤진 on 2020/08/20.
//  Copyright © 2020 이윤진. All rights reserved.
//

import SwiftUI

struct ContentView: View {
    var body: some View {
        VStack {
            MapView()
            MyImage()
                .offset(y:-300)
                .padding(.bottom, -200)
            VStack{
                Text("윤진즈 홈스윗홈")
                    .font(.title)
                    .foregroundColor(Color.black)
                Text("270, Sinbanpo-ro, Seocho-gu")
                    .font(.subheadline)
            }
            
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}

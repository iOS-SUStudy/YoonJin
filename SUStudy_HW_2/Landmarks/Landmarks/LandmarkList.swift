//
//  LandmarkList.swift
//  Landmarks
//
//  Created by 이윤진 on 2020/08/31.
//  Copyright © 2020 이윤진. All rights reserved.
//

import SwiftUI

struct LandmarkList: View {
   
    init(){
        UITableView.appearance().separatorColor = .clear
    }
    var body: some View {
        NavigationView{
            List(landmarkData) { landmark in
                NavigationLink(destination: LandmarkDetail(landmark: landmark)) {
                LandmarkRow(landmark: landmark)
                }
            }
        
        .navigationBarTitle(Text("Landmarks"))
        }
    }
}

struct LandmarkList_Previews: PreviewProvider {
    static var previews: some View {
        LandmarkList()
    }
}

//
//  LandmarkList.swift
//  Landmarks
//
//  Created by 이윤진 on 2020/08/31.
//  Copyright © 2020 이윤진. All rights reserved.
//

import SwiftUI

struct LandmarkList: View {
    
    //@State var showFavoritesOnly = true
     @EnvironmentObject var userData: UserData
    var body: some View {
        NavigationView{
            List{
                Toggle(isOn: $userData.showFavoritesOnly){
                    Text("Favorites only")
                }
                ForEach(userData.landmarks){landmark in
                    if !self.userData.showFavoritesOnly || landmark.isFavorite { NavigationLink(
                    destination: LandmarkDetail(landmark: landmark).environmentObject(self.userData)
                    ){
                        LandmarkRow(landmark: landmark)
                        }
                        
                    }
                    
                }
            }
            .navigationBarTitle(Text("Landmarks"))
        }
    }
}

struct LandmarkList_Previews: PreviewProvider {
    static var previews: some View {
        LandmarkList()
        .environmentObject(UserData())
    }
}

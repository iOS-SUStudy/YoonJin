//
//  ContentView.swift
//  Landmarks
//
//  Created by 이윤진 on 2020/08/13.
//  Copyright © 2020 이윤진. All rights reserved.
//

import SwiftUI

struct LandmarkDetail: View {
    @EnvironmentObject var userData: UserData
    var landmark: Landmark
    
    var landmarkIndex: Int {
        userData.landmarks.firstIndex(where: { $0.id == landmark.id })!
    }
    
    var body: some View {
        VStack {
            
            MapView(coordinate: landmark.locationCoordinate)
                .edgesIgnoringSafeArea(.top)
                .frame(height : 300)
            
            CircleImage(image: landmark.image)
                .offset(y : -130)
                .padding(.bottom, -130)

            
            VStack(alignment : .leading) {
                HStack {
                    Text(landmark.name)
                        .font(.title)
                        .foregroundColor(.black)
                    Button(action: {
                        self.userData.landmarks[self.landmarkIndex].isFavorite.toggle()
                    }) {
                        if self.userData.landmarks[self.landmarkIndex].isFavorite {
                            Image(systemName: "star.fill")
                                .foregroundColor(Color.yellow)
                        } else {
                            Image(systemName: "star")
                                .foregroundColor(Color.gray)
                        }
                    }
                }
                Text(landmark.category.rawValue)
                    .font(.subheadline)
                HStack {
                    Text(landmark.park)
                        .font(.subheadline)
                    Spacer()
                    
                    Text(landmark.state)
                        .font(.subheadline)
                    
                }
                
            }
            .padding()
            Spacer()
        }
        .navigationBarTitle(Text(landmark.name),displayMode: .inline)
    }
}

struct LandmarkDetail_Previews: PreviewProvider {
    static var previews: some View {
        LandmarkDetail(landmark: landmarkData[0]).environmentObject(UserData())
    }
}

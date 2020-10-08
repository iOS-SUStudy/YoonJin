//
//  ProfileEditor.swift
//  Landmarks
//
//  Created by 이윤진 on 2020/10/08.
//  Copyright © 2020 Apple. All rights reserved.
//

import SwiftUI

struct ProfileEditor: View {
    @Binding var profile: Profile
    
    var body: some View {
        List {
            HStack {
                Text("Username").bold()
                Divider()
                TextField("Username", text: $profile.username)
            }
            Toggle(isOn: $profile.prefersNotifications) {
                Text("Enable Notifications")
            }
            VStack(alignment: .leading, spacing: 20) {
                Text("Seasonal Photo").bold()
                
                Picker("Seasonal Photo", selection: $profile.seasonalPhoto) {
                    ForEach(Profile.Season.allCases, id: \.self) { season in
                        Text(season.rawValue).tag(season)
                    }
                }
                .pickerStyle(SegmentedPickerStyle())
            }
            .padding(.top)
        }
    }
    
    struct ProfileEditor_Previews: PreviewProvider {
        static var previews: some View {
            ProfileEditor(profile: .constant(.default))
    }
}
}

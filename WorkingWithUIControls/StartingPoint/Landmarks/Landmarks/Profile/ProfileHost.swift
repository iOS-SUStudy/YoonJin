//
//  ProfileHost.swift
//  Landmarks
//
//  Created by 이윤진 on 2020/10/08.
//  Copyright © 2020 Apple. All rights reserved.
//

import SwiftUI

struct ProfileHost: View {
    
    @State var draftProfile = Profile.default
    @Environment(\.editMode) var mode
    @EnvironmentObject var userData: UserData
    
    
    var body: some View {
        VStack(alignment: .leading, spacing: 20) {
            HStack {
                if self.mode?.wrappedValue == .active {
                    Button("Cancel") {
                        self.draftProfile = self.userData.profile
                        self.mode?.animation().wrappedValue = .inactive
                    }
                }
                Spacer()
                EditButton()
            }
            
            if self.mode?.wrappedValue == .inactive {
                ProfileSummary(profile: userData.profile)
            } else {
                ProfileEditor(profile: $draftProfile)
                    .onAppear {
                        self.draftProfile = self.userData.profile
                    }
                    .onDisappear {
                        self.userData.profile = self.draftProfile
                    }
                
                
            }
            
            
        }
        .padding()
    }
}

struct ProfileHost_Previews: PreviewProvider {
    static var previews: some View {
        ProfileHost().environmentObject(UserData())
    }
}

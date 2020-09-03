//
//  UserData.swift
//  Landmarks
//
//  Created by 이윤진 on 2020/08/31.
//  Copyright © 2020 이윤진. All rights reserved.
//

import SwiftUI
import Combine

final class UserData: ObservableObject{
    @Published var showFavoritesOnly = false
    @Published var landmarks = landmarkData
}

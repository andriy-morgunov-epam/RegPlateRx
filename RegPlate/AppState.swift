//
//  AppState.swift
//  RegPlateRx
//
//  Created by Andriy Morgunov on 05.01.2022.
//  Copyright © 2022 Andriy Morgunov. All rights reserved.
//

import SwiftUI
import Combine

class AppState: ObservableObject {
    var userData = UserData()
}

extension AppState {
    struct UserData: Equatable {
    }
}

//
//  RegPlateApp.swift
//  RegPlateRx
//
//  Created by Andriy Morgunov on 04.01.2022.
//  Copyright © 2022 Andriy Morgunov. All rights reserved.
//

import SwiftUI

@main
struct RegPlateApp: App {

    // MARK: Stored Properties
    @StateObject var coordinator = HomeCoordinator(/*plateService: PlateService()*/)
    @StateObject var appState = AppState()

    // MARK: Scenes
    var body: some Scene {
        WindowGroup {
            HomeCoordinatorView(coordinator: coordinator)
                .environmentObject(appState)
        }
    }
}

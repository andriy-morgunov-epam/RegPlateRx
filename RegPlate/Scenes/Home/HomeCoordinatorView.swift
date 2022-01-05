//
//  CoordinatorView.swift
//  RegPlateRx
//
//  Created by Andriy Morgunov on 04.01.2022.
//  Copyright © 2022 Andriy Morgunov. All rights reserved.
//

import SwiftUI

struct HomeCoordinatorView: View {

    @ObservedObject var coordinator: HomeCoordinator
    
    var body: some View {
        TabView(selection: $coordinator.tab) {
            PlateListCoordinatorView(coordinator: coordinator.plateListCoordinator)
                .tabItem { Label("Search", systemImage: "hare.fill") }
                .tag(HomeCoordinatorOptions.search)
        }
//        .sheet(item: $coordinator.openedURL) {
//            SafariView(url: $0)
//                .edgesIgnoringSafeArea(.all)
//        }
    }
}

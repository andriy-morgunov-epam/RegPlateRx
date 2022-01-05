//
//  CoordinatorView.swift
//  RegPlateRx
//
//  Created by Andriy Morgunov on 04.01.2022.
//  Copyright © 2022 Andriy Morgunov. All rights reserved.
//

import SwiftUI

struct PlateListCoordinatorView: View {

    @ObservedObject var coordinator: PlateListCoordinator
    
    var body: some View {
//        NavigationView {
        PlateListView(viewModel: coordinator.viewModel)
//               .navigation(item: object.detailViewModel) { /* DetailView(viewModel: $0) */ }
//        }
    }
}

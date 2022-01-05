//
//  CoordinatorObject.swift
//  RegPlateRx
//
//  Created by Andriy Morgunov on 04.01.2022.
//  Copyright © 2022 Andriy Morgunov. All rights reserved.
//

import Foundation

enum HomeCoordinatorOptions {
    case search
}
class HomeCoordinator: ObservableObject {

    @Published var tab = HomeCoordinatorOptions.search
    @Published var plateListCoordinator: PlateListCoordinator!
//    @Published var openedURL: URL?

//    private let recipeService: RecipeService

    init() {
        self.plateListCoordinator = .init(
            title: "Search",
//            plateService: plateService,
            parent: self
        )
    }
    
    func switchToTabOne() {
        self.tab = .search
    }
}

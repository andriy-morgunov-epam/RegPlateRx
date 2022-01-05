//
//  CoordinatorObject.swift
//  RegPlateRx
//
//  Created by Andriy Morgunov on 04.01.2022.
//  Copyright © 2022 Andriy Morgunov. All rights reserved.
//

import Foundation

class PlateListCoordinator: ObservableObject {

    @Published var viewModel: PlatesUAViewModel!
//    @Published var detailViewModel: DetailViewModel?
//    @Published var sheetViewModel: SheetViewModel?

//    private let plateService: PlateService
    private unowned let parent: HomeCoordinator

    init(
        title: String,
        //        plateService: PlateService,
        parent: HomeCoordinator
    ) {
//        self.plateService = plateService
        self.parent = parent
        self.viewModel = PlatesUAViewModel(
//            plateService: plateService,
            coordinator: self
        )
    }
//
    func open(_ item: String/*ListItem*/) {
//        self.detailViewModel = DetailViewModel(item: item, coordinator: self)
    }
//
//    func openSheet(_ info: SheetInformation) {
//        self.sheetViewModel = SheetViewModel(info: info)
//    }
}

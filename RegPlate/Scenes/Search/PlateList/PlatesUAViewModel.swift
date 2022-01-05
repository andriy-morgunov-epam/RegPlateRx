//
//  PlatesUAViewModel.swift
//  RegPlateRx
//
//  Created by Andriy Morgunov on 10/21/16.
//  Copyright © 2016 Andriy Morgunov. All rights reserved.
//

import Foundation
import Combine
import SwiftUI

class PlatesUAViewModel: ObservableObject {
    private var subscriptions = Set<AnyCancellable>()
    
    private let model: UA.CountryPlates

    @Published var search: String = ""
    @Published var items: [PlateUAViewModel] = []
    private unowned let coordinator: PlateListCoordinator

    init (
        _ model: UA.CountryPlates = UA.CountryPlates(),
        coordinator: PlateListCoordinator
    ) {
        self.coordinator = coordinator
        self.model = model
        
        // testing ONLY
        // model.plug_stub()

        self.$search.sink { [weak self] text in
            self?.refresh(text)
        }
        .store(in: &subscriptions)
    }
    
    func refresh(_ filter: String) -> Void {
        if let plates = self.model.provider?.plates(with: filter) {

            self.items = plates.map { self.viewModel(for: $0) }
        }
    }
    
    private func viewModel(for model: UA.CountryPlate) -> PlateUAViewModel {
        let result = PlateUAViewModel(model)
        
        return result
    }

//    func open(_ item: String/*ListItem*/) {
//        coordinator.open(item)
//    }
}

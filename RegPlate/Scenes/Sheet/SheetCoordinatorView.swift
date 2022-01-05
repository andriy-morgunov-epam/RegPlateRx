//
//  CoordinatorView.swift
//  RegPlateRx
//
//  Created by Andriy Morgunov on 04.01.2022.
//  Copyright © 2022 Andriy Morgunov. All rights reserved.
//

import SwiftUI

struct SheetCoordinatorView: View {

    @ObservedObject var object: SheetCoordinatorObject
    
    var body: some View {
        Text("Hello, World!")
//            .sheet(item: $object.sheetViewModel) {
//                SomeSheet(viewModel: $0)
//        }
    }
}

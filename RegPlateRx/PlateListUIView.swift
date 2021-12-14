//
//  PlateUAMotobikeCellUIView.swift
//  RegPlateRx
//
//  Created by Andriy Morgunov on 20.09.2021.
//  Copyright © 2021 Andriy Morgunov. All rights reserved.
//

import SwiftUI

struct PlateListUIView: View {

    @StateObject private var viewModel = PlatesUAViewModel()
    @State private var showingAlert = false

    var body: some View {

        ZStack {

            VStack(spacing: 0) {
                    Color.blue
                    Color.yellow
                }

            VStack {

                HStack {

                    TextField("AB3707EB", text: self.$viewModel.search)
                        .textFieldStyle(RoundedBorderTextFieldStyle())
                        .textCase(.uppercase)

                    Button {
                        print("Help?")
                        self.showingAlert = true
                    } label: {
                        Label("Help!", systemImage: "pencil")
                    }
                    .alert("Important message", isPresented: $showingAlert) {
                            Button("OK") { }
                        }
                        message: {
                            Text("Please read this.")
                        }
                }
                .padding(20)

                List {
                    ForEach(self.viewModel.items) { item in
                        let plateModel = item.model
                        switch plateModel {
                        case
                            is PlateUAAuto04,
                            is PlateUAAuto15:                         AnyView(PlateUAAutoCellUIView(model: plateModel))
                        case
                            is PlateUAAutoTemporary04,
                            is PlateUAAutoTemporary15,
                            is PlateUAAutoTemporaryDealer04,
                            is PlateUAAutoTemporaryDealer15:
                                AnyView(PlateUAAutoTemporaryCellUIView(model: plateModel))
                        case
                            is PlateUAMotocycle04,
                            is PlateUAMotocycle15,
                            is PlateUAMotocycleTemporary04,
                            is PlateUAMotocycleTemporary15,
                            is PlateUAMotocycleTemporaryDealer04,
                            is PlateUAMotocycleTemporaryDealer15:
                                AnyView(PlateUAMotocycleCellUIView(model: plateModel))
                        case
                            is PlateUAMotobike04,
                            is PlateUAMotobikeTemporary04,
                            is PlateUAMotobikeTemporaryDealer04:
                                AnyView(PlateUAMotobikeCellUIView(model: plateModel))
                        default:
                                AnyView(EmptyView())
                        }
                    }
                }
                .background(.ultraThinMaterial)

                Spacer()
            }
            .background(.ultraThinMaterial)

            /*
                        ScrollView {
                            Group {
                                PlateUAAutoCellUIView(model: PlateUAAuto04("AB3707EB"))
                                PlateUAAutoCellUIView(model: PlateUAAuto15("AB3707EB"))
                                PlateUAAutoCellUIView(model: PlateUAAutoTaxi04("AB3707EB"))
                                PlateUAAutoCellUIView(model: PlateUAAutoTaxi15("AB3707EB"))
                            }
                            Group {
                                PlateUAAutoTemporaryCellUIView(model:  PlateUAAutoTemporary04("02AA4215"))
                                PlateUAAutoTemporaryCellUIView(model:  PlateUAAutoTemporary15("02AA4215"))
                                PlateUAAutoTemporaryCellUIView(model:  PlateUAAutoTemporaryDealer04("T1CP5140"))
                                PlateUAAutoTemporaryCellUIView(model:  PlateUAAutoTemporaryDealer15("T1CP5140"))
                                PlateUAMotocycleCellUIView(model: PlateUAMotocycle04("AB3707EB"))
                                PlateUAMotocycleCellUIView(model:  PlateUAMotocycle15("AB3707EB"))
                            }
                            Group {
                                PlateUAMotocycleCellUIView(model:  PlateUAMotocycleTemporary04("224215AA"))
                                PlateUAMotocycleCellUIView(model: PlateUAMotocycleTemporary15("224215AA"))
                                PlateUAMotocycleCellUIView(model: PlateUAMotocycleTemporaryDealer04("T14242AA"))
                                PlateUAMotocycleCellUIView(model: PlateUAMotocycleTemporaryDealer15("T14242AA"))
                                PlateUAMotobikeCellUIView(model: PlateUAMotobike04("ABEB3707"))
                                PlateUAMotobikeCellUIView(model: PlateUAMotobikeTemporary04("01AA0001"))
                                PlateUAMotobikeCellUIView(model: PlateUAMotobikeTemporaryDealer04("T1AA0001"))
                            }
                        }
             */
            
        }
    }
}

struct PlateListUIView_Previews: PreviewProvider {
    static var previews: some View {

        PlateListUIView()
    }
}

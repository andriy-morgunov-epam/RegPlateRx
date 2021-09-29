//
//  PlateUAMotobikeCellUIView.swift
//  RegPlateRx
//
//  Created by Andriy Morgunov on 20.09.2021.
//  Copyright © 2021 Andriy Morgunov. All rights reserved.
//

import SwiftUI

struct PlateListUIView: View {
    let models : [Plate<String>]

    var body: some View {

        List {
            PlateUAAutoCellUIView(model: PlateUAAuto04("AB3707EB"))
            PlateUAAutoCellUIView(model: PlateUAAuto15("AB3707EB"))
            PlateUAAutoCellUIView(model: PlateUAAutoTaxi04("AB3707EB"))
            PlateUAAutoCellUIView(model: PlateUAAutoTaxi15("AB3707EB"))
            PlateUAAutoTemporaryCellUIView(model:  PlateUAAutoTemporary04("02AA4215"))
            PlateUAAutoTemporaryCellUIView(model:  PlateUAAutoTemporary15("02AA4215"))
            PlateUAAutoTemporaryCellUIView(model:  PlateUAAutoTemporaryDealer04("T1CP5140"))
            PlateUAAutoTemporaryCellUIView(model:  PlateUAAutoTemporaryDealer15("T1CP5140"))
            PlateUAMotocycleCellUIView(model: PlateUAMotocycle04("AB3707EB"))
            PlateUAMotocycleCellUIView(model:  PlateUAMotocycle15("AB3707EB"))
        }
        List {
            PlateUAMotocycleCellUIView(model:  PlateUAMotocycleTemporary04("224215AA"))
            PlateUAMotocycleCellUIView(model: PlateUAMotocycleTemporary15("224215AA"))
            PlateUAMotocycleCellUIView(model: PlateUAMotocycleTemporaryDealer04("T14242AA"))
            PlateUAMotocycleCellUIView(model: PlateUAMotocycleTemporaryDealer15("T14242AA"))
            PlateUAMotobikeCellUIView(model: PlateUAMotobike04("ABEB3707"))
            PlateUAMotobikeCellUIView(model: PlateUAMotobikeTemporary04("01AA0001"))
            PlateUAMotobikeCellUIView(model: PlateUAMotobikeTemporaryDealer04("T1AA0001"))
        }
    }

}

struct PlateListUIView_Previews: PreviewProvider {
    static var previews: some View {

        PlateListUIView(models: [])
    }
}

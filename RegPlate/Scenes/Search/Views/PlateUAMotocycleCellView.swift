//
//  PlateUAMotocycleCellView.swift
//  RegPlateRx
//
//  Created by Andriy Morgunov on 20.09.2021.
//  Copyright © 2021 Andriy Morgunov. All rights reserved.
//

import SwiftUI

struct PlateUAMotocycleCellView: View {
    let model : UA.CountryPlate

    var body: some View {

        VStack {
            ZStack(){
                PlateImage
                PlateText
            }
        }
        .frame(height: 190, alignment: .center)
    }

    @ViewBuilder private var PlateText: some View {
        let prefix = (self.model.properties[UA.CountryPlate.Properties.kPrefix.rawValue] as? String) ?? "??"
        let body: String = (self.model.properties[UA.CountryPlate.Properties.kBody.rawValue] as? String) ?? "XXXX"
        let suffix: String = (self.model.properties[UA.CountryPlate.Properties.kSuffix.rawValue] as? String) ?? "??"
        let plateMode =  (self.model.properties[UA.CountryPlate.Properties.kMode.rawValue] as?  UA.PlateMode) ?? .regular
        let isTemporary = plateMode == .temporary

        let fontSize:  CGFloat = isTemporary ? 52.0 : 48.0

        VStack() {
            self.plateText(prefix, fontSize: 48.0, isTemporary: isTemporary)
            self.plateText(body, fontSize: fontSize, isTemporary: isTemporary)
            self.plateText(suffix, fontSize: fontSize, isTemporary: isTemporary)
        }
        .padding(EdgeInsets(top: 0, leading: 20, bottom: 0, trailing: 0))
    }

    @ViewBuilder private var PlateImage: some View {
        let plateType = (self.model.properties[UA.CountryPlate.Properties.kPlateType.rawValue] as? UA.PlateType)?.rawValue ?? "??"

        GeometryReader { geo in
            Image(plateType)
                .resizable()
                .aspectRatio(contentMode: .fit)
                .frame(width: geo.size.width)
        }
    }

    private func plateText(_ text: String, fontSize: CGFloat, isTemporary: Bool) -> Text {

        return Text(text)
            .foregroundColor(isTemporary ? .white : .black)
            .font(.system(size: fontSize))
            .bold()
    }
}

struct PlateUAMotocycleCellView_Previews: PreviewProvider {
    static var previews: some View {

        Group {
            VStack {
                ForEach([
                    PlateUAMotocycle04("AB3707EB"),
                    PlateUAMotocycle15("AB3707EB"),
                ]) { model in
                    PlateUAMotocycleCellView(model: model)
                        .listRowInsets(EdgeInsets())
                }
            }
            VStack {
                ForEach([
                    PlateUAMotocycleTemporary04("224215AA"),
                    PlateUAMotocycleTemporary15("224215AA"),
                    PlateUAMotocycleTemporaryDealer04("T14242AA"),
                    PlateUAMotocycleTemporaryDealer15("T14242AA")
                ]) { model in
                    PlateUAMotocycleCellView(model: model)
                        .listRowInsets(EdgeInsets())
                }
            }
        }
    }
}

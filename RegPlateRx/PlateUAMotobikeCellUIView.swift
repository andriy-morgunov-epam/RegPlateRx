//
//  PlateUAMotobikeCellUIView.swift
//  RegPlateRx
//
//  Created by Andriy Morgunov on 20.09.2021.
//  Copyright © 2021 Andriy Morgunov. All rights reserved.
//

import SwiftUI

struct PlateUAMotobikeCellUIView: View {
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
        let textColor: Color = self.isTemporary ? .white : . black

        VStack() {
            HStack() {
                self.plateText(prefix)
                    .foregroundColor(textColor)
                self.plateText(body)
                    .foregroundColor(textColor)
            }
            self.plateText(suffix)
                .foregroundColor(textColor)
        }
        .padding(EdgeInsets(top: 0, leading: 36, bottom: 0, trailing: 0))
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

    private func plateText(_ text: String) -> Text {
        return Text(text)
            .font(.system(size: 60))
            .bold()
    }

    private var isTemporary: Bool {

        let plateMode = (self.model.properties[UA.CountryPlate.Properties.kMode.rawValue] as? UA.PlateMode) ?? .regular

        return plateMode == .temporary
    }
}

struct PlateUAMotobikeCellUIView_Previews: PreviewProvider {
    static var previews: some View {

        Group {
            VStack {
                ForEach([
                    PlateUAMotobike04("ABEB3707"),
                    PlateUAMotobikeTemporary04("01AA0001"),
                    PlateUAMotobikeTemporaryDealer04("T1AA0001")
                ]) { model in
                    PlateUAMotobikeCellUIView(model: model)
                        .listRowInsets(EdgeInsets())
                }
            }
        }
    }
}

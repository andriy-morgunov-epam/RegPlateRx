//
//  PlateUAAutoTemporaryCellUIView.swift
//  RegPlateRx
//
//  Created by Andriy Morgunov on 20.09.2021.
//  Copyright © 2021 Andriy Morgunov. All rights reserved.
//

import SwiftUI

struct PlateUAAutoTemporaryCellUIView: View {
    let model : UA.CountryPlate

    var body: some View {

        VStack {
            ZStack(){
                PlateImage
                PlateText
            }
        }
        .frame(height: 70, alignment: .center)
    }

    @ViewBuilder private var PlateText: some View {
        let prefix = (self.model.properties[UA.CountryPlate.Properties.kPrefix.rawValue] as? String) ?? "??"
        let body: String = (self.model.properties[UA.CountryPlate.Properties.kBody.rawValue] as? String) ?? "XXXX"
        let suffix: String = (self.model.properties[UA.CountryPlate.Properties.kSuffix.rawValue] as? String) ?? "??"

        HStack(alignment: .bottom) {
            self.plateText(prefix)
                .font(.system(size: 44))
                .padding(EdgeInsets(top: 0, leading: 0, bottom: 3, trailing: 0))
            self.plateText(body)
                .font(.system(size: 56))
            self.plateText(suffix)
                .font(.system(size: 56))
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

    private func plateText(_ text: String) -> Text {
        return Text(text)
            .foregroundColor(.white)
    }
}

struct PlateUAAutoTemporaryCellUIView_Previews: PreviewProvider {
    static var previews: some View {

        Group {
            VStack {
                ForEach([
                    PlateUAAutoTemporary04("02AA4215"),
                    PlateUAAutoTemporary15("02AA4215"),
                    PlateUAAutoTemporaryDealer04("T1CP5140"),
                    PlateUAAutoTemporaryDealer15("T1CP5140")
                ]) { model in
                    PlateUAAutoTemporaryCellUIView(model: model)
                        .listRowInsets(EdgeInsets())
                }
            }
        }
    }
}

//
//  PlateUAAutoCellUIView.swift
//  RegPlateRx
//
//  Created by Andriy Morgunov on 20.09.2021.
//  Copyright © 2021 Andriy Morgunov. All rights reserved.
//

import SwiftUI

struct PlateUAAutoCellUIView: View {
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

        HStack() {
            self.plateText(prefix)
            self.plateText(body)
            self.plateText(suffix)
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
            .foregroundColor(.black)
            .font(.system(size: 48))
            .bold()
    }
}

struct PlateUAAutoCellUIView_Previews: PreviewProvider {
    static var previews: some View {

        Group {
            VStack {
                ForEach([
                    PlateUAAuto04("AB3707EB"),
                    PlateUAAuto15("AB3707EB"),
                    PlateUAAutoTaxi04("AB3707EB"),
                    PlateUAAutoTaxi15("AB3707EB")
                ]) { model in
                    PlateUAAutoCellUIView(model: model)
                        .listRowInsets(EdgeInsets())
                }
            }
        }
    }
}

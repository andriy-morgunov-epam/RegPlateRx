//
//  PlateUAViewModel.swift
//  RegPlateRx
//
//  Created by Andriy Morgunov on 10/21/16.
//  Copyright © 2016 Andriy Morgunov. All rights reserved.
//

import Foundation

class PlateUAViewModel: Identifiable {
    var id: String = UUID().uuidString
//    var prefix : BehaviorSubject<String>?
//    var body : BehaviorSubject<String>?
//    var postfix : BehaviorSubject<String>?
    
    let model: UA.CountryPlate
    
    init (_ model: UA.CountryPlate) {
        self.model = model
        
        if let norm = model.properties[UA.CountryPlate.Properties.kNormal.rawValue] as? String {
//            self.body = BehaviorSubject(value: norm)
        }
    }
}

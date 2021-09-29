//
//  PlateUAType1_2015.swift
//  RegPlate
//
//  Created by Andriy Morgunov on 8/25/15.
//  Copyright (c) 2015 Andriy Morgunov. All rights reserved.
//

import Foundation

class PlateUAAutoTaxi04 : PlateUAAuto04
{
    override func parse(_ input: String) -> Bool {
        let result = super.parse(input)
        
        if result {
            properties[UA.CountryPlate.Properties.kPlateType.rawValue] = UA.PlateType.Auto_Taxi_04 as AnyObject?
            properties[UA.CountryPlate.Properties.kMode.rawValue] = UA.PlateMode.taxi as AnyObject?
        }
        
        return result
    }
}

final class PlateUAAutoTaxi15 : PlateUAAutoTaxi04
{
    override func parse(_ input: String) -> Bool {
        let result = super.parse(input)
        
        if result {
            properties[UA.CountryPlate.Properties.kPlateType.rawValue] = UA.PlateType.Auto_Taxi_15 as AnyObject?
        }
        
        return result
    }
}

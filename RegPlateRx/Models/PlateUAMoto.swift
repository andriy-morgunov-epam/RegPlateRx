//
//  PlateUAType1.swift
//  RegPlate
//
//  Created by Andriy Morgunov on 8/20/15.
//  Copyright (c) 2015 Andriy Morgunov. All rights reserved.
//

import Foundation

class PlateUAMoto04 : PlateUAAuto04
{
    override func parse(_ input: String) -> Bool
    {
        let result = super.parse(input)
        
        if result
        {
            properties[UA.CountryPlate.Properties.kPlateType.rawValue] = UA.PlateType.Motorbike_04 as AnyObject?
        }
        
        return result
    }
}

class PlateUAMoto15 : PlateUAMoto04
{
    override func parse(_ input: String) -> Bool
    {
        let result = super.parse(input)
        
        if result
        {
            properties[UA.CountryPlate.Properties.kPlateType.rawValue] = UA.PlateType.Motorbike_15 as AnyObject?
        }
        
        return result
    }
}

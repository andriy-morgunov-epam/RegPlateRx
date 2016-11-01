//
//  PlateUAType1_2015.swift
//  RegPlate
//
//  Created by Andriy Morgunov on 8/25/15.
//  Copyright (c) 2015 Andriy Morgunov. All rights reserved.
//

import Foundation

class PlateUAMotoTemporaryDealer04 : PlateUAAutoTemporaryDealer04
{
    override func parse(_ input: String) -> Bool
    {
        let result = super.parse(input)
        
        if result
        {
            properties[UA.CountryPlate.Properties.kPlateType.rawValue] = UA.PlateType.Motorbike_Trade_Temporary_04 as AnyObject?
        }
        
        if let suffix = self.suffix()
        {
            properties[UA.CountryPlate.Properties.kSuffix.rawValue] = suffix as AnyObject?
        }
        
        if let body = self.body()
        {
            properties[UA.CountryPlate.Properties.kBody.rawValue] = body as AnyObject?
        }
        
        return result
    }
    
    override func suffix() -> String?
    {
        var result : String? = properties[UA.CountryPlate.Properties.kNormal.rawValue] as? String
        
        if let full = result
        {
            let index : String.Index =  full.index(full.endIndex, offsetBy: -2) //advance(full.endIndex, -2)
            
            result = full.substring(from: index)
        }
        
        return result
    }
    
    func body() -> String?
    {
        var result : String? = properties[UA.CountryPlate.Properties.kNormal.rawValue] as? String
        
        if let full = result
        {
            let range = (full.index(full.startIndex, offsetBy: 2) ..<  full.index(full.endIndex, offsetBy: -2))//(advance(full.startIndex, 2) ..< advance(full.endIndex, -2))
            
            result = full.substring(with: range)
        }
        
        return result
    }
}

class PlateUAMotoTemporaryDealer15 : PlateUAMotoTemporaryDealer04
{
    override func parse(_ input: String) -> Bool
    {
        let result = super.parse(input)
        
        if result
        {
            properties[UA.CountryPlate.Properties.kPlateType.rawValue] = UA.PlateType.Motorbike_Trade_Temporary_15 as AnyObject?
        }
        return result
    }
}

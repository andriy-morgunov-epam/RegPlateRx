//
//  PlateUAType1_2015.swift
//  RegPlate
//
//  Created by Andriy Morgunov on 8/25/15.
//  Copyright (c) 2015 Andriy Morgunov. All rights reserved.
//

import Foundation

class PlateUAAutoTemporary04 : PlateUAAuto04
{
    override func parse(_ input: String) -> Bool
    {
        let result = super.parse(input)
        
        if result
        {
            properties[UA.CountryPlate.Properties.kPlateType.rawValue] = UA.PlateType.Auto_Temporary_04 as AnyObject?
        }
        
        if let suffix = self.suffix()
        {
            properties[UA.CountryPlate.Properties.kSuffix.rawValue] = suffix as AnyObject?
        }
        
        if let prefix = self.prefix()
        {
            properties[UA.CountryPlate.Properties.kPrefix.rawValue] = prefix as AnyObject?
        }

        return result
    }
    
    override class func regexp() -> String?
    {
        let unknownLetter = "\\" + self.unknownLetterChar()
        let unknownNumber = "\\" + self.unknownNumChar()
        
        return
            "([\\d\(unknownNumber)]{2})" +
            "(\(UA.CountryPlate.tails)" +
            "|[\(UA.CountryPlate.allSymbols)]\(unknownLetter)" +
            "|\(unknownLetter)[\(UA.CountryPlate.allSymbols)]" +
            "|\(unknownLetter)\(unknownLetter))" +
            "([\\d\(unknownNumber)]{4})"
    }
    
    func suffix() -> String?
    {
        var result : String? = properties[UA.CountryPlate.Properties.kNormal.rawValue] as? String
        
        if let full = result
        {
            let index : String.Index =  full.index(full.startIndex, offsetBy: 2) //advance(full.startIndex, 2)
            
            result = full.substring(from: index)
        }
        
        return result
    }
    
    func prefix() -> String?
    {
        var result : String? = properties[UA.CountryPlate.Properties.kNormal.rawValue] as? String
        
        if let full = result
        {
            let index : String.Index = full.index(full.startIndex, offsetBy: 2) //advance(full.startIndex, 2)
            
            result = full.substring(to: index)
        }
        
        return result
    }
    
    override class func charTypeForCharIndex(_ index : Int) -> PlateTemplatableCharType?
    {
        var result : PlateTemplatableCharType?
        
        switch (index)
        {
        case 0, 1, 4, 5, 6, 7:
            result = PlateTemplatableCharType.num
        case 2, 3:
            result = PlateTemplatableCharType.letter
        default:
            result = nil
        }
        
        return result
    }
}

class PlateUAAutoTemporary15 : PlateUAAutoTemporary04
{
    override func parse(_ input: String) -> Bool
    {
        let result = super.parse(input)
        
        if result
        {
            properties[UA.CountryPlate.Properties.kPlateType.rawValue] = UA.PlateType.Auto_Temporary_15 as AnyObject?
        }
        
        return result
    }
}

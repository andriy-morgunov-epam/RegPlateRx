//
//  PlateUAType1.swift
//  RegPlate
//
//  Created by Andriy Morgunov on 8/20/15.
//  Copyright (c) 2015 Andriy Morgunov. All rights reserved.
//

import Foundation

class PlateUAAuto04 : UA.CountryPlate
{
    private static let kMaxLength = 8;
    
    override class func regexp() -> String?
    {
        let unknownLetter = "\\" + self.unknownLetterChar()
        let unknownNumber = "\\" + self.unknownNumChar()
        
//        let result = "AA|BB|[\(UA.CountryPlate.prefixSeries)]\(unknownLetter)"
        
        let result =
            "(\(UA.CountryPlate.series)" +
            "|[\(UA.CountryPlate.prefixSeries)]\(unknownLetter)" +
            "|\(unknownLetter)[\(UA.CountryPlate.allSymbols)]" +
            "|\(unknownLetter)\(unknownLetter))" +
            "([\\d\(unknownNumber)]{4})"  +
            "(\(UA.CountryPlate.tails)" +
            "|[\(UA.CountryPlate.allSymbols)]\(unknownLetter)" +
            "|\(unknownLetter)[\(UA.CountryPlate.allSymbols)]" +
        "|\(unknownLetter)\(unknownLetter))"

        return result
    }

    override func parse(_ input: String) -> Bool
    {
        let result = super.parse(input)
        
        properties[UA.CountryPlate.Properties.kNormal.rawValue] = type(of :self).normalizedInput(input) as AnyObject?
        properties[UA.CountryPlate.Properties.kPlateType.rawValue] = UA.PlateType.Auto_04 as AnyObject?
        
        return result
    }

    // PlateTemplatable
    
    override class func charLimit() -> Int
    {
        return PlateUAAuto04.kMaxLength
    }
    
    override class func charTypeForCharIndex(_ index : Int) -> PlateTemplatableCharType?
    {
        var result : PlateTemplatableCharType?
        
        switch (index)
        {
        case 0, 1, 6, 7:
            result = PlateTemplatableCharType.letter
        case 2, 3, 4, 5:
            result = PlateTemplatableCharType.num
        default:
            result = nil
        }
        
        return result
    }
}

class PlateUAAuto15 : PlateUAAuto04
{
    override func parse(_ input: String) -> Bool
    {
        let result = super.parse(input)
        
        if result
        {
            properties[UA.CountryPlate.Properties.kPlateType.rawValue] = UA.PlateType.Auto_15 as AnyObject?
        }
        
        return result
    }
}

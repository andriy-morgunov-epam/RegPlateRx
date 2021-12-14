//
//  PlateUAType1_2015.swift
//  RegPlate
//
//  Created by Andriy Morgunov on 8/25/15.
//  Copyright (c) 2015 Andriy Morgunov. All rights reserved.
//

import Foundation

class PlateUAAutoTemporaryDealer04 : PlateUAAutoTemporary04 {
    
    override func parse(_ input: String) -> Bool {
        let result = super.parse(input)
        
        if result
        {
            properties[UA.CountryPlate.Properties.kPlateType.rawValue] = UA.PlateType.Auto_Trade_Temporary_04 as AnyObject?
            properties[UA.CountryPlate.Properties.kOwnType.rawValue] = UA.PlateOwnType.tradeDialer as AnyObject?
        }
        
        return result
    }
    
    override class func regexp() -> String? {
        let unknownLetter = "\\" + Self.unknownLetterChar
        let unknownNumber = "\\" + Self.unknownNumChar
        
        return
            "([\(UA.CountryPlate.allSymbols)\(unknownLetter)]" +
            "[\\d\(unknownNumber)])" +
            "(\(UA.CountryPlate.tails)" +
            "|[\(UA.CountryPlate.allSymbols)]\(unknownLetter)" +
            "|\(unknownLetter)[\(UA.CountryPlate.allSymbols)]" +
            "|\(unknownLetter)\(unknownLetter))" +
            "([\\d\(unknownNumber)]{4})"
    }
    
    override class func charTypeForCharIndex(_ index : Int) -> PlateTemplatableCharType? {
        var result : PlateTemplatableCharType?
        
        switch (index) {
        case 1, 4, 5, 6, 7:
            result = PlateTemplatableCharType.num
        case 0, 2, 3:
            result = PlateTemplatableCharType.letter
        default:
            result = nil
        }
        
        return result
    }
}

class PlateUAAutoTemporaryDealer15 : PlateUAAutoTemporaryDealer04 {
    override func parse(_ input: String) -> Bool {
        let result = super.parse(input)
        
        if result {
            properties[UA.CountryPlate.Properties.kPlateType.rawValue] = UA.PlateType.Auto_Trade_Temporary_15 as AnyObject?
        }
        
        return result
    }
}

//
//  PlateUAType1_2015.swift
//  RegPlate
//
//  Created by Andriy Morgunov on 8/25/15.
//  Copyright (c) 2015 Andriy Morgunov. All rights reserved.
//

import Foundation

class PlateUAAutoTemporary04 : PlateUAAuto04 {

    override func parse(_ input: String) -> Bool {
        let result = super.parse(input)
        
        if result {
            let parsedInput = type(of :self).normalizedInput(input)
            let preIndex: String.Index = parsedInput.index(parsedInput.startIndex, offsetBy: 2)
            let postIndex: String.Index = parsedInput.index(parsedInput.endIndex, offsetBy: -4)

            self.properties[UA.CountryPlate.Properties.kMode.rawValue] = UA.PlateMode.temporary as AnyObject?
            self.properties[UA.CountryPlate.Properties.kPlateType.rawValue] = UA.PlateType.Auto_Temporary_04 as AnyObject?
            self.properties[UA.CountryPlate.Properties.kPrefix.rawValue] = String(parsedInput[..<preIndex]) as AnyObject?
            self.properties[UA.CountryPlate.Properties.kBody.rawValue] = String(parsedInput[preIndex..<postIndex]) as AnyObject?
            self.properties[UA.CountryPlate.Properties.kSuffix.rawValue] = String(parsedInput[postIndex...]) as AnyObject?
        }

        return result
    }
    
    override class func regexp() -> String? {
        let unknownLetter = "\\" + Self.unknownLetterChar
        let unknownNumber = "\\" + Self.unknownNumChar
        
        return
            "([\\d\(unknownNumber)]{2})" +
            "(\(UA.CountryPlate.tails)" +
            "|[\(UA.CountryPlate.allSymbols)]\(unknownLetter)" +
            "|\(unknownLetter)[\(UA.CountryPlate.allSymbols)]" +
            "|\(unknownLetter)\(unknownLetter))" +
            "([\\d\(unknownNumber)]{4})"
    }

    override class func charTypeForCharIndex(_ index : Int) -> PlateTemplatableCharType? {

        var result : PlateTemplatableCharType?
        
        switch (index) {
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

final class PlateUAAutoTemporary15 : PlateUAAutoTemporary04 {

    override func parse(_ input: String) -> Bool {

        let result = super.parse(input)
        
        if result {
            properties[UA.CountryPlate.Properties.kPlateType.rawValue] = UA.PlateType.Auto_Temporary_15 as AnyObject?
        }
        
        return result
    }
}

//
//  PlateUAType1.swift
//  RegPlate
//
//  Created by Andriy Morgunov on 8/20/15.
//  Copyright (c) 2015 Andriy Morgunov. All rights reserved.
//

import Foundation

class PlateUAAuto04 : UA.CountryPlate {

    private static let kMaxLength = 8
    
    override class func regexp() -> String? {

        let unknownLetter = "\\" + Self.unknownLetterChar
        let unknownNumber = "\\" + Self.unknownNumChar
        
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

    override func parse(_ input: String) -> Bool {
        let result = super.parse(input)

        if result {
            let parsedInput = type(of :self).normalizedInput(input)
            let preIndex: String.Index = parsedInput.index(parsedInput.startIndex, offsetBy: 2)
            let postIndex: String.Index = parsedInput.index(parsedInput.endIndex, offsetBy: -2)

            self.properties[UA.CountryPlate.Properties.kNormal.rawValue] = parsedInput as AnyObject?
            self.properties[UA.CountryPlate.Properties.kMode.rawValue] = UA.PlateMode.regular as AnyObject?
            self.properties[UA.CountryPlate.Properties.kOwnType.rawValue] = UA.PlateOwnType.civil as AnyObject?
            self.properties[UA.CountryPlate.Properties.kEngineType.rawValue] = UA.PlateEngineType.moreThen50 as AnyObject?
            self.properties[UA.CountryPlate.Properties.kPlateType.rawValue] = UA.PlateType.Auto_04 as AnyObject?
            self.properties[UA.CountryPlate.Properties.kPrefix.rawValue] = String(parsedInput[..<preIndex]) as AnyObject?
            self.properties[UA.CountryPlate.Properties.kBody.rawValue] = String(parsedInput[preIndex..<postIndex]) as AnyObject?
            self.properties[UA.CountryPlate.Properties.kSuffix.rawValue] = String(parsedInput[postIndex...]) as AnyObject?
        }
        
        return result
    }

    // PlateTemplatable
    override class func charLimit() -> Int {
        return PlateUAAuto04.kMaxLength
    }
    
    override class func charTypeForCharIndex(_ index : Int) -> PlateTemplatableCharType? {
        var result : PlateTemplatableCharType?
        
        switch (index) {
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

final class PlateUAAuto15 : PlateUAAuto04 {
    override func parse(_ input: String) -> Bool {
        let result = super.parse(input)
        
        if result {
            self.properties[UA.CountryPlate.Properties.kPlateType.rawValue] = UA.PlateType.Auto_15 as AnyObject?
        }
        
        return result
    }
}

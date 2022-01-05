//
//  PlateUAType1.swift
//  RegPlate
//
//  Created by Andriy Morgunov on 8/20/15.
//  Copyright (c) 2015 Andriy Morgunov. All rights reserved.
//

import Foundation

class PlateUAMotobike04 : PlateUAAuto04 {

    override class func regexp() -> String? {

        let unknownLetter = "\\" + Self.unknownLetterChar
        let unknownNumber = "\\" + Self.unknownNumChar

        let result =
            "(\(UA.CountryPlate.series)" +
            "|[\(UA.CountryPlate.prefixSeries)]\(unknownLetter)" +
            "|\(unknownLetter)[\(UA.CountryPlate.allSymbols)]" +
            "|\(unknownLetter)\(unknownLetter))" +
            "(\(UA.CountryPlate.tails)" +
            "|[\(UA.CountryPlate.allSymbols)]\(unknownLetter)" +
            "|\(unknownLetter)[\(UA.CountryPlate.allSymbols)]" +
            "|\(unknownLetter)\(unknownLetter))" +
            "([\\d\(unknownNumber)]{4})"

        return result
    }

    override func parse(_ input: String) -> Bool {
        let result = super.parse(input)
        
        if result {
            let parsedInput = type(of :self).normalizedInput(input)
            let preIndex: String.Index = parsedInput.index(parsedInput.startIndex, offsetBy: 2)
            let postIndex: String.Index = parsedInput.index(parsedInput.endIndex, offsetBy: -4)

            self.properties[UA.CountryPlate.Properties.kPlateType.rawValue] = UA.PlateType.Motorbike_04 as AnyObject?
            self.properties[UA.CountryPlate.Properties.kEngineType.rawValue] = UA.PlateEngineType.lessThen50 as AnyObject?
            self.properties[UA.CountryPlate.Properties.kVehicleType.rawValue] = UA.VehicleType.bike as AnyObject?
            self.properties[UA.CountryPlate.Properties.kPrefix.rawValue] = String(parsedInput[..<preIndex]) as AnyObject?
            self.properties[UA.CountryPlate.Properties.kBody.rawValue] = String(parsedInput[preIndex..<postIndex]) as AnyObject?
            self.properties[UA.CountryPlate.Properties.kSuffix.rawValue] = String(parsedInput[postIndex...]) as AnyObject?
        }
        
        return result
    }
}

class PlateUAMotocycle04 : PlateUAAuto04 {
    override func parse(_ input: String) -> Bool {
        let result = super.parse(input)

        if result {
            self.properties[UA.CountryPlate.Properties.kPlateType.rawValue] = UA.PlateType.Motorcycle_04 as AnyObject?
            self.properties[UA.CountryPlate.Properties.kVehicleType.rawValue] = UA.VehicleType.moto as AnyObject?
        }

        return result
    }
}

final class PlateUAMotocycle15 : PlateUAMotocycle04 {
    override func parse(_ input: String) -> Bool
    {
        let result = super.parse(input)

        if result {
            self.properties[UA.CountryPlate.Properties.kPlateType.rawValue] = UA.PlateType.Motorcycle_15 as AnyObject?
        }

        return result
    }
}

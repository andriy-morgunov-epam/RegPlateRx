//
//  PlateUA.swift
//  RegPlateRx
//
//  Created by Andriy Morgunov on 10/20/16.
//  Copyright © 2016 Andriy Morgunov. All rights reserved.
//

import Foundation

protocol CountryPlateProtocol
{
    static func regexp() -> String?
    
    static func match(_ input : String ) -> Bool
    
    func parse(_ input : String ) -> Bool
    
    func isValid() -> Bool
}

struct UA
{
    enum PlateMode : Int
    {
        case regular = 0, taxi, temporary
    }
    
    enum PlateOwnType : Int
    {
        case civil = 0, milicia, diplomatic, army, armyVolontier, mountain, tradeDialer
    }
    
    enum PlateEngineType : Int
    {
        case moreThen50 = 0, lessThen50
    }
    
    enum PlateCountryType : Int
    {
        case japan = 0, usa, other
    }
    
    enum VehicleType : Int
    {
        case unknown = 0, bike, moto, car, track, bus, tracktor, trailer
    }
    
    enum PlateType : String
    {
        case Unknown = ""
        
        //1.1
        case Auto_04 = "1.1.04"
        case Auto_15 = "1.1.15"
        
        // 1.2
        case Auto_Taxi_04 = "1.2.04"
        case Auto_Taxi_15 = "1.2.15"
        
        // 2.1
        case Auto_Temporary_04 = "2.1.06"
        case Auto_Temporary_15 = "2.1.15"
        
        // 2.2
        case Auto_Trade_Temporary_04 = "2.2.06"
        case Auto_Trade_Temporary_15 = "2.2.15"
        
        // 3.1
        case Motorbike_04 = "3.1.04"
        case Motorbike_15 = "3.1.15"
        
        // 3.2
        case Motorbike_Temporary_04 = "3.2.06"
        case Motorbike_Temporary_15 = "3.2.15"
        
        // 3.3
        case Motorbike_Trade_Temporary_04 = "3.3.06"
        case Motorbike_Trade_Temporary_15 = "3.3.15"
        
        // 4
        case Diplomatic = "4..04"
        
        // 5
        case Motorcycle_04 = "5..04"
        case Motorcycle_15 = "5..15"
        
        // 6.1
        case Motorcycle_Temporary_04 = "6.1.04"
        case Motorcycle_Temporary_15 = "6.1.15"
        
        // 6.2
        case Motorcycle_Trade_Temporary_04 = "6.2.04"
        case Motorcycle_Trade_Temporary_15 = "6.2.15"
        
        // 7.1
        case Auto_Individual_04 = "7.1.04"
        case Auto_Individual_04_2 = "7.1.04.2"
        
        // 7.2
        case Motorcycle_Individual_04 = "7.2.04"
        case Motorcycle_Individual_04_2 = "7.2.04.2"
        
        // 7.3
        case USA_Japan_04 = "7.3.04"
        case USA_Japan_15 = "7.3.15"
        
        // 7.4
        case USA_Japan_Individual_04 = "7.4.04"
        
        // 8
        case Tractor_04 = "8..04"
        
        // 9
        case Army_95 = "9..95"
        
        // 9.1
        case Army_Volonter_14 = "9.1.14"
        
        // 10
        case Army_Tractor_95 = "10..95"
        
        // 11
        case Police_04 = "11..04"
        case Police_15 = "11..15"
        
        // 12.1
        case Specific_10 = "12.1.10"
        
        // 12.2
        case Specific_Temporary_10 = "12.2.10"
        
        init()
        {
            self = .Unknown
        }
    }
    
    enum PlateRegion : String, CustomStringConvertible
    {
        case Unknown = ""
        
        case AA = "AA"
        case AB = "AB"
        case AC = "AC"
        case AE = "AE"
        case AH = "AH"
        case AI = "AI"
        case AK = "AK"
        case AM = "AM"
        case AO = "AO"
        case AP = "AP"
        case AT = "AT"
        case AX = "AX"
        
        case BA = "BA"
        case BB = "BB"
        case BC = "BC"
        case BE = "BE"
        case BH = "BH"
        case BI = "BI"
        case BK = "BK"
        case BM = "BM"
        case BO = "BO"
        case BT = "BT"
        case BX = "BX"
        
        case CA = "CA"
        case CB = "CB"
        case CE = "CE"
        case CH = "CH"
        
        case HA = "HA"
        case HB = "HB"
        case HC = "HC"
        case HE = "HE"
        case HH = "HH"
        case HI = "HI"
        case HK = "HK"
        case HM = "HM"
        case HO = "HO"
        case HT = "HT"
        case HX = "HX"
        
        case IA = "IA"
        case IB = "IB"
        case IE = "IE"
        case IH = "IH"
        
        case II = "II"
        
        case KA = "KA"
        case KB = "KB"
        case KC = "KC"
        case KE = "KE"
        case KH = "KH"
        case KI = "KI"
        case KK = "KK"
        case KM = "KM"
        case KO = "KO"
        case KP = "KP"
        case KT = "KT"
        case KX = "KX"
        
        var description: String
        {
            return self.rawValue
        }
        
        var region: String?
        {
            var result : String?
            
            switch (self)
            {
            case .AK, .KK :
                result = NSLocalizedString("Krym", comment: "Krym")
            case .AA, .KA :
                result = NSLocalizedString("Kyiv", comment: "Kyiv")
            case .AB, .KB :
                result = NSLocalizedString("Vinnitska", comment: "Vinnitska")
            case .AC, .KC :
                result = NSLocalizedString("Volynska", comment: "Volynska")
            case .AE, .KE :
                result = NSLocalizedString("Dniprovska", comment: "Dniprovska")
            case .AH, .KH :
                result = NSLocalizedString("Donetska", comment: "Donetska")
            case .AI, .KI :
                result = NSLocalizedString("Kyivska", comment: "Kyivska")
            case .AM, .KM :
                result = NSLocalizedString("Zhitomirska", comment: "Zhitomirska")
            case .AO, .KO :
                result = NSLocalizedString("Zakarpatska", comment: "Zakarpatska")
            case .AP, .KP :
                result = NSLocalizedString("Zaporizhska", comment: "Zaporizhska")
            case .AT, .KT :
                result = NSLocalizedString("IvanoFrankivska", comment: "IvanoFrankivska")
            case .AX, .KX :
                result = NSLocalizedString("Kharkivska", comment: "Kharkivska")
            case .BA, .HA :
                result = NSLocalizedString("Kirovogradska", comment: "Kirovogradska")
            case .BB, .HB :
                result = NSLocalizedString("Luganska", comment: "Luganska")
            case .BC, .HC :
                result = NSLocalizedString("Lvivska", comment: "Lvivska")
            case .BE, .HE :
                result = NSLocalizedString("Mykolaivska", comment: "Mykolaivska")
            case .BH, .HH :
                result = NSLocalizedString("Odeska", comment: "Odeska")
            case .BI, .HI :
                result = NSLocalizedString("Poltavska", comment: "Poltavska")
            case .BK, .HK :
                result = NSLocalizedString("Rivnenska", comment: "Rivnenska")
            case .BM, .HM :
                result = NSLocalizedString("Sumska", comment: "Sumska")
            case .BO, .HO :
                result = NSLocalizedString("Ternopilska", comment: "Ternopilska")
            case .BT, .HT :
                result = NSLocalizedString("Khersonska", comment: "Khersonska")
            case .BX, .HX :
                result = NSLocalizedString("Khmelnitska", comment: "Khmelnitska")
            case .CA, .IA :
                result = NSLocalizedString("Cherkaska", comment: "Cherkaska")
            case .CB, .IB :
                result = NSLocalizedString("Chernigivska", comment: "Chernigivska")
            case .CE, .IE :
                result = NSLocalizedString("Charnivetska", comment: "Charnivetska")
            case .CH, .IH :
                result = NSLocalizedString("Sevastopol", comment: "Sevastopol")
            case .II :
                result = NSLocalizedString("General", comment: "General")
            default :
                result = nil
            }
            
            return result
        }
        
        var year: Int?
        {
            var result : Int?
            
            switch (self)
            {
            case .AK,.AA,.AB,.AC,.AE,.AH,.AI,.AM,.AO,.AP,.AT,.AX,.BA,.BB,.BC,.BE,.BH,.BI,.BK,.BM,.BO,.BT,.BX,.CA,.CB,.CE,.CH,.II :
                result = 2004
                break
            case .KK,.KA,.KB,.KC,.KE,.KH,.KI,.KM,.KO,.KP,.KT,.KX,.HA,.HB,.HC,.HE,.HH,.HI,.HK,.HM,.HO,.HT,.HX,.IA,.IB,.IE,.IH :
                result = 2013
                break
            default :
                result = nil
            }
            
            return result
        }
        
    }
    
    class CountryPlate : Plate<String>, PlateTemplatable
    {
        enum Properties : String
        {
            case kMode        = "kMode"
            case kOwnType     = "kOwnType"
            case kEngineType  = "kEngineType"
            case kCountryType = "kCountryType"
            case kVehicleType = "kVehicleType"
            case kPlateType   = "kPlateType"
            
            case kPrefix      = "kPrefix"
            case kSuffix      = "kSuffix"
            case kBody        = "kBody"
            
            case kNormal      = "kNormal"
        }
        
        static let prefixSeries : String = "ABCIHK"
        
        static let allSymbols : String = "ABCEHIKMOPTX"
        
        static let series : String =
            "AA|BA|CA|HA|IA|KA|" +
                "AB|BB|CB|HB|IB|KB|" +
                "AC|BC|HC|KC|" +
                "AE|BE|CE|HE|IE|KE|" +
                "AH|BH|CH|HH|IH|KH|" +
                "AI|BI|HI|KI|" +
                "AK|BK|HK|KK|" +
                "AM|BM|HM|КМ|" +
                "AO|BO|HO|KO|" +
                "AP|KP|" +
                "AT|BT|HT|KT|" +
        "AX|BX|HX|KX"
        
        static let tails : String =
            "AA|BA|CA|EA|HA|IA|KA|MA|OA|PA|TA|XA|" +
                "AB|BB|CB|EB|HB|IB|KB|MB|OB|PB|TB|XB|" +
                "AC|BC|CC|EC|HC|IC|KC|MC|OC|PC|TC|XC|" +
                "AE|BE|CE|EE|HE|IE|KE|ME|OE|PE|TE|XE|" +
                "AH|BH|CH|EH|HH|IH|KH|MH|OН|PH|TH|XH|" +
                "AI|BI|CI|EI|HI|II|KI|MI|OI|PI|TI|XI|" +
                "AK|BK|CK|EK|HK|IK|KK|MK|OK|PK|TK|XK|" +
                "AM|BM|CM|EM|HM|IM|КМ|MM|OM|PM|TM|XM|" +
                "AO|BO|CO|EO|HO|IO|KO|MO|OO|PO|TO|XO|" +
                "AP|ВР|CP|EP|HP|IP|KP|MP|OP|PP|TP|XP|" +
                "AT|BT|CT|ET|HT|IT|KT|MT|OT|PT|TT|XT|" +
        "AX|BX|CX|EX|HX|IX|KX|MX|OX|PX|TX|ХХ"
        
        private var _isValid : Bool = false
        
        func isValid() -> Bool
        {
            return _isValid
        }
        
        override init(_ value: String)
        {
            super.init(value)
            
            let classType = type(of: self)
            
            let normalized = classType.normalizedInput(value)
            
            if classType.match(normalized) == true
            {
                _isValid = parse(normalized)
            }
        }
        
        static func match(_ input: String) -> Bool
        {
            var result = false
            
            if let regexp = regexp()
            {
                result = RegExp(regexp).test(input);
            }
            
            return result
        }
        
        class func normalizedInput(_ input : String) -> String
        {
            var result = input
            let limit = charLimit()
            let start = input.characters.count
            
            if start < limit
            {
                for index in start..<limit
                {
                    if let charType = charTypeForCharIndex(index)
                    {
                        switch charType
                        {
                        case .letter :
                            result += unknownLetterChar()
                        case .num :
                            result += unknownNumChar()
                        }
                    }
                    else
                    {
                        break
                    }
                }
            }
            
            return result
        }
        
        func parse(_ input: String) -> Bool
        {
            properties[Properties.kNormal.rawValue] = input as AnyObject?
            
            return true
        }
        
        class func regexp() -> String?
        {
            return nil;
        }
        
        class func charTypeForCharIndex(_ index: Int) -> PlateTemplatableCharType?
        {
            return nil
        }
        
        class func charLimit() -> Int
        {
            return 0
        }
    }

    class CountryProvider : PlateProvider<String, String, CountryPlate>
    {
        override func getWithFilter(filter : String) -> [UA.CountryPlate]
        {
            return PlateUASerice.plates(filter)
        }
    }
    
    class CountryPlates : Plates<String, String, CountryPlate>
    {
        override init()
        {
            super.init()
            
            self.provider = CountryProvider()
        }
    }

//    func normalizedInput() -> String
//    {
//        return input
//    }
//    
//    /**
//     * Plate type
//     */
//    var mode : PlateUAConstants.PlateMode
//    {
//        return PlateUAConstants.PlateMode.regular
//    }
//    
//    /**
//     * Plate own type
//     */
//    var ownType : PlateUAConstants.PlateOwnType
//    {
//        return PlateUAConstants.PlateOwnType.civil
//    }
//    
//    /**
//     * Plate engine type
//     */
//    var engineType : PlateUAConstants.PlateEngineType
//    {
//        return PlateUAConstants.PlateEngineType.moreThen50
//    }
//    
//    /**
//     * Plate country type
//     */
//    var countryType : PlateUAConstants.PlateCountryType
//    {
//        return PlateUAConstants.PlateCountryType.other
//    }
    
    //    var type   = PlateUAConstants.PlateTypes.Unknown
    //
    //    var back   : String
    //    {
    //        return PlateUAUtils.backImageNameFor(type: type)
    //    }
    
    //
    //    var value : String?
    //    {
    //        var result : String? = self.normalizedInput()
    //
    //        if (result != nil)
    //        {
    //            let matched : Bool = self.match(result!)
    //
    //            if (matched)
    //            {
    //                cachedValue = result
    //            }
    //            else
    //            {
    //                result = nil
    //            }
    //        }
    //
    //        return result
    //    }
    
}

extension UA.CountryPlate : CountryPlateProtocol
{
    private func getRegion(input : String) -> UA.PlateRegion?
    {
        var result : UA.PlateRegion? = nil;
        
        if (input.characters.count > 1)
        {
            let index : String.Index =  input.index(input.startIndex, offsetBy: 2)
            
            let regionStr : String = input.substring(to: index)
            
            result = UA.PlateRegion(rawValue: regionStr)
        }
        
        return result
    }
    
    private func getType() -> UA.PlateType?
    {
        return nil
    }
    
    private func getYear(region : UA.PlateRegion) -> String?
    {
        var result : String?
        
        if let year = region.year
        {
            result = "\(year)"
        }
        
        return result
    }
    
    private func getArea(region : UA.PlateRegion) -> String?
    {
        return region.region
    }
}






//
//  PlateUAService.swift
//  RegPlateRx
//
//  Created by Andriy Morgunov on 10/27/16.
//  Copyright © 2016 Andriy Morgunov. All rights reserved.
//

import Foundation

struct PlateUASerice// : Plates
{
    static func plates (_ input : String) -> [UA.CountryPlate]
    {
        var result : [UA.CountryPlate] = []
        
        // 1.1 (2004)
        var plate = PlateUAAuto04(input)
        if plate.isValid()
        {
            result.append(plate)
        }
        
        // 1.1 (2015)
        plate = PlateUAAuto15(input)
        if plate.isValid()
        {
            result.append(plate)
        }

        // 1.2 (2004)
        plate = PlateUAAutoTaxi04(input)
        if plate.isValid()
        {
            result.append(plate)
        }
        
        // 1.2 (2015)
        plate = PlateUAAutoTaxi15(input)
        if plate.isValid()
        {
            result.append(plate)
        }

        // 2.1 (2004)
        plate = PlateUAAutoTemporary04(input)
        if plate.isValid()
        {
            result.append(plate)
        }
        
        // 2.1 (2015)
        plate = PlateUAAutoTemporary15(input)
        if plate.isValid()
        {
            result.append(plate)
        }

        // 2.2 (2004)
        plate = PlateUAAutoTemporaryDealer04(input)
        if plate.isValid()
        {
            result.append(plate)
        }
        
        // 2.2 (2015)
        plate = PlateUAAutoTemporaryDealer15(input)
        if plate.isValid()
        {
            result.append(plate)
        }

        // 3.1 (2004)
        plate = PlateUAMoto04(input)
        if plate.isValid()
        {
            result.append(plate)
        }
        
        /*
         // 3.1 (2015)
         plate = PlateUAMoto15(input: input)
         if let value = plate.value
         {
         result.append(plate)
         }
       */

        return result
    }
    
//    static func backImageNameFor (#type : PlateUAConstants.PlateTypes) -> String
//    {
//        return type.rawValue
//    }
    
//    static func autoTypesForPlateType (_ plateType : PlateUAConstants.PlateTypes) -> Set<PlateUAConstants.AutoTypes>
//    {
//        var result = Set<PlateUAConstants.AutoTypes>()
//        
//        switch plateType
//        {
//        case
//        PlateUAConstants.PlateTypes.Auto_04,
//        PlateUAConstants.PlateTypes.Auto_15,
//        PlateUAConstants.PlateTypes.Auto_Temporary_04,
//        PlateUAConstants.PlateTypes.Auto_Temporary_15,
//        PlateUAConstants.PlateTypes.Auto_Trade_Temporary_04,
//        PlateUAConstants.PlateTypes.Auto_Trade_Temporary_15 :
//            
//            result.insert(PlateUAConstants.AutoTypes.car)
//            result.insert(PlateUAConstants.AutoTypes.bus)
//            result.insert(PlateUAConstants.AutoTypes.track)
//            result.insert(PlateUAConstants.AutoTypes.trailer)
//            
//        case
//        PlateUAConstants.PlateTypes.Auto_Taxi_04,
//        PlateUAConstants.PlateTypes.Auto_Taxi_15 :
//            
//            result.insert(PlateUAConstants.AutoTypes.bus)
//            
//        case
//        PlateUAConstants.PlateTypes.Motorbike_04,
//        PlateUAConstants.PlateTypes.Motorbike_15,
//        PlateUAConstants.PlateTypes.Motorbike_Temporary_04,
//        PlateUAConstants.PlateTypes.Motorbike_Temporary_15,
//        PlateUAConstants.PlateTypes.Motorbike_Trade_Temporary_04,
//        PlateUAConstants.PlateTypes.Motorbike_Trade_Temporary_15 :
//            
//            result.insert(PlateUAConstants.AutoTypes.moto)
//            
//        default :
//            
//            ()
//            //
//            //            // 4
//            //        case Diplomatic = "4..04"
//            //
//            //            // 5
//            //        case Motorcycle_04 = "5..04"
//            //        case Motorcycle_15 = "5..15"
//            //
//            //            // 6.1
//            //        case Motorcycle_Temporary_04 = "6.1.04"
//            //        case Motorcycle_Temporary_15 = "6.1.15"
//            //
//            //            // 6.2
//            //        case Motorcycle_Trade_Temporary_04 = "6.2.04"
//            //        case Motorcycle_Trade_Temporary_15 = "6.2.15"
//            //
//            //            // 7.1
//            //        case Auto_Individual_04 = "7.1.04"
//            //        case Auto_Individual_04_2 = "7.1.04.2"
//            //
//            //            // 7.2
//            //        case Motorcycle_Individual_04 = "7.2.04"
//            //        case Motorcycle_Individual_04_2 = "7.2.04.2"
//            //
//            //            // 7.3
//            //        case USA_Japan_04 = "7.3.04"
//            //        case USA_Japan_15 = "7.3.15"
//            //
//            //            // 7.4
//            //        case USA_Japan_Individual_04 = "7.4.04"
//            //
//            //            // 8
//            //        case Tractor_04 = "8..04"
//            //
//            //            // 9
//            //        case Army_95 = "9..95"
//            //
//            //            // 9.1
//            //        case Army_Volonter_14 = "9.1.14"
//            //            
//            //            // 10
//            //        case Army_Tractor_95 = "10..95"
//            //            
//            //            // 11
//            //        case Police_04 = "11..04"
//            //        case Police_15 = "11..15"
//            //            
//            //            // 12.1
//            //        case Specific_10 = "12.1.10"
//            //            
//            //            // 12.2
//            //        case Specific_Temporary_10 = "12.2.10"
//        }
//        
//        return result
//    }
}

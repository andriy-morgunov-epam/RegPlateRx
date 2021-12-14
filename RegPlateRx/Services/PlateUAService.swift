//
//  PlateUAService.swift
//  RegPlateRx
//
//  Created by Andriy Morgunov on 10/27/16.
//  Copyright © 2016 Andriy Morgunov. All rights reserved.
//

import Foundation

struct PlateUASerice
{
    static func plates (_ input : String) -> [UA.CountryPlate]
    {
        var result : [UA.CountryPlate] = []
        
        // 1.1 (2004)
        var plate = PlateUAAuto04(input)
        if plate.isValid() {
            result.append(plate)
        }
        
        // 1.1 (2015)
        plate = PlateUAAuto15(input)
        if plate.isValid() {
            result.append(plate)
        }

        // 1.2 (2004)
        plate = PlateUAAutoTaxi04(input)
        if plate.isValid() {
            result.append(plate)
        }
        
        // 1.2 (2015)
        plate = PlateUAAutoTaxi15(input)
        if plate.isValid() {
            result.append(plate)
        }

        // 2.1 (2004)
        plate = PlateUAAutoTemporary04(input)
        if plate.isValid() {
            result.append(plate)
        }
        
        // 2.1 (2015)
        plate = PlateUAAutoTemporary15(input)
        if plate.isValid() {
            result.append(plate)
        }

        // 2.2 (2004)
        plate = PlateUAAutoTemporaryDealer04(input)
        if plate.isValid() {
            result.append(plate)
        }
        
        // 2.2 (2015)
        plate = PlateUAAutoTemporaryDealer15(input)
        if plate.isValid() {
            result.append(plate)
        }

        // 3.1 (2004)
        plate = PlateUAMotobike04(input)
        if plate.isValid() {
            result.append(plate)
        }
        
        // ??
        plate = PlateUAMotocycle04(input)
        if plate.isValid() {
            result.append(plate)
        }

        // ??
        plate = PlateUAMotocycle15(input)
        if plate.isValid() {
            result.append(plate)
        }

        // ??
        plate = PlateUAMotobikeTemporary04(input)
        if plate.isValid() {
            result.append(plate)
        }

        // ??
        plate = PlateUAMotocycleTemporary04(input)
        if plate.isValid() {
            result.append(plate)
        }

        // ??
        plate = PlateUAMotocycleTemporary15(input)
        if plate.isValid() {
            result.append(plate)
        }

        // ??
        plate = PlateUAMotobikeTemporaryDealer04(input)
        if plate.isValid() {
            result.append(plate)
        }

        // ??
        plate = PlateUAMotocycleTemporaryDealer04(input)
        if plate.isValid() {
            result.append(plate)
        }

        // ??
        plate = PlateUAMotocycleTemporaryDealer15(input)
        if plate.isValid() {
            result.append(plate)
        }

        return result
    }
}

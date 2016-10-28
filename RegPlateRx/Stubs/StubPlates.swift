//
//  StubPlates.swift
//  RegPlateRx
//
//  Created by Andriy Morgunov on 10/20/16.
//  Copyright © 2016 Andriy Morgunov. All rights reserved.
//

import Foundation

protocol PlateUAProtocol : PlateProtocol
{
    associatedtype PlateType = String
}


protocol PlatesUAProtocol : PlatesProtocol
{
}

class StubPlateUAProvider : PlateProvider<String, String, UA.CountryPlate>
{
    override func getWithFilter(filter : String) -> [UA.CountryPlate]
    {
        return [UA.CountryPlate("AA0001AB"), UA.CountryPlate("AA0002AB"), UA.CountryPlate("AA0003AB")]
    }
}

protocol StubPlatesUAProtocol
{
    func plug_stub()
}

extension UA.CountryPlates : StubPlatesUAProtocol
{
    internal func plug_stub()
    {
        self.provider = StubPlateUAProvider()
    }
}

//
//  PlateUAViewModel.swift
//  RegPlateRx
//
//  Created by Andriy Morgunov on 10/21/16.
//  Copyright © 2016 Andriy Morgunov. All rights reserved.
//

import Foundation
import RxSwift
import RxCocoa

class PlateUAViewModel
{
    var prefix : Variable<String>?
    var body : Variable<String>?
    var postfix : Variable<String>?
    
    let model : UA.CountryPlate
    
    init (_ model : UA.CountryPlate)
    {
        self.model = model
        
        if let value : String = model.value
        {
            self.body = Variable(value)
        }
        else
        {
            self.body = nil
        }
    }
}

//
//  PlateTemplate.swift
//  RegPlateRx
//
//  Created by Andriy Morgunov on 10/27/16.
//  Copyright © 2016 Andriy Morgunov. All rights reserved.
//

import Foundation

enum PlateTemplatableCharType : Int {
    case num = 0, letter
}

protocol PlateTemplatable {
    static func charLimit() -> Int
    static func normalizedInput(_ value : String) -> String
    
    static var unknownNumChar: String { get }
    static var unknownLetterChar: String { get }
    
    static func charTypeForCharIndex(_ index : Int) -> PlateTemplatableCharType?
}

extension PlateTemplatable {
    static var unknownNumChar: String {
        return "#"
    }
    
    static var unknownLetterChar: String {
        return "*"
    }
}



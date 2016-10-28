//
//  PlateTemplate.swift
//  RegPlateRx
//
//  Created by Andriy Morgunov on 10/27/16.
//  Copyright © 2016 Andriy Morgunov. All rights reserved.
//

import Foundation

enum PlateTemplatableCharType : Int
{
    case num = 0, letter
}

protocol PlateTemplatable
{
    static func charLimit() -> Int
    static func normalizedInput(_ value : String) -> String
    
    static func unknownNumChar()    -> String
    static func unknownLetterChar() -> String
    
    static func charTypeForCharIndex(_ index : Int) -> PlateTemplatableCharType?
}

extension PlateTemplatable
{
    static func unknownNumChar() -> String
    {
        return "#"
    }
    
    static func unknownLetterChar() -> String
    {
        return "*"
    }
}


//protocol Plates
//{
//    static func plates (_ input : String) -> [PlateProtocol]
//}


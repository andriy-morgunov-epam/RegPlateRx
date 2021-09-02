//
//  RegExp.swift
//  RegPlate
//
//  Created by Andriy Morgunov on 8/20/15.
//  Copyright (c) 2015 Andriy Morgunov. All rights reserved.
//

import Foundation

class RegExp
{
    let internalExpression : NSRegularExpression?
    
    init(_ pattern: String)
    {
        do
        {
            try self.internalExpression = NSRegularExpression(pattern: pattern, options: NSRegularExpression.Options.caseInsensitive)
        }
        catch _
        {
            self.internalExpression = nil
        }
    }
    
    func test(_ input: String) -> Bool
    {
        if let exp = self.internalExpression
        {
            let matches = exp.matches(in: input, options: [], range:NSMakeRange(0, input.count))
            
            return matches.count > 0
        }
        
        return false
    }
}

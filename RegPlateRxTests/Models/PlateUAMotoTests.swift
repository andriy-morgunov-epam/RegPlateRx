//
//  PlateUAAutoTests.swift
//  RegPlateRx
//
//  Created by Andriy Morgunov on 10/27/16.
//  Copyright © 2016 Andriy Morgunov. All rights reserved.
//

import Foundation

import XCTest
@testable import RegPlateRx

class PlateUAMotoTests: XCTestCase
{
    
    override func setUp()
    {
        super.setUp()
        // Put setup code here. This method is called before the invocation of each test method in the class.
    }
    
    override func tearDown()
    {
        // Put teardown code here. This method is called after the invocation of each test method in the class.
        super.tearDown()
    }

    func testClassPlateUAAuto04Normalized()
    {
        XCTAssertEqual(PlateUAMotobike04.normalizedInput(""), "**####**", "Wrong Normalized")
        XCTAssertEqual(PlateUAMotobike04.normalizedInput("A"), "A*####**", "Wrong Normalized")
        XCTAssertEqual(PlateUAMotobike04.normalizedInput("AA"), "AA####**", "Wrong Normalized")
        XCTAssertEqual(PlateUAMotobike04.normalizedInput("AA0"), "AA0###**", "Wrong Normalized")
        XCTAssertEqual(PlateUAMotobike04.normalizedInput("AA00"), "AA00##**", "Wrong Normalized")
        XCTAssertEqual(PlateUAMotobike04.normalizedInput("AA000"), "AA000#**", "Wrong Normalized")
        XCTAssertEqual(PlateUAMotobike04.normalizedInput("AA0000"), "AA0000**", "Wrong Normalized")
        XCTAssertEqual(PlateUAMotobike04.normalizedInput("AA0000A"), "AA0000A*", "Wrong Normalized")
        XCTAssertEqual(PlateUAMotobike04.normalizedInput("AA0000AA"), "AA0000AA", "Wrong Normalized")
        
        XCTAssertEqual(PlateUAMotobike04.normalizedInput("*A0000AA"), "*A0000AA", "Wrong Normalized")
        XCTAssertEqual(PlateUAMotobike04.normalizedInput("**0000AA"), "**0000AA", "Wrong Normalized")
        XCTAssertEqual(PlateUAMotobike04.normalizedInput("**#000AA"), "**#000AA", "Wrong Normalized")
        XCTAssertEqual(PlateUAMotobike04.normalizedInput("**##00AA"), "**##00AA", "Wrong Normalized")
        XCTAssertEqual(PlateUAMotobike04.normalizedInput("**###0AA"), "**###0AA", "Wrong Normalized")
        XCTAssertEqual(PlateUAMotobike04.normalizedInput("**####*A"), "**####*A", "Wrong Normalized")
        XCTAssertEqual(PlateUAMotobike04.normalizedInput("**####**"), "**####**", "Wrong Normalized")
        XCTAssertEqual(PlateUAMotobike04.normalizedInput("AA0000AA"), "AA0000AA", "Wrong Normalized")
        XCTAssertEqual(PlateUAMotobike04.normalizedInput("AA0000AA"), "AA0000AA", "Wrong Normalized")
        XCTAssertEqual(PlateUAMotobike04.normalizedInput("AA0000AA"), "AA0000AA", "Wrong Normalized")
        
        XCTAssertEqual(PlateUAAuto04.normalizedInput("AA0000AAA"), "AA0000AAA", "Wrong Normalized")
        XCTAssertEqual(PlateUAAuto04.normalizedInput("AA0000AA0"), "AA0000AA0", "Wrong Normalized")
    }
    
    func testClassPlateUAAuto04()
    {
        let max = PlateUAAuto04.charLimit()
        let regexp = PlateUAAuto04.regexp()
        
        XCTAssert(regexp != nil, "regexp should be present")
        XCTAssertEqual(max, 8, "Wrong Limit")
        
        for i in 0..<max
        {
            guard let _ = PlateUAAuto04.charTypeForCharIndex(i) else
            {
                XCTAssert(true, "char should be present")
                
                break
            }
        }
    }

    private func validateCorrectPlateUAAuto04(_ input : String, expected : String)
    {
        // This is an example of a functional test case.
        // Use XCTAssert and related functions to verify your tests produce the correct results.
        
        let plate = PlateUAAuto04(input)
        
        XCTAssert(plate.isValid(), "\(input) - should be valid")
        
        XCTAssertEqual(plate.asString(), input, "Wrong initial Plate value")
        
        guard let type = plate.properties[UA.CountryPlate.Properties.kPlateType.rawValue] as? String else
        {
            XCTAssert(true, "Should have type")
            
            return
        }
        
        guard let normalized = plate.properties[UA.CountryPlate.Properties.kNormal.rawValue] as? String else
        {
            XCTAssert(true, "Should have normilized")
            
            return
        }
        
        XCTAssertEqual(type, UA.PlateType.Auto_04.rawValue, "Wrong PlateUI type")
        XCTAssertEqual(normalized, expected, "Wrong normalized value")
    }

    func testPlateUAAuto04()
    {
        validateCorrectPlateUAAuto04("AB0001BI", expected:"AB0001BI")
        validateCorrectPlateUAAuto04("A", expected:"A*####**")
    }
    
    
    func testPerformanceExample()
    {
        // This is an example of a performance test case.
        self.measure
            {
                // Put the code you want to measure the time of here.
        }
    }
    
}

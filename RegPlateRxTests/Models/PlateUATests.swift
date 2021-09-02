//
//  PlateUITests.swift
//  RegPlateRx
//
//  Created by Andriy Morgunov on 10/20/16.
//  Copyright © 2016 Andriy Morgunov. All rights reserved.
//

import XCTest
@testable import RegPlateRx

class PlateUATests: XCTestCase
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
    
    func testClassCountryPlate()
    {
        XCTAssertEqual(UA.CountryPlate.charLimit(), 0, "Wrong initial charLimit value for CountryPlate")
        XCTAssertEqual(UA.CountryPlate.regexp(), nil, "regexp should be nim for CountryPlate")
        XCTAssertEqual(UA.CountryPlate.charTypeForCharIndex(0), nil, "charTypeForCharIndex should be nim for CountryPlate")
        XCTAssertEqual(UA.CountryPlate.charTypeForCharIndex(0), nil, "charTypeForCharIndex should be nim for CountryPlate")
        XCTAssertEqual(UA.CountryPlate.normalizedInput("A"), "A", "Normalized form should be the same as input for CountryPlate")
        XCTAssertEqual(UA.CountryPlate.normalizedInput(""), "", "Normalized form should be the same as input for CountryPlate")
        XCTAssertEqual(UA.CountryPlate.normalizedInput(""), "", "Normalized form should be the same as input for CountryPlate")
        XCTAssertEqual(UA.CountryPlate.match(""), false, "Match should be always false for CountryPlate")
        XCTAssertEqual(UA.CountryPlate.match(""), false, "Match should be always false for CountryPlate")
    }

    func testCountryPlate()
    {
        let plate = UA.CountryPlate("AA0000BI")
        
        XCTAssertEqual(plate.isValid(), false, "CountryPlate always invalid")
        XCTAssertEqual(plate.properties.count, 0, "CountryPlate always hasn't properties")
        
        class StubCountryPlate : UA.CountryPlate
        {
            override func parse(_ input: String) -> Bool
            {
                XCTAssert(true, "Parse func shouldn't be called during initialization of CountryPlate")
                
                return super.parse(input)
            }
        }
        
        _ = StubCountryPlate("AA0000BI")
        
        // when parse is called direcly
        XCTAssertEqual(plate.parse("AA0000BI"), true, "CountryPlate always valid after calling parse")
        XCTAssertEqual(plate.isValid(), false, "CountryPlate still invalid after calling parse")
        XCTAssertGreaterThan(plate.properties.count, 0, "CountryPlate always has at least one property (normal)")
        if let normalized = plate.properties[UA.CountryPlate.Properties.kNormal.rawValue] as? String
        {
            XCTAssertEqual(normalized, "AA0000BI", "Normalized should be the same")
        }
        else
        {
            XCTAssert(true, "Property should be present")
        }
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

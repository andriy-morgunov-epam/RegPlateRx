//
//  PlateTests.swift
//  RegPlateRx
//
//  Created by Andriy Morgunov on 10/20/16.
//  Copyright © 2016 Andriy Morgunov. All rights reserved.
//

import XCTest
@testable import RegPlateRx

class PlateTests: XCTestCase {
    
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
    
    func testPlate()
    {
        // This is an example of a functional test case.
        // Use XCTAssert and related functions to verify your tests produce the correct results.
        
        var plate = Plate<String>()
        
        XCTAssertEqual(plate.asString(), "", "Wrong initial Plate value")
        
        plate = Plate<String>("AB3073BI")
        
        XCTAssertEqual(plate.asString(), "AB3073BI", "Wrong initial Plate value")
        
    }

    func testPlateFactory()
    {
        // This is an example of a functional test case.
        // Use XCTAssert and related functions to verify your tests produce the correct results.
        
        guard let _ = PlateFactory<String, Plate<String>>.create() else {
            
            XCTAssert(true, "Factory can't create Plate without value")
            
            return
        }

        guard let plate = PlateFactory<String, Plate<String>>.create(value: "AA0011EE") else {
            
            XCTAssert(true, "Factory can't create Plate with value")
            
            return
        }
        
        XCTAssertEqual(plate.asString(), "AA0011EE", "Wrong initial Plate value")
    }

    func testPlateProvider()
    {
        // This is an example of a functional test case.
        // Use XCTAssert and related functions to verify your tests produce the correct results.
        
        let provider = PlateProvider<String, String, Plate<String>>()
        
        let list = provider.getWithFilter(filter: "")
        
        XCTAssertEqual(list.count, 0, "Wrong provider result")
    }
    
    func testPerformanceExample()
    {
        // This is an example of a performance test case.
        self.measure {
            // Put the code you want to measure the time of here.
        }
    }
    
}

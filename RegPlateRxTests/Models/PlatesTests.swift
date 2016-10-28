//
//  PlatesTests.swift
//  RegPlateRx
//
//  Created by Andriy Morgunov on 10/20/16.
//  Copyright © 2016 Andriy Morgunov. All rights reserved.
//

import XCTest
@testable import RegPlateRx

class PlatesTests: XCTestCase
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
    
    func testPlates()
    {
        // This is an example of a functional test case.
        // Use XCTAssert and related functions to verify your tests produce the correct results.
        
        typealias PlateValue = String
        typealias FilterType = String
        typealias PlateType = Plate<PlateValue>
        
        let provider = PlateProvider<PlateValue, FilterType, PlateType>()
        
        let _ = Plates<PlateValue, FilterType, PlateType>(provider)
    }
    
    func testPerformanceExample()
    {
        // This is an example of a performance test case.
        self.measure {
            // Put the code you want to measure the time of here.
        }
    }
    
}

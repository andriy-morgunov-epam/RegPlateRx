//
//  PlateUAUtils.swift
//  RegPlate
//
//  Created by Andriy Morgunov on 8/28/15.
//  Copyright (c) 2015 Andriy Morgunov. All rights reserved.
//

import XCTest
@testable import RegPlateRx

class PlateUAServiceTests: XCTestCase {

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

    func testPlates() {

        var plates = PlateUASerice.plates("")
        XCTAssertGreaterThan(plates.count, 0, "Wrong quantity of plates")
        
        plates = PlateUASerice.plates("+")
        XCTAssertEqual(plates.count, 0, "Wrong quantity of plates")

        plates = PlateUASerice.plates("1234567890")
        XCTAssertEqual(plates.count, 0, "Wrong quantity of plates")
        
        plates = PlateUASerice.plates("AA")
        XCTAssertGreaterThan(plates.count, 0, "Wrong quantity of plates")
        
        plates = PlateUASerice.plates("*A")
        XCTAssertGreaterThan(plates.count, 0, "Wrong quantity of plates")
        
        plates = PlateUASerice.plates("*A##")
        XCTAssertGreaterThan(plates.count, 0, "Wrong quantity of plates")
        
        plates = PlateUASerice.plates("D")
        XCTAssertEqual(plates.count, 0, "Wrong quantity of plates")
        
        plates = PlateUASerice.plates("3")
        XCTAssertEqual(plates.count, 0, "Wrong quantity of plates")
    }

    func testPerformanceExample()
    {
        // This is an example of a performance test case.
        self.measure() {
            // Put the code you want to measure the time of here.
        }
    }

}

//
//  NYCSchoolsTests.swift
//  NYCSchoolsTests
//
//  Created by Greg Alton on 1/21/20.
//  Copyright © 2020 Greg Alton. All rights reserved.
//

import XCTest
@testable import NYCSchools

class NYCSchoolsTests: XCTestCase {

    override func setUp() {
        // Put setup code here. This method is called before the invocation of each test method in the class.
    }

    override func tearDown() {
        // Put teardown code here. This method is called after the invocation of each test method in the class.
    }

    func testExample() {
        // This is an example of a functional test case.
        // Use XCTAssert and related functions to verify your tests produce the correct results.
    }

    func testPerformanceExample() {
        // This is an example of a performance test case.
        self.measure {
            // Put the code you want to measure the time of here.
        }
    }
    
    func testSchoolViewModel() {
        let school = School(dbn: "123", school_name: "Academy of Science", boro: "M", overview_paragraph: "This is a test.")
        let schoolViewModel = SchoolViewModel(school: school)
        XCTAssertEqual(schoolViewModel.id, "123")
        XCTAssertEqual(schoolViewModel.name, "Academy of Science")
        XCTAssertEqual(schoolViewModel.detailTextString, "This is a test.")
    }

}

//
//  NetworkServiceTests.swift
//  NetworkServiceTests
//
//  Created by Greg Alton on 1/26/20.
//  Copyright © 2020 Greg Alton. All rights reserved.
//

import XCTest

class NetworkServiceTests: XCTestCase {
    
    var sut: URLSession!

    override func setUp() {
        super.setUp()
        sut = URLSession(configuration: .default)
    }

    override func tearDown() {
        sut = nil
        super.tearDown()
    }

    func testGetSchoolsHasStatus200() {
        //given
        let url = URL(string: "https://data.cityofnewyork.us/resource/s3k6-pzi2.json")
        
        // 1
        let promise = expectation(description: "Status Code: 200")
        
        //when
        let dataTask = sut.dataTask(with: url!) { data, response, error in
            
            //then
            if let error = error {
              XCTFail("Error: \(error.localizedDescription)")
              return
            } else if let statusCode = (response as? HTTPURLResponse)?.statusCode {
              if statusCode == 200 {
                // 2
                promise.fulfill()
              } else {
                XCTFail("Status code: \(statusCode)")
              }
            }
        }
        dataTask.resume()
        // 3
        wait(for: [promise], timeout: 5)
    }
    
    func testGetSATScoresHasStatus200() {
        //given
        let url = URL(string: "https://data.cityofnewyork.us/resource/f9bf-2cp4.json")
        
        // 1
        let promise = expectation(description: "Status Code: 200")
        
        //when
        let dataTask = sut.dataTask(with: url!) { data, response, error in
            
            //then
            if let error = error {
              XCTFail("Error: \(error.localizedDescription)")
              return
            } else if let statusCode = (response as? HTTPURLResponse)?.statusCode {
              if statusCode == 200 {
                // 2
                promise.fulfill()
              } else {
                XCTFail("Status code: \(statusCode)")
              }
            }
        }
        dataTask.resume()
        // 3
        wait(for: [promise], timeout: 5)
    }

}

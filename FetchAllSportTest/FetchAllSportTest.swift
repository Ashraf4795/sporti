//
//  NetworkManagerTest.swift
//  NetworkManagerTest
//
//  Created by Ashraf on 4/30/20.
//  Copyright © 2020 saraMohamed. All rights reserved.
//

import XCTest

@testable import SprotiApp

class FetchAllSportTest: XCTestCase,SportDelegate {

    var networkService:NetworkServiceProtocol?
    var expectationResponse:XCTestExpectation?
    
    override func setUp() {
        networkService = NetworkService()
    }

    override func tearDown() {
        networkService = nil
    }

    func testFetchAllSportFunction() {
        
        expectationResponse = XCTestExpectation(description: "all sport fetching expectation response")

        networkService?.fetchSports(delegate: self)
        wait(for: [expectationResponse!], timeout: 5, enforceOrder: true)
    }
    

    func fetchedSports(sports: [Sport]) {
        XCTAssert(sports.count>0, "fetching sport success")
        expectationResponse?.fulfill()
    }
    
    func error(message: String) {
        XCTFail()
    }
}

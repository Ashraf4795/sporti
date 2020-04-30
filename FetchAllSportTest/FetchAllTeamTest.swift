//
//  FetchAllTeamTest.swift
//  FetchAllSportTest
//
//  Created by Ashraf on 4/30/20.
//  Copyright © 2020 saraMohamed. All rights reserved.
//

import XCTest
@testable import SprotiApp

class FetchAllTeamTest: XCTestCase {

    var network : NetworkServiceProtocol?
    var expectation:XCTestExpectation?
    override func setUp() {
        network = MockFetchAllTeamService(shouldDelegateError: false)
    }

    override func tearDown() {
        network = nil
    }
    
    func testTeamDetailsFetch () {
        expectation = XCTestExpectation(description: "fetch team details expectation")
        
        network?.fetchTeamDetails(idTeam: 135120, delegate: self)
        
        wait(for: [expectation!], timeout: 5, enforceOrder: false)
    }


}


extension FetchAllTeamTest : TeamDetailsDelegate {
    
    func fetchedTeamDetails(teamDetails: TeamDetail) {
        XCTAssertNotNil(teamDetails.idTeam)
        expectation?.fulfill()
    }
    
    func error(message: String) {
        XCTFail()
    }
    
    
    
}

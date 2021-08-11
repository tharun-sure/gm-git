//
//  APIManagerTests.swift
//  GMGitTests
//
//  Created by Tharun Sure on 8/10/21.
//

import XCTest
@testable import GMGit

class APIManagerTests: XCTestCase {
    
    var sut: APIManager!
    
    override func setUp() {
        super.setUp()
        sut = APIManager()
    }

    override func tearDown() {
        sut = nil
        super.tearDown()
    }

    func testFetchCommitDataSuccess() {

        // Expectation for the commit data
        let expect = XCTestExpectation(description: "commit data success expectation")

        sut.getCommitsAPI(owner: "Alamofire", repo: "Alamofire") { commits, error in
            expect.fulfill()
            
            // test if commit data is not nil
            XCTAssertNotNil(commits)
            
            // test if commit data is greater than 25
            XCTAssertGreaterThan(commits.count, 25)
            
            // test the data
            for commitData in commits {
                XCTAssertNotNil(commitData.commit.author)
                XCTAssertNotNil(commitData.commit.message)
                XCTAssertNotNil(commitData.sha)
            }
        }

        wait(for: [expect], timeout: 5.0)
    }
    
    func testFetchCommitDataFailure() {

        // Expectation for the commit data
        let expect = XCTestExpectation(description: "commit data failure expectation")

        sut.getCommitsAPI(owner: "Alamofire", repo: "Alamo-fire") { commits, error in
            expect.fulfill()
            
            // test if commit data is 0 as the call fails
            XCTAssertEqual(commits.count, 0)
        }

        wait(for: [expect], timeout: 5.0)
    }
}


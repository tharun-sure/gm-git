//
//  GMGitTests.swift
//  GMGitTests
//
//  Created by Tharun Sure on 8/6/21.
//

import XCTest
@testable import GMGit

class GMGitTests: XCTestCase {
    
    var mockAPIManager: MockAPIManager!
    var sut: GMGitViewModel!
    
    override func setUp() {
        super.setUp()
        mockAPIManager = MockAPIManager()
        sut = GMGitViewModel(apiManager: mockAPIManager)
    }

    override func tearDown() {
        sut = nil
        mockAPIManager = nil
        super.tearDown()
    }
    
    func testFetchCommitData() {
        sut.getGitData()

        // Test if the getGitData is called
        XCTAssert(mockAPIManager.isGetCommitsAPICalled)
    }
}

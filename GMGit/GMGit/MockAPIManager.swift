//
//  MockAPIManager.swift
//  GMGit
//
//  Created by Tharun Sure on 8/10/21.
//

import Foundation

class MockAPIManager: APIManagerProtocol {
    
    var commitdata: [Commits] = [Commits]()
    var completionClosure: (([Commits], Error?) -> ())!
    
    var isGetCommitsAPICalled = false
    
    func getCommitsAPI(owner: String, repo: String, completion: @escaping ([Commits], Error?) -> ()) {
        isGetCommitsAPICalled = true
        completionClosure = completion
    }
    
    func fetchSuccess() {
        completionClosure(commitdata, nil)
    }
    
    func fetchFailure() {
        completionClosure([], nil)
    }
}

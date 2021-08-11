//
//  APIManagerProtocol.swift
//  GMGit
//
//  Created by Tharun Sure on 8/10/21.
//

import Foundation

public protocol APIManagerProtocol {
    func getCommitsAPI(owner: String, repo: String, completion: @escaping ([Commits], Error?) -> ())
}

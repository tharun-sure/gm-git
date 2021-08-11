//
//  GMGitModel.swift
//  GMGit
//
//  Created by Tharun Sure on 8/9/21.
//

import Foundation


struct Author: Codable {
    var name: String? = ""
}

struct Commit: Codable {
    var author: Author?
    var message: String? = ""
}

public struct Commits: Codable {
    var sha: String? = ""
    var commit: Commit
}

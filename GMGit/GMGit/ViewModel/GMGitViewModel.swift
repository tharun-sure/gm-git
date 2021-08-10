//
//  GMGitViewModel.swift
//  GMGit
//
//  Created by Tharun Sure on 8/9/21.
//

import Foundation

class GMGitViewModel: NSObject {
    
    var commitData: [Commits]? {
        didSet {
            self.bindGMGitViewModelToController()
        }
    }
    
    var bindGMGitViewModelToController: (() -> ()) = {}
    
    override init() {
        super.init()
        getGitData()
    }
    
    func getGitData() {
        APIManager.shared.getCommitsAPI(owner: "Alamofire", repo: "Alamofire") { commitData in
            self.commitData = commitData
        }
    }
}

//
//  GMGitViewModel.swift
//  GMGit
//
//  Created by Tharun Sure on 8/9/21.
//

import Foundation

class GMGitViewModel: NSObject {
    
    let apiManager: APIManagerProtocol
    
    var errorMessage: String?
    
    var commitData: [Commits]? {
        didSet {
            self.bindGMGitViewModelToController()
        }
    }
    
    var bindGMGitViewModelToController: (() -> ()) = {}
    
    init(apiManager: APIManagerProtocol = APIManager()) {
        self.apiManager = apiManager
    }
    
    func getGitData() {
        apiManager.getCommitsAPI(owner: "Alamofire", repo: "Alamofire") { [weak self] commitData, error in
            if let error = error {
                self?.errorMessage = error.localizedDescription
                print(error.localizedDescription)
            }
            else {
                self?.commitData = commitData
            }
        }
    }
}

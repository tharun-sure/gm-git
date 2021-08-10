//
//  APIManager.swift
//  GMGit
//
//  Created by Tharun Sure on 8/9/21.
//

import UIKit
import Alamofire

let base_url = "https://api.github.com/"

let commits = base_url + "repos/%@/%@/commits"

class APIManager: NSObject {
    
    static let shared : APIManager = { return APIManager() }()
    
    var lastRequest: DataRequest? = nil
    
    func callPostAPI(_ url: String,_ params: [String: Any]? = nil, completion:((_ res: DataResponse<Any>?, String?) -> Void)?) {
        self.lastRequest = Alamofire.request(url, method: .post, parameters: params, encoding: JSONEncoding.default)
        self.lastRequest?.session.configuration.timeoutIntervalForRequest = 3*60
        self.lastRequest?.responseJSON(completionHandler: { (response) in
            let sCode = response.response?.statusCode
            if sCode == nil || sCode == 401 {
                print("Token Issue - \(sCode ?? 0)\nAPI -\(url)\nAPI Status Code - \(sCode ?? 0)")
            }
            else {
                completion? (response, nil)
            }
        })
    }
    func callGetAPI(_ url: String,_ params: [String: Any]? = nil, completion:((_ res: DataResponse<Any>?,_ data: Data?, String?) -> Void)?) {
        self.lastRequest = Alamofire.request(url, method: .get, parameters: params, encoding: JSONEncoding.default)
        self.lastRequest?.session.configuration.timeoutIntervalForRequest = 3*60
        self.lastRequest?.responseJSON(completionHandler: { (response) in
            let sCode = response.response?.statusCode
            if sCode == nil || sCode == 401 {
                print("Token Issue - \(sCode ?? 0)\nAPI -\(url)\nAPI Status Code - \(sCode ?? 0)")
            }
            else {
                completion? (response, response.data, nil)
            }
        })
    }
    
    func getCommitsAPI(owner: String, repo: String, completion:((_ commits: [Commits]) -> Void)?) {
        let url = String.init(format: commits, owner, repo)
        callGetAPI(url) { result, data, message in
            let decoder = JSONDecoder()
            if let jsonData = data {
                do {
                    let commits = try decoder.decode([Commits].self, from: jsonData)
                    completion? (commits)
                } catch {
                    print(error)
                    completion? ([])
                }
            }
            else {
                completion? ([])
            }
        }
    }
}


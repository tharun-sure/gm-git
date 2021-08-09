//
//  GMGitViewController.swift
//  GMGit
//
//  Created by Tharun Sure on 8/9/21.
//

import UIKit

class GMGitViewController: UITableViewController {
    
    private var gmGitViewModel: GMGitViewModel!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        updateUI()
    }
    
    func updateUI() {
        self.gmGitViewModel = GMGitViewModel()
    }
    
}

//
//  GMGitViewController.swift
//  GMGit
//
//  Created by Tharun Sure on 8/9/21.
//

import UIKit

class GMGitViewController: UIViewController {
    
    @IBOutlet weak var gitTableView: CommitsTableView!
    private var gmGitViewModel: GMGitViewModel!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        updateUI()
    }
    
    func updateUI() {
        gmGitViewModel = GMGitViewModel()
        gmGitViewModel.bindGMGitViewModelToController = {
            self.updateDataSource()
        }
    }
    
    func updateDataSource() {
        if let commitData = gmGitViewModel.commitData {
            gitTableView.commits = commitData
            gitTableView.reloadTableData()
        }
    }
}

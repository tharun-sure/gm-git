//
//  CommitsTableView.swift
//  GMGit
//
//  Created by Tharun Sure on 8/9/21.
//

import UIKit

class CommitsTableView: UITableView {

    var commits: [Commits] = []
    
    override func awakeFromNib() {
        super.awakeFromNib()
        dataSource = self
        register(UINib.init(nibName: "CommitTableCell", bundle: nil), forCellReuseIdentifier: "CommitTableCell")
    }
    
    func reloadTableData() {
        reloadData()
    }
}

extension CommitsTableView: UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return commits.count
    }
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let cell = dequeueReusableCell(withIdentifier: "CommitTableCell") as? CommitTableCell else { return UITableViewCell() }
        cell.updateCellWithInfo(commits[indexPath.row])
        return cell
    }
}

//
//  CommitTableCell.swift
//  GMGit
//
//  Created by Tharun Sure on 8/9/21.
//

import UIKit

class CommitTableCell: UITableViewCell {
    
    @IBOutlet weak var authorLabel: UILabel!
    @IBOutlet weak var messageLabel: UILabel!
    @IBOutlet weak var hashLabel: UILabel!
    
    override func awakeFromNib() {
        super.awakeFromNib()
    }
    
    func updateCellWithInfo(_ commit: Commits) {
        authorLabel.text = commit.commit.author?.name
        messageLabel.text = commit.commit.message
        if let sha = commit.sha {
            hashLabel.text = String(sha.prefix(7))
        }
    }
}

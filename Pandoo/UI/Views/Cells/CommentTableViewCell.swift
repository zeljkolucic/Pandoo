//
//  CommentTableViewCell.swift
//  Pandoo
//
//  Created by Zeljko Lucic on 29.12.22..
//

import UIKit

class CommentTableViewCell: UITableViewCell {
    @IBOutlet private(set) weak var nameLabel: UILabel!
    @IBOutlet private(set) weak var timestampLabel: UILabel!
    @IBOutlet private(set) weak var commentLabel: UILabel!
    
    override func awakeFromNib() {
        super.awakeFromNib()
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)
    }
}

//
//  NotificationTableViewCell.swift
//  Pandoo
//
//  Created by Zeljko Lucic on 27.12.22..
//

import UIKit

class NotificationTableViewCell: UITableViewCell {
    @IBOutlet private(set) weak var timestampLabel: UILabel!
    @IBOutlet private(set) weak var titleLabel: UILabel!
    @IBOutlet private(set) weak var descriptionLabel: UILabel!
    
    override func awakeFromNib() {
        super.awakeFromNib()
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)
    }
}

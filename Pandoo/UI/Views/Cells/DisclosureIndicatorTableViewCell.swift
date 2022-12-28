//
//  DisclosureIndicatorTableViewCell.swift
//  Pandoo
//
//  Created by Zeljko Lucic on 27.12.22..
//

import UIKit

final class DisclosureIndicatorTableViewCell: UITableViewCell {
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: .default, reuseIdentifier: reuseIdentifier)
        
        backgroundColor = .systemGray6
        accessoryType = .disclosureIndicator
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}

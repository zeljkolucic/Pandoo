//
//  DestructiveTableViewCell.swift
//  Pandoo
//
//  Created by Zeljko Lucic on 27.12.22..
//

import UIKit

class DestructiveTableViewCell: UITableViewCell {
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: .default, reuseIdentifier: reuseIdentifier)
        
        backgroundColor = .systemGray6
        var configuration = defaultContentConfiguration()
        configuration.textProperties.color = .systemRed
        contentConfiguration = configuration
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}

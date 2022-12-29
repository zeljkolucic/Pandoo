//
//  PromoTicketCollectionViewCell.swift
//  Pandoo
//
//  Created by Zeljko Lucic on 29.12.22..
//

import UIKit

class PromoTicketCollectionViewCell: UICollectionViewCell {
    @IBOutlet private(set) weak var titleLabel: UILabel!
    @IBOutlet private(set) weak var gratisLabel: UILabel!
    @IBOutlet private(set) weak var onlyLabel: UILabel!
    @IBOutlet private(set) weak var priceLabel: UILabel!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        layer.cornerRadius = 20
        gratisLabel.text = Strings.gratis.localized
        onlyLabel.text = Strings.only.localized
    }
}

//
//  AnimalCollectionViewCell.swift
//  Pandoo
//
//  Created by Zeljko Lucic on 26.12.22..
//

import UIKit

class LikeableCollectionViewCell: UICollectionViewCell {
    @IBOutlet private(set) weak var likeButton: UIButton!
    @IBOutlet private(set) weak var imageView: UIImageView!
    @IBOutlet private(set) weak var titleLabel: UILabel!
    @IBOutlet private(set) weak var subtitleLabel: UILabel!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        layer.cornerRadius = 10
    }
    
    var isLiked: Bool = false {
        didSet {
            let systemName = isLiked ? "heart.fill" : "heart"
            let image = UIImage(systemName: systemName)
            likeButton.setImage(image, for: .normal)
        }
    }
    
    @IBAction private func didTapLikeButton() {
        isLiked.toggle()
    }
}

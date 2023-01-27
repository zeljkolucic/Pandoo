//
//  AnimalTableViewCell.swift
//  Pandoo
//
//  Created by Zeljko Lucic on 26.12.22..
//

import UIKit

class AnimalTableViewCell: UITableViewCell {
    @IBOutlet private(set) weak var corneredImageView: UIImageView! 
    @IBOutlet private(set) weak var titleLabel: UILabel!
    @IBOutlet private(set) weak var subtitleLabel: UILabel!
    @IBOutlet private(set) weak var numberOfLikesLabel: UILabel!
    @IBOutlet private(set) weak var likeButton: UIButton!
    
    var indexPath: IndexPath?
    weak var delegate: LikeButtonDelegate?
    
    var isLiked: Bool = false {
        didSet {
            let systemName = isLiked ? "heart.fill" : "heart"
            let configuration = UIImage.SymbolConfiguration(scale: .large)
            let image = UIImage(systemName: systemName)?.withConfiguration(configuration)
            likeButton.setImage(image, for: .normal)
        }
    }
    
    override func awakeFromNib() {
        super.awakeFromNib()
        corneredImageView.layer.cornerRadius = 10
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)
    }
    
    @IBAction private func didTapLikeButton() {
        isLiked.toggle()
        guard let indexPath else { return }
        delegate?.didTapLikeButton(at: indexPath)
    }
}

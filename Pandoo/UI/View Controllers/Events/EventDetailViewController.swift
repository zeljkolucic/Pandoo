//
//  EventDetailViewController.swift
//  Pandoo
//
//  Created by Zeljko Lucic on 29.12.22..
//

import UIKit

public final class EventDetailViewController: UIViewController {
    @IBOutlet private weak var imageView: UIImageView!
    @IBOutlet private weak var numberOfLikesLabel: UILabel!
    @IBOutlet private weak var likeButton: UIButton!
    @IBOutlet private weak var containerView: UIView!
    @IBOutlet private weak var titleLabel: UILabel!
    @IBOutlet private weak var descriptionLabel: UILabel!
    
    private var isLiked: Bool = false {
        didSet {
            let systemName = isLiked ? "heart.fill" : "heart"
            let configuration = UIImage.SymbolConfiguration(scale: .large)
            let image = UIImage(systemName: systemName)?.withConfiguration(configuration)
            likeButton.setImage(image, for: .normal)
        }
    }
    
    required init?(coder: NSCoder) {
        super.init(coder: coder)
    }
    
    public override func viewDidLoad() {
        super.viewDidLoad()
        configureLayout()
    }
    
    private func configureLayout() {
        containerView.layer.cornerRadius = 30
        containerView.layer.maskedCorners = [.layerMinXMinYCorner, .layerMaxXMinYCorner]
    }
    
    @IBAction private func didTapLikeButton() {
        isLiked.toggle()
    }
}

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
    
    private let viewModel: EventViewModel
    
    init?(coder: NSCoder, viewModel: EventViewModel) {
        self.viewModel = viewModel
        super.init(coder: coder)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    public override func viewDidLoad() {
        super.viewDidLoad()
        configureLayout()
        loadData()
    }
    
    private func configureLayout() {
        containerView.layer.cornerRadius = 30
        containerView.layer.maskedCorners = [.layerMinXMinYCorner, .layerMaxXMinYCorner]
    }
    
    private func loadData() {
        let event = viewModel.event
        titleLabel.text = event.title
        descriptionLabel.text = event.description
        imageView.image = UIImage(named: event.imageName)
        numberOfLikesLabel.text = String(event.numberOfLikes)
    }
    
    @IBAction private func didTapLikeButton() {
        isLiked.toggle()
        let event = viewModel.event
        event.numberOfLikes += isLiked ? 1 : -1
        numberOfLikesLabel.text = String(event.numberOfLikes)
    }
}

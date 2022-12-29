//
//  AnimalDetailViewController.swift
//  Pandoo
//
//  Created by Zeljko Lucic on 29.12.22..
//

import UIKit

public final class AnimalDetailViewController: UIViewController {
    @IBOutlet private weak var imageView: UIImageView!
    @IBOutlet private weak var numberOfLikesLabel: UILabel!
    @IBOutlet private weak var likeButton: UIButton!
    @IBOutlet private weak var containerView: UIView!
    @IBOutlet private weak var nameLabel: UILabel!
    @IBOutlet private weak var latinNameLabel: UILabel!
    @IBOutlet private weak var descriptionLabel: UILabel!
    @IBOutlet private weak var commentsLabel: UILabel!
    @IBOutlet private weak var commentsTableView: UITableView!
    @IBOutlet private weak var commentsTableViewHeightConstraint: NSLayoutConstraint!
    @IBOutlet private weak var gradientView: GradientView!
    @IBOutlet private weak var commentButton: UIButton!
    
    private var observation: NSKeyValueObservation?
    
    private var isLiked: Bool = false {
        didSet {
            let systemName = isLiked ? "heart.fill" : "heart"
            let configuration = UIImage.SymbolConfiguration(scale: .large)
            let image = UIImage(systemName: systemName)?.withConfiguration(configuration)
            likeButton.setImage(image, for: .normal)
        }
    }
    
    private let onComment: (UINavigationController?) -> Void
    
    public init?(coder: NSCoder, onComment: @escaping (UINavigationController?) -> Void) {
        self.onComment = onComment
        super.init(coder: coder)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    public override func viewDidLoad() {
        super.viewDidLoad()
        configureLayout()
    }
    
    private func configureLayout() {
        containerView.layer.cornerRadius = 30
        containerView.layer.maskedCorners = [.layerMinXMinYCorner, .layerMaxXMinYCorner]
        commentsLabel.text = Strings.comments.localized
        commentsTableView.register(CommentTableViewCell.self)
        observation = commentsTableView.observe(\.contentSize) { tableView, _ in
            self.commentsTableViewHeightConstraint.constant = tableView.contentSize.height
        }
        commentButton.layer.cornerRadius = 5
        commentButton.setTitle(Strings.comment.localized, for: .normal)
    }
    
    @IBAction private func didTapLikeButton() {
        isLiked.toggle()
    }
    
    @IBAction private func didTapCommentButton() {
        onComment(navigationController)
    }
}

extension AnimalDetailViewController: UITableViewDelegate, UITableViewDataSource {
    public func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 5
    }
    
    public func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let cell = tableView.dequeueReusableCell(CommentTableViewCell.self, indexPath: indexPath) else {
            return UITableViewCell()
        }
        
        return cell
    }
}

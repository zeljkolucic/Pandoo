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
    
    private let viewModel: AnimalViewModel
    private let onComment: (AnimalViewModel, UINavigationController?) -> Void
    
    public init?(coder: NSCoder, viewModel: AnimalViewModel, onComment: @escaping (AnimalViewModel, UINavigationController?) -> Void) {
        self.viewModel = viewModel
        self.onComment = onComment
        super.init(coder: coder)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    public override func viewDidLoad() {
        super.viewDidLoad()
        configureLayout()
        viewModel.delegate = self
        loadData()
    }
    
    private func configureLayout() {
        containerView.layer.cornerRadius = 30
        containerView.layer.maskedCorners = [.layerMinXMinYCorner, .layerMaxXMinYCorner]
        commentsLabel.text = Strings.comments.localized
        commentsTableView.register(CommentTableViewCell.self)
        commentsTableView.contentInset.bottom = 60
        observation = commentsTableView.observe(\.contentSize) { tableView, _ in
            self.commentsTableViewHeightConstraint.constant = tableView.contentSize.height + tableView.contentInset.bottom
        }
        commentButton.layer.cornerRadius = 5
        commentButton.setTitle(Strings.comment.localized, for: .normal)
    }
    
    private func loadData() {
        let animal = viewModel.animal
        nameLabel.text = animal.name
        latinNameLabel.text = animal.latinName
        descriptionLabel.text = animal.description
        imageView.image = UIImage(named: animal.imageName)
        numberOfLikesLabel.text = String(animal.numberOfLikes)
    }
    
    @IBAction private func didTapLikeButton() {
        isLiked.toggle()
        let animal = viewModel.animal
        animal.numberOfLikes += isLiked ? 1 : -1
        numberOfLikesLabel.text = String(animal.numberOfLikes)
    }
    
    @IBAction private func didTapCommentButton() {
        onComment(viewModel, navigationController)
    }
}

extension AnimalDetailViewController: UITableViewDelegate, UITableViewDataSource {
    public func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return viewModel.animal.comments.count
    }
    
    public func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let cell = tableView.dequeueReusableCell(CommentTableViewCell.self, indexPath: indexPath) else {
            return UITableViewCell()
        }
        
        let comment = viewModel.animal.comments[indexPath.row]
        let user = comment.user
        cell.nameLabel.text = "\(user.firstName) \(user.lastName)"
        cell.timestampLabel.text = comment.timestamp
        cell.commentLabel.text = comment.text
        
        return cell
    }
}

extension AnimalDetailViewController: CommentDelegate {
    func didAddComment() {
        commentsTableView.reloadData()
    }
}

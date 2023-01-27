//
//  EventsViewController.swift
//  Pandoo
//
//  Created by Zeljko Lucic on 26.12.22..
//

import UIKit

public final class EventsViewController: UIViewController {
    @IBOutlet private weak var tableView: UITableView!
    
    private let viewModel: EventsViewModel
    private let onSingleEvent: (Event, UINavigationController?) -> Void
    
    init?(coder: NSCoder, viewModel: EventsViewModel, onSingleEvent: @escaping (Event, UINavigationController?) -> Void) {
        self.viewModel = viewModel
        self.onSingleEvent = onSingleEvent
        super.init(coder: coder)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    public override func viewDidLoad() {
        super.viewDidLoad()
        configureLayout()
        configureTableView()
    }
    
    private func configureLayout() {
        navigationItem.title = Strings.eventsTitle.localized
    }
    
    private func configureTableView() {
        tableView.register(EventTableViewCell.self)
    }
}

extension EventsViewController: UITableViewDelegate, UITableViewDataSource {
    public func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return viewModel.events.count
    }
    
    public func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let cell = tableView.dequeueReusableCell(EventTableViewCell.self, indexPath: indexPath) else {
            return UITableViewCell()
        }
        
        let event = viewModel.events[indexPath.row]
        cell.titleLabel.text = event.title
        cell.subtitleLabel.text = event.description
        cell.corneredImageView.image = UIImage(named: event.imageName)
        cell.numberOfLikesLabel.text = String(event.numberOfLikes)
        cell.delegate = self
        
        return cell
    }
    
    public func tableView(_ tableView: UITableView, willDisplay cell: UITableViewCell, forRowAt indexPath: IndexPath) {
        guard let cell = cell as? EventTableViewCell else { return }
        cell.indexPath = indexPath
    }
    
    public func tableView(_ tableView: UITableView, didEndDisplaying cell: UITableViewCell, forRowAt indexPath: IndexPath) {
        guard let cell = cell as? EventTableViewCell else { return }
        cell.indexPath = nil
    }
    
    public func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        tableView.deselectRow(at: indexPath, animated: true)
        let event = viewModel.events[indexPath.row]
        onSingleEvent(event, navigationController)
    }
}

extension EventsViewController: LikeButtonDelegate {
    func didTapLikeButton(at indexPath: IndexPath) {
        guard let cell = tableView.cellForRow(at: indexPath) as? EventTableViewCell else { return }
        let event = viewModel.events[indexPath.row]
        event.numberOfLikes += cell.isLiked ? 1 : -1
        cell.numberOfLikesLabel.text = String(event.numberOfLikes)
    }
}

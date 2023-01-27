//
//  NotificationsViewController.swift
//  Pandoo
//
//  Created by Zeljko Lucic on 26.12.22..
//

import UIKit

public final class NotificationsViewController: UIViewController {
    @IBOutlet private weak var tableView: UITableView!
    
    private let viewModel: NotificationsViewModel
    
    init?(coder: NSCoder, viewModel: NotificationsViewModel) {
        self.viewModel = viewModel
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
        navigationItem.title = Strings.notificationsTitle.localized
    }
    
    private func configureTableView() {
        tableView.register(NotificationTableViewCell.self)
    }
}

extension NotificationsViewController: UITableViewDelegate, UITableViewDataSource {
    public func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return viewModel.notifications.count
    }
    
    public func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let cell = tableView.dequeueReusableCell(NotificationTableViewCell.self, indexPath: indexPath) else {
            return UITableViewCell()
        }
        
        let notification = viewModel.notifications[indexPath.row]
        cell.timestampLabel.text = notification.timestamp
        cell.titleLabel.text = notification.title
        cell.descriptionLabel.text = notification.description
        
        return cell
    }
    
    public func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        tableView.deselectRow(at: indexPath, animated: true)
    }
}

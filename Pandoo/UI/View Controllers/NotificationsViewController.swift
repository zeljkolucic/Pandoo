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
    public func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }
    
    public func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 5
    }
    
    public func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let cell = tableView.dequeueReusableCell(NotificationTableViewCell.self, indexPath: indexPath) else {
            return UITableViewCell()
        }
        
        cell.timestampLabel.text = "07/12/2022 10:30 AM"
        cell.titleLabel.text = "Notification Title Notification Title Notification Title Notification Title Notification Title "
        cell.descriptionLabel.text = "Notification Description Notification Description Notification Description Notification Description Notification Description Notification Description Notification Description Notification Description Notification Description Notification Description Notification Description Notification Description Notification Description "
        
        return cell
    }
    
    public func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        tableView.deselectRow(at: indexPath, animated: true)
    }
}

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
    
    init?(coder: NSCoder, viewModel: EventsViewModel) {
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
        navigationItem.title = Strings.eventsTitle.localized
    }
    
    private func configureTableView() {
        tableView.register(EventTableViewCell.self)
    }
}

extension EventsViewController: UITableViewDelegate, UITableViewDataSource {
    public func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 10
    }
    
    public func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let cell = tableView.dequeueReusableCell(EventTableViewCell.self, indexPath: indexPath) else {
            return UITableViewCell()
        }
        
        return cell
    }
    
    public func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        tableView.deselectRow(at: indexPath, animated: true)
    }
}

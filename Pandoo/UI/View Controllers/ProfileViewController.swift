//
//  ProfileViewController.swift
//  Pandoo
//
//  Created by Zeljko Lucic on 26.12.22..
//

import UIKit

public final class ProfileViewController: UIViewController {
    @IBOutlet private weak var titleLabel: UILabel!
    @IBOutlet private weak var emailLabel: UILabel!
    @IBOutlet private weak var tableView: UITableView!
    @IBOutlet private weak var tableViewHeightConstraint: NSLayoutConstraint!
    
    private var observation: NSKeyValueObservation?
    
    private let viewModel: ProfileViewModel
    
    init?(coder: NSCoder, viewModel: ProfileViewModel) {
        self.viewModel = viewModel
        super.init(coder: coder)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    public override func viewDidLoad() {
        super.viewDidLoad()
        viewModel.delegate = self
        configureLayout()
        configureTableView()
        observation = tableView.observe(\.contentSize) { tableView, _ in
            self.tableViewHeightConstraint.constant = tableView.contentSize.height
        }
    }
    
    private func configureLayout() {
        navigationItem.title = Strings.profileTitle.localized
        titleLabel.text = "Hi, \(viewModel.firstName!) \(viewModel.lastName!)!"
        emailLabel.text = viewModel.email
    }
    
    private func configureTableView() {
        tableView.register(DetailDisclosureTableViewCell.self, forCellReuseIdentifier: DetailDisclosureTableViewCell.className)
        tableView.register(DisclosureIndicatorTableViewCell.self, forCellReuseIdentifier: DisclosureIndicatorTableViewCell.className)
        tableView.register(DestructiveTableViewCell.self, forCellReuseIdentifier: DestructiveTableViewCell.className)
    }
}

extension ProfileViewController: UITableViewDelegate, UITableViewDataSource {
    public func numberOfSections(in tableView: UITableView) -> Int {
        return viewModel.items.count
    }
    
    public func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return viewModel.items[section].items.count
    }
    
    public func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let item = viewModel.items[indexPath.section].items[indexPath.row]
        switch item.self {
        case is DetailDisclosureItem:
            guard let cell = tableView.dequeueReusableCell(DetailDisclosureTableViewCell.self, indexPath: indexPath), let item = item as? DetailDisclosureItem else {
                return UITableViewCell()
            }
            
            var contentConfiguration = cell.defaultContentConfiguration()
            contentConfiguration.text = item.title
            contentConfiguration.secondaryText = item.detail
            cell.contentConfiguration = contentConfiguration
            
            return cell
            
        case is DisclosureItem:
            guard let cell = tableView.dequeueReusableCell(DisclosureIndicatorTableViewCell.self, indexPath: indexPath) else {
                return UITableViewCell()
            }
            
            var contentConfiguration = cell.defaultContentConfiguration()
            contentConfiguration.text = item.title
            cell.contentConfiguration = contentConfiguration
            
            return cell
            
        case is DestructiveItem:
            guard let cell = tableView.dequeueReusableCell(DestructiveTableViewCell.self, indexPath: indexPath) else {
                return UITableViewCell()
            }
            
            var contentConfiguration = cell.defaultContentConfiguration()
            contentConfiguration.text = item.title
            contentConfiguration.textProperties.color = .systemRed
            cell.contentConfiguration = contentConfiguration
            
            return cell
            
        default:
            return UITableViewCell()
        }
    }
    
    public func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        tableView.deselectRow(at: indexPath, animated: true)
        viewModel.items[indexPath.section].items[indexPath.row].action?()
    }
}

extension ProfileViewController: Selectable {
    func didSelectFirstName() {
        
    }
    
    func didSelectLastName() {
        
    }
    
    func didSelectPhone() {
        
    }
    
    func didSelectAddress() {
        
    }
    
    func didSelectChangePassword() {
        
    }
    
    func didSelectSignOut() {
        
    }
    
    func didSelectDeleteAccount() {
        
    }
}

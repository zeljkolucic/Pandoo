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
        
        viewModel.selectable = self
        viewModel.reloadable = self
        
        configureLayout()
        configureTableView()
        observation = tableView.observe(\.contentSize) { tableView, _ in
            self.tableViewHeightConstraint.constant = tableView.contentSize.height
        }
        
        loadUser()
    }
    
    private func configureLayout() {
        navigationItem.title = Strings.profileTitle.localized
        navigationController?.navigationBar.tintColor = .primaryGreen
    }
    
    private func loadUser() {
        if let firstName = viewModel.firstName, let lastName = viewModel.lastName {
            let title = Strings.greetingTitle.localized
            titleLabel.text = String(format: title, firstName, lastName)
        }
        
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
        let viewController = EditFirstNameViewController(viewModel: viewModel)
        navigationController?.pushViewController(viewController, animated: true)
    }
    
    func didSelectLastName() {
        let viewController = EditLastNameViewController(viewModel: viewModel)
        navigationController?.pushViewController(viewController, animated: true)
    }
    
    func didSelectPhone() {
        let viewController = EditPhoneViewController(viewModel: viewModel)
        navigationController?.pushViewController(viewController, animated: true)
    }
    
    func didSelectAddress() {
        let viewController = EditAddressViewController(viewModel: viewModel)
        navigationController?.pushViewController(viewController, animated: true)
    }
    
    func didSelectChangePassword() {
        let viewController = ChangePasswordViewController(viewModel: viewModel)
        navigationController?.pushViewController(viewController, animated: true)
    }
    
    func didSelectSignOut() {
        let title = Strings.signOutAlertTitle.localized
        let alertController = UIAlertController(title: title, message: .none, preferredStyle: .alert)
        alertController.addAction(UIAlertAction(title: Strings.no.localized, style: .default))
        alertController.addAction(UIAlertAction(title: Strings.ok.localized, style: .destructive, handler: { [weak self] _ in
            self?.dismiss(animated: true)
        }))
        present(alertController, animated: true)
    }
    
    func didSelectDeleteAccount() {
        let title = Strings.deleteAccountAlertTitle.localized
        let alertController = UIAlertController(title: title, message: Strings.deleteAccountDescription.localized, preferredStyle: .alert)
        alertController.addAction(UIAlertAction(title: Strings.no.localized, style: .default))
        alertController.addAction(UIAlertAction(title: Strings.ok.localized, style: .destructive, handler: { [weak self] _ in
            self?.dismiss(animated: true)
        }))
        present(alertController, animated: true)
    }
}

extension ProfileViewController: Reloadable {
    func reload() {
        loadUser()
        tableView.reloadData()
    }
}

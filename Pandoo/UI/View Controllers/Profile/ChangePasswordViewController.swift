//
//  ChangePasswordViewController.swift
//  Pandoo
//
//  Created by Zeljko Lucic on 29.12.22..
//

import UIKit

public final class ChangePasswordViewController: UIViewController {
    private lazy var tableView: UITableView = {
        let tableView = UITableView(frame: .zero, style: .grouped)
        tableView.register(SecureTextEntryTextFieldTableViewCell.self, forCellReuseIdentifier: SecureTextEntryTextFieldTableViewCell.className)
        tableView.delegate = self
        tableView.dataSource = self
        tableView.translatesAutoresizingMaskIntoConstraints = false
        return tableView
    }()
    
    private var oldPassword: String? {
        let indexPath = IndexPath(row: 0, section: 0)
        let cell = tableView.cellForRow(at: indexPath) as? SecureTextEntryTextFieldTableViewCell
        return cell?.text
    }
    
    private var newPassword: String? {
        let indexPath = IndexPath(row: 1, section: 0)
        let cell = tableView.cellForRow(at: indexPath) as? SecureTextEntryTextFieldTableViewCell
        return cell?.text
    }
    
    private var passwordConfirmation: String? {
        let indexPath = IndexPath(row: 2, section: 0)
        let cell = tableView.cellForRow(at: indexPath) as? SecureTextEntryTextFieldTableViewCell
        return cell?.text
    }
    
    private let viewModel: ProfileViewModel
    
    public init(viewModel: ProfileViewModel) {
        self.viewModel = viewModel
        super.init(nibName: nil, bundle: nil)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    public override func viewDidLoad() {
        super.viewDidLoad()
        configureLayout()
    }
    
    private func configureLayout() {
        view.backgroundColor = .white
        navigationItem.title = Strings.changePassword.localized
        navigationItem.rightBarButtonItem = .init(barButtonSystemItem: .done, target: self, action: #selector(didTapDoneButton))
        view.addSubview(tableView)
        tableView.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor).isActive = true
        tableView.leadingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.leadingAnchor).isActive = true
        tableView.bottomAnchor.constraint(equalTo: view.safeAreaLayoutGuide.bottomAnchor).isActive = true
        tableView.trailingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.trailingAnchor).isActive = true
    }
    
    @objc private func didTapDoneButton() {
        if validatePasswordConfirmation() {
            do {
                try viewModel.changePassword(oldPassword, newPassword)
                navigationController?.popViewController(animated: true)
            } catch {
                let title = Strings.weakPassword.localized
                let alertController = UIAlertController(title: title, message: nil, preferredStyle: .alert)
                alertController.addAction(UIAlertAction(title: Strings.ok.localized, style: .default))
                present(alertController, animated: true)
            }
        }
    }
    
    private func validatePasswordConfirmation() -> Bool {
        guard passwordConfirmation == newPassword else {
            let title = Strings.nonMatchingPasswords.localized
            let alertController = UIAlertController(title: title, message: nil, preferredStyle: .alert)
            alertController.addAction(UIAlertAction(title: Strings.ok.localized, style: .default))
            present(alertController, animated: true)
            return false
        }
        
        return true
    }
}

extension ChangePasswordViewController: UITableViewDelegate, UITableViewDataSource {
    public func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 3
    }
    
    public func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let cell = tableView.dequeueReusableCell(SecureTextEntryTextFieldTableViewCell.self, indexPath: indexPath) else {
            return UITableViewCell()
        }
        
        switch indexPath.row {
        case 0:
            cell.placeholder = Strings.oldPassword.localized
        case 1:
            cell.placeholder = Strings.newPassword.localized
        default:
            cell.placeholder = Strings.confirmPassword.localized
        }
        
        return cell
    }
}

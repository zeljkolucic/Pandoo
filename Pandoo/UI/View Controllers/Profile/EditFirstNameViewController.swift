//
//  EditFirstNameViewController.swift
//  Pandoo
//
//  Created by Zeljko Lucic on 28.12.22..
//

import UIKit

final class EditFirstViewController: UIViewController {
    private lazy var tableView: UITableView = {
        let tableView = UITableView(frame: .zero, style: .grouped)
        tableView.register(TextFieldTableViewCell.self, forCellReuseIdentifier: TextFieldTableViewCell.className)
        tableView.delegate = self
        tableView.dataSource = self
        tableView.translatesAutoresizingMaskIntoConstraints = false
        return tableView
    }()
    
    private var text: String? {
        let indexPath = IndexPath(row: 0, section: 0)
        let cell = tableView.cellForRow(at: indexPath) as? TextFieldTableViewCell
        return cell?.text
    }
    
    private let viewModel: ProfileViewModel
    
    init(viewModel: ProfileViewModel) {
        self.viewModel = viewModel
        super.init(nibName: nil, bundle: nil)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        configureLayout()
    }
    
    private func configureLayout() {
        view.backgroundColor = .white
        navigationItem.title = Strings.firstName.localized
        navigationItem.rightBarButtonItem = .init(barButtonSystemItem: .done, target: self, action: #selector(didTapDoneButton))
        view.addSubview(tableView)
        tableView.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor).isActive = true
        tableView.leadingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.leadingAnchor).isActive = true
        tableView.bottomAnchor.constraint(equalTo: view.safeAreaLayoutGuide.bottomAnchor).isActive = true
        tableView.trailingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.trailingAnchor).isActive = true
    }
    
    @objc private func didTapDoneButton() {
        do {
            try viewModel.changeFirstName(text)
            navigationController?.popViewController(animated: true)
        } catch {
            let title = Strings.emptyFirstName.localized
            let action = UIAlertAction(title: Strings.ok.localized, style: .default)
            let alertController = UIAlertController(title: title, message: nil, preferredStyle: .alert)
            alertController.addAction(action)
            present(alertController, animated: true)
        }
    }
}

extension EditFirstViewController: UITableViewDelegate, UITableViewDataSource {
    func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 1
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let cell = tableView.dequeueReusableCell(TextFieldTableViewCell.self, indexPath: indexPath) else {
            return UITableViewCell()
        }
        
        cell.text = viewModel.firstName
        
        return cell
    }
}

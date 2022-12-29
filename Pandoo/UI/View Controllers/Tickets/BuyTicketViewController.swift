//
//  BuyTicketViewController.swift
//  Pandoo
//
//  Created by Zeljko Lucic on 29.12.22..
//

import UIKit

public final class BuyTicketViewController: UIViewController {
    @IBOutlet private weak var tableView: UITableView!
    @IBOutlet private weak var totalLabel: UILabel!
    @IBOutlet private weak var buyButton: UIButton!
    
    public override func viewDidLoad() {
        super.viewDidLoad()
        configureLayout()
        configureTableView()
    }
    
    private func configureLayout() {
        navigationItem.leftBarButtonItem = .init(barButtonSystemItem: .close, target: self, action: #selector(didTapCloseButton))
        navigationController?.navigationBar.prefersLargeTitles = true
        navigationItem.title = "Group"
        buyButton.setTitle(Strings.buy.localized, for: .normal)
        buyButton.layer.cornerRadius = 5
    }
    
    private func configureTableView() {
        tableView.register(DatePickerTableViewCell.self, forCellReuseIdentifier: DatePickerTableViewCell.className)
        tableView.register(StepperTableViewCell.self, forCellReuseIdentifier: StepperTableViewCell.className)
    }
    
    @objc private func didTapCloseButton() {
        dismiss(animated: true)
    }
    
    @IBAction private func didTapBuyButton() {
        dismiss(animated: true)
    }
}

extension BuyTicketViewController: UITableViewDelegate, UITableViewDataSource {
    public func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 2
    }
    
    public func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        switch indexPath.row {
        case 0:
            guard let cell = tableView.dequeueReusableCell(StepperTableViewCell.self, indexPath: indexPath) else {
                return UITableViewCell()
            }
            
            return cell
            
        default:
            guard let cell = tableView.dequeueReusableCell(DatePickerTableViewCell.self, indexPath: indexPath) else {
                return UITableViewCell()
            }
            
            return cell
        }
    }
    
    public func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        tableView.deselectRow(at: indexPath, animated: true)
    }
}

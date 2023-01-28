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
    
    private let viewModel: BuyTicketViewModel
    
    public init?(coder: NSCoder, viewModel: BuyTicketViewModel) {
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
        navigationItem.leftBarButtonItem = .init(barButtonSystemItem: .close, target: self, action: #selector(didTapCloseButton))
        navigationController?.navigationBar.prefersLargeTitles = true
        buyButton.setTitle(Strings.buy.localized, for: .normal)
        buyButton.layer.cornerRadius = 5
        switch viewModel.ticketType {
        case .individual:
            navigationItem.title = Strings.individual.localized
            totalLabel.text = "Total: 6$"
        case .group:
            navigationItem.title = Strings.group.localized
            totalLabel.text = "Total: 9$"
        case .promo5plus1:
            navigationItem.title = "5 + 1"
            totalLabel.text = "Total: 30$"
        case .promo10plus3:
            navigationItem.title = "10 + 3"
            totalLabel.text = "Total: 60$"
        case .promo20plus7:
            navigationItem.title = "20 + 7"
            totalLabel.text = "Total: 120$"
        }
    }
    
    private func configureTableView() {
        tableView.register(DatePickerTableViewCell.self, forCellReuseIdentifier: DatePickerTableViewCell.className)
        tableView.register(StepperTableViewCell.self, forCellReuseIdentifier: StepperTableViewCell.className)
    }
    
    @objc private func didTapCloseButton() {
        dismiss(animated: true)
    }
    
    @IBAction private func didTapBuyButton() {
        if viewModel.ticketType == .group {
            let numberOfAdultsIndexPath = IndexPath(row: 0, section: 0)
            guard let numberOfAdultsCell = tableView.cellForRow(at: numberOfAdultsIndexPath) as? StepperTableViewCell else { return }
            let numberOfAdults = numberOfAdultsCell.value
            
            let numberOfChildrenIndexPath = IndexPath(row: 1, section: 0)
            guard let numberOfChildrenCell = tableView.cellForRow(at: numberOfChildrenIndexPath) as? StepperTableViewCell else { return }
            let numberOfChildren = numberOfChildrenCell.value
            
            if numberOfAdults == 0 && numberOfChildren == 0 {
                let title = Strings.groupTicketLimitation.localized
                let alertController = UIAlertController(title: title, message: nil, preferredStyle: .alert)
                alertController.addAction(UIAlertAction(title: Strings.ok.localized, style: .default))
                return present(alertController, animated: true)
            }
            
            let dateIndexPath = IndexPath(row: 2, section: 0)
            guard let dateCell = tableView.cellForRow(at: dateIndexPath) as? DatePickerTableViewCell else { return }
            let date = dateCell.datePicker.date
            
            buyTicket(for: date, numberOfAdults: numberOfAdults, numberOfChildren: numberOfChildren)
        } else {
            let dateIndexPath = IndexPath(row: 0, section: 0)
            guard let dateCell = tableView.cellForRow(at: dateIndexPath) as? DatePickerTableViewCell else { return }
            let date = dateCell.datePicker.date
            
            buyTicket(for: date)
        }
    }
    
    private func buyTicket(for date: Date, numberOfAdults: Int? = nil, numberOfChildren: Int? = nil) {
        viewModel.buyTicket(for: date, numberOfAdults: numberOfAdults, numberOfChildren: numberOfChildren) { [weak self] result in
            switch result {
            case .success:
                self?.dismiss(animated: true)
            case .failure:
                let title = Strings.alertErrorTitle.localized
                let alertController = UIAlertController(title: title, message: nil, preferredStyle: .alert)
                alertController.addAction(UIAlertAction(title: Strings.ok.localized, style: .default))
                self?.present(alertController, animated: true)
            }
        }
    }
    
    private func updateTotalValueLabel() {
        let numberOfAdultsIndexPath = IndexPath(row: 0, section: 0)
        guard let numberOfAdultsCell = tableView.cellForRow(at: numberOfAdultsIndexPath) as? StepperTableViewCell else { return }
        let numberOfAdults = numberOfAdultsCell.value
        
        let numberOfChildrenIndexPath = IndexPath(row: 1, section: 0)
        guard let numberOfChildrenCell = tableView.cellForRow(at: numberOfChildrenIndexPath) as? StepperTableViewCell else { return }
        let numberOfChildren = numberOfChildrenCell.value
        
        let totalValue = 6 * numberOfAdults + 3 * numberOfChildren
        totalLabel.text = "Total: \(totalValue)$"
    }
}

extension BuyTicketViewController: UITableViewDelegate, UITableViewDataSource {
    public func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        if viewModel.ticketType == .group {
            return 3
        }
        
        return 1
    }
    
    public func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        if viewModel.ticketType == .group {
            switch indexPath.row {
            case 0:
                guard let cell = tableView.dequeueReusableCell(StepperTableViewCell.self, indexPath: indexPath) else {
                    return UITableViewCell()
                }
                
                cell.textLabel?.text = Strings.adults.localized
                cell.delegate = self
                
                return cell
                
            case 1:
                guard let cell = tableView.dequeueReusableCell(StepperTableViewCell.self, indexPath: indexPath) else {
                    return UITableViewCell()
                }
                
                cell.textLabel?.text = Strings.children.localized
                cell.delegate = self
                
                return cell
                
            default:
                guard let cell = tableView.dequeueReusableCell(DatePickerTableViewCell.self, indexPath: indexPath) else {
                    return UITableViewCell()
                }
                
                return cell
            }
        } else {
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

extension BuyTicketViewController: StepperDelegate {
    func didChangeValue() {
        updateTotalValueLabel()
    }
}

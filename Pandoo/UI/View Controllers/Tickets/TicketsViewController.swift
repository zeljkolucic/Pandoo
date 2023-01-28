//
//  TicketsViewController.swift
//  Pandoo
//
//  Created by Zeljko Lucic on 26.12.22..
//

import UIKit

public final class TicketsViewController: UIViewController {
    @IBOutlet private weak var collectionView: UICollectionView!
    @IBOutlet private weak var buyTicketButton: UIButton!
    
    private let viewModel: TicketsViewModel
    private let onBuyTicket: (UINavigationController?) -> Void
    
    init?(coder: NSCoder, viewModel: TicketsViewModel, onBuyTicket: @escaping (UINavigationController?) -> Void) {
        self.viewModel = viewModel
        self.onBuyTicket = onBuyTicket
        super.init(coder: coder)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    deinit {
        NotificationCenter.default.removeObserver(self)
    }
    
    public override func viewDidLoad() {
        super.viewDidLoad()
        configureLayout()
        configureCollectionView()
        NotificationCenter.default.addObserver(self, selector: #selector(didUpdateTickets), name: .didUpdateTickets, object: nil)
    }
    
    private func configureLayout() {
        navigationController?.navigationBar.tintColor = .primaryGreen
        navigationItem.title = Strings.ticketsTitle.localized
        buyTicketButton.setTitle(Strings.buyTicket.localized, for: .normal)
        buyTicketButton.layer.cornerRadius = 5
    }
    
    private func configureCollectionView() {
        collectionView.register(TicketCollectionViewCell.self)
    }
    
    @IBAction private func didTapBuyTicketButton() {
        onBuyTicket(navigationController)
    }
    
    @objc private func didUpdateTickets() {
        collectionView.reloadData()
    }
}

extension TicketsViewController: UICollectionViewDelegate, UICollectionViewDataSource, UICollectionViewDelegateFlowLayout {
    public func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return viewModel.tickets.count
    }
    
    public func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        guard let cell = collectionView.dequeueReusableCell(TicketCollectionViewCell.self, indexPath: indexPath) else {
            return UICollectionViewCell()
        }
        
        let ticket = viewModel.tickets[indexPath.item]
        let user = ticket.user
        cell.titleLabel.text = "\(user.firstName) \(user.lastName) - ".appending(ticket.ticketId)
        cell.dateLabel.text = ticket.formattedDate
        cell.workTimeLabel.text = ticket.workingTime
        
        if ticket is IndividualTicket {
            cell.numberOfPersonsLabel.text = "1 person"
        } else if let ticket = ticket as? GroupTicket {
            cell.backgroundColor = .primaryOrange
            let numberOfPersons = ticket.numberOfAdults + ticket.numberOfChildren
            cell.numberOfPersonsLabel.text = "\(numberOfPersons) persons (\(ticket.numberOfAdults) adults, \(ticket.numberOfChildren) children)"
        } else if ticket is Promo5Plus1Ticket {
            cell.backgroundColor = .primaryPurple
            cell.numberOfPersonsLabel.text = "5 + 1"
        } else if ticket is Promo10Plus3Ticket {
            cell.backgroundColor = .primaryPurple
            cell.numberOfPersonsLabel.text = "10 + 3"
        } else {
            cell.backgroundColor = .primaryPurple
            cell.numberOfPersonsLabel.text = "20 + 7"
        }
        
        return cell
    }
    
    public func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        let width = UIScreen.main.bounds.width - 60
        let height: CGFloat = 180.0
        
        return CGSize(width: width, height: height)
    }
    
    public func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, minimumInteritemSpacingForSectionAt section: Int) -> CGFloat {
        return 30
    }
    
}

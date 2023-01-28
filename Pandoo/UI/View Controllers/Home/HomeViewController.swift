//
//  HomeViewController.swift
//  Pandoo
//
//  Created by Zeljko Lucic on 25.12.22..
//

import UIKit

public final class HomeViewController: UIViewController {
    @IBOutlet private weak var ticketsCollectionView: UICollectionView!
    @IBOutlet private weak var eventsTitle: UILabel!
    @IBOutlet private weak var seeAllEventsButton: UIButton!
    @IBOutlet private weak var eventsCollectionView: UICollectionView!
    @IBOutlet private weak var animalsTitle: UILabel!
    @IBOutlet private weak var exploreAnimalsButton: UIButton!
    @IBOutlet private weak var animalsCollectionView: UICollectionView!
    @IBOutlet private weak var workDaysLabel: UILabel!
    @IBOutlet private weak var workTimeLabel: UILabel!
    @IBOutlet private weak var contactLabel: UILabel!
    @IBOutlet private weak var phoneNumberLabel: UILabel!
    
    private let sectionInset = UIEdgeInsets(top: 0, left: 30, bottom: 0, right: 30)
    
    private let viewModel: HomeViewModel
    private let onSeeAllEvents: (UINavigationController?) -> Void
    private let onExploreAnimals: (UINavigationController?) -> Void
    private let onSingleEvent: (Event, UINavigationController?) -> Void
    private let onSingleAnimal: (Animal, UINavigationController?) -> Void
    
    public init?(coder: NSCoder, viewModel: HomeViewModel, onSeeAllEvents: @escaping (UINavigationController?) -> Void, onExploreAnimals: @escaping (UINavigationController?) -> Void, onSingleEvent: @escaping (Event, UINavigationController?) -> Void, onSingleAnimal: @escaping (Animal, UINavigationController?) -> Void) {
        self.viewModel = viewModel
        self.onSeeAllEvents = onSeeAllEvents
        self.onExploreAnimals = onExploreAnimals
        self.onSingleEvent = onSingleEvent
        self.onSingleAnimal = onSingleAnimal
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
        
        eventsTitle.text = Strings.eventsTitle.localized
        seeAllEventsButton.setTitle(Strings.seeAll.localized, for: .normal)
        
        animalsTitle.text = Strings.animalsTitle.localized
        exploreAnimalsButton.setTitle(Strings.explore.localized, for: .normal)
        
        workDaysLabel.text = Strings.mondayThroughSunday.localized
        workTimeLabel.text = Strings.workTime.localized
        
        contactLabel.text = Strings.contactPhone.localized
        phoneNumberLabel.text = "+381 11 123 456"
        
        if viewModel.tickets.isEmpty {
            ticketsCollectionView.isHidden = true
        }
    }
    
    private func configureCollectionView() {
        ticketsCollectionView.register(TicketCollectionViewCell.self)
        eventsCollectionView.register(LikeableCollectionViewCell.self)
        animalsCollectionView.register(LikeableCollectionViewCell.self)
    }
    
    @IBAction private func didTapSeeAllEventsButton() {
        onSeeAllEvents(navigationController)
    }
    
    @IBAction private func didTapExploreAnimalsButton() {
        onExploreAnimals(navigationController)
    }
    
    @objc private func didUpdateTickets() {
        if viewModel.tickets.isEmpty {
            ticketsCollectionView.isHidden = true
        } else {
            ticketsCollectionView.isHidden = false
            ticketsCollectionView.reloadData()
        }
    }
}

extension HomeViewController: UICollectionViewDelegate, UICollectionViewDataSource, UICollectionViewDelegateFlowLayout {
    public func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        if collectionView == ticketsCollectionView {
            return viewModel.tickets.count
        } else if collectionView == eventsCollectionView {
            return viewModel.events.count
        } else {
            return viewModel.animals.count
        }
    }
    
    public func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        if collectionView == ticketsCollectionView {
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
            
        } else if collectionView == eventsCollectionView {
            guard let cell = collectionView.dequeueReusableCell(LikeableCollectionViewCell.self, indexPath: indexPath) else {
                return UICollectionViewCell()
            }
            
            let event = viewModel.events[indexPath.item]
            cell.titleLabel.text = event.title
            cell.imageView.image = UIImage(named: event.imageName)
            
            return cell
            
        } else {
            guard let cell = collectionView.dequeueReusableCell(LikeableCollectionViewCell.self, indexPath: indexPath) else {
                return UICollectionViewCell()
            }
            
            let animal = viewModel.animals[indexPath.item]
            cell.titleLabel.text = animal.name
            cell.subtitleLabel.text = animal.latinName
            cell.imageView.image = UIImage(named: animal.imageName)
            
            return cell
        }
    }
    
    public func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        if collectionView == ticketsCollectionView {
            return CGSize(width: 330, height: 180)
        } else if collectionView == eventsCollectionView {
            return CGSize(width: 240, height: 170)
        } else {
            return CGSize(width: 120, height: 160)
        }
    }
    
    public func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, minimumInteritemSpacingForSectionAt section: Int) -> CGFloat {
        return 10
    }
    
    public func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, insetForSectionAt section: Int) -> UIEdgeInsets {
        return sectionInset
    }
    
    public func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        if collectionView == ticketsCollectionView {
            
        } else if collectionView == eventsCollectionView {
            let event = viewModel.events[indexPath.row]
            onSingleEvent(event, navigationController)
        } else {
            let animal = viewModel.animals[indexPath.row]
            onSingleAnimal(animal, navigationController)
        }
    }
}

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
    
    public override func viewDidLoad() {
        super.viewDidLoad()
        configureLayout()
        configureCollectionView()
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
}

extension TicketsViewController: UICollectionViewDelegate, UICollectionViewDataSource, UICollectionViewDelegateFlowLayout {
    public func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return 4
    }
    
    public func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        guard let cell = collectionView.dequeueReusableCell(TicketCollectionViewCell.self, indexPath: indexPath) else {
            return UICollectionViewCell()
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

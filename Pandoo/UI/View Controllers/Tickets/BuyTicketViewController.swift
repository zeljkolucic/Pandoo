//
//  BuyTicketViewController.swift
//  Pandoo
//
//  Created by Zeljko Lucic on 29.12.22..
//

import UIKit

public final class BuyTicketViewController: UIViewController {
    @IBOutlet private weak var promoTicketsCollectionView: UICollectionView!
    @IBOutlet private weak var regularTicketsCollectionView: UICollectionView!
    @IBOutlet private weak var regularTicketsCollectionViewHeightConstraint: NSLayoutConstraint!
    
    private var observation: NSKeyValueObservation?
    
    public override func viewDidLoad() {
        super.viewDidLoad()
        configureLayout()
        configureCollectionView()
    }
    
    private func configureLayout() {
        navigationItem.title = Strings.buyTicket.localized
    }
    
    private func configureCollectionView() {
        regularTicketsCollectionView.register(TicketCollectionViewCell.self)
        promoTicketsCollectionView.register(PromoTicketCollectionViewCell.self)
        observation = regularTicketsCollectionView.observe(\.contentSize, changeHandler: { collectionView, _ in
            self.regularTicketsCollectionViewHeightConstraint.constant = collectionView.contentSize.height
        })
    }
}

extension BuyTicketViewController: UICollectionViewDelegate, UICollectionViewDataSource, UICollectionViewDelegateFlowLayout {
    public func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        if collectionView == promoTicketsCollectionView {
            return 3
        } else {
            return 2
        }
    }
    
    public func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        if collectionView == promoTicketsCollectionView {
            guard let cell = collectionView.dequeueReusableCell(PromoTicketCollectionViewCell.self, indexPath: indexPath) else {
                return UICollectionViewCell()
            }
            
            return cell
        } else {
            guard let cell = collectionView.dequeueReusableCell(TicketCollectionViewCell.self, indexPath: indexPath) else {
                return UICollectionViewCell()
            }
            
            return cell
        }
    }
    
    public func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        if collectionView == promoTicketsCollectionView {
            return CGSize(width: 106, height: 150)
        } else {
            let width = UIScreen.main.bounds.width - 60
            let height: CGFloat = 180.0
            
            return CGSize(width: width, height: height)
        }
    }
    
    public func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, minimumInteritemSpacingForSectionAt section: Int) -> CGFloat {
        return 30
    }
    
    public func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, minimumLineSpacingForSectionAt section: Int) -> CGFloat {
        return 6
    }
}

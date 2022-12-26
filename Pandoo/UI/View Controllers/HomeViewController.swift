//
//  HomeViewController.swift
//  Pandoo
//
//  Created by Zeljko Lucic on 25.12.22..
//

import UIKit

public final class HomeViewController: UIViewController {
    @IBOutlet private weak var eventsTitle: UILabel!
    @IBOutlet private weak var seeAllEventsButton: UIButton!
    @IBOutlet private weak var eventsCollectionView: UICollectionView!
    @IBOutlet private weak var animalsTitle: UILabel!
    @IBOutlet private weak var exploreAnimalsButton: UIButton!
    @IBOutlet private weak var animalsCollectionView: UICollectionView!
    
    private let viewModel: HomeViewModel
    private let onSeeAllEvents: (UINavigationController?) -> Void
    private let onExploreAnimals: (UINavigationController?) -> Void
    
    public init?(coder: NSCoder, viewModel: HomeViewModel, onSeeAllEvents: @escaping (UINavigationController?) -> Void, onExploreAnimals: @escaping (UINavigationController?) -> Void) {
        self.viewModel = viewModel
        self.onSeeAllEvents = onSeeAllEvents
        self.onExploreAnimals = onExploreAnimals
        super.init(coder: coder)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    public override func viewDidLoad() {
        super.viewDidLoad()
        configureLayout()
//        configureCollectionView()
    }
    
    private func configureLayout() {
        
    }
    
    private func configureCollectionView() {
        eventsCollectionView.delegate = self
        eventsCollectionView.dataSource = self
        
        animalsCollectionView.delegate = self
        animalsCollectionView.dataSource = self
    }
    
    @objc private func didTapSeeAllEventsButton() {
        
    }
    
    @objc private func didTapExploreAnimalsButton() {
        
    }
}

extension HomeViewController: UICollectionViewDelegate, UICollectionViewDataSource, UICollectionViewDelegateFlowLayout {
    public func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        if collectionView == eventsCollectionView {
            return 0
        } else {
            return 0
        }
    }
    
    public func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        if collectionView == eventsCollectionView {
            return UICollectionViewCell()
        } else {
            return UICollectionViewCell()
        }
    }
    
    public func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        if collectionView == eventsCollectionView {
            return CGSize(width: 0, height: 0)
        } else {
            return CGSize(width: 0, height: 0)
        }
    }
}

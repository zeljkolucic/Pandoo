//
//  AnimalsViewController.swift
//  Pandoo
//
//  Created by Zeljko Lucic on 26.12.22..
//

import UIKit

public final class AnimalsViewController: UIViewController {
    @IBOutlet private weak var tableView: UITableView!
    
    private let viewModel: AnimalsViewModel
    private let onSingleAnimal: (Animal, UINavigationController?) -> Void
    
    init?(coder: NSCoder, viewModel: AnimalsViewModel, onSingleAnimal: @escaping (Animal, UINavigationController?) -> Void) {
        self.viewModel = viewModel
        self.onSingleAnimal = onSingleAnimal
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
        navigationItem.title = Strings.animalsTitle.localized
    }
    
    private func configureTableView() {
        tableView.register(AnimalTableViewCell.self)
    }
}

extension AnimalsViewController: UITableViewDelegate, UITableViewDataSource {
    public func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return viewModel.animals.count
    }
    
    public func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let cell = tableView.dequeueReusableCell(AnimalTableViewCell.self, indexPath: indexPath) else {
            return UITableViewCell()
        }
        
        let animal = viewModel.animals[indexPath.row]
        cell.titleLabel.text = animal.name
        cell.subtitleLabel.text = animal.latinName
        cell.numberOfLikesLabel.text = String(animal.numberOfLikes)
        cell.corneredImageView.image = UIImage(named: animal.imageName)
        cell.delegate = self
        
        return cell
    }
    
    public func tableView(_ tableView: UITableView, willDisplay cell: UITableViewCell, forRowAt indexPath: IndexPath) {
        guard let cell = cell as? AnimalTableViewCell else { return }
        cell.indexPath = indexPath
    }
    
    public func tableView(_ tableView: UITableView, didEndDisplaying cell: UITableViewCell, forRowAt indexPath: IndexPath) {
        guard let cell = cell as? AnimalTableViewCell else { return }
        cell.indexPath = nil
    }
    
    public func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        tableView.deselectRow(at: indexPath, animated: true)
        let animal = viewModel.animals[indexPath.row]
        onSingleAnimal(animal, navigationController)
    }
}

extension AnimalsViewController: LikeButtonDelegate {
    func didTapLikeButton(at indexPath: IndexPath) {
        guard let cell = tableView.cellForRow(at: indexPath) as? AnimalTableViewCell else { return }
        let animal = viewModel.animals[indexPath.row]
        animal.numberOfLikes += cell.isLiked ? 1 : -1
        cell.numberOfLikesLabel.text = String(animal.numberOfLikes)
    }
}

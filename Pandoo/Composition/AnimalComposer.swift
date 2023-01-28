//
//  AnimalComposer.swift
//  Pandoo
//
//  Created by Zeljko Lucic on 26.12.22..
//

import UIKit

public final class AnimalComposer {
    public static func animalsViewController() -> AnimalsViewController {
        let bundle = Bundle(for: AnimalsViewController.self)
        let storyboard = UIStoryboard(name: "Main", bundle: bundle)
        let viewModel = AnimalsViewModel()
        return storyboard.instantiateViewController(identifier: AnimalsViewController.className) { coder in
            return AnimalsViewController(coder: coder, viewModel: viewModel, onSingleAnimal: pushAnimalDetailViewController)
        }
    }
    
    public static func pushAnimalDetailViewController(with animal: Animal, to navigationController: UINavigationController?) {
        let bundle = Bundle(for: AnimalDetailViewController.self)
        let storyboard = UIStoryboard(name: "Main", bundle: bundle)
        let viewModel = AnimalViewModel(animal: animal)
        let viewController = storyboard.instantiateViewController(identifier: AnimalDetailViewController.className) { coder in
            return AnimalDetailViewController(coder: coder, viewModel: viewModel, onComment: pushCommentViewController)
        }

        navigationController?.pushViewController(viewController, animated: true)
    }
    
    public static func pushCommentViewController(with viewModel: AnimalViewModel, to navigationController: UINavigationController?) {
        let viewController = CommentViewController(viewModel: viewModel)
        navigationController?.pushViewController(viewController, animated: true)
    }
}

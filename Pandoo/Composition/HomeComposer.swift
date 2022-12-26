//
//  HomeComposer.swift
//  Pandoo
//
//  Created by Zeljko Lucic on 26.12.22..
//

import UIKit

public final class HomeComposer {
    public static func homeViewController() -> HomeViewController {
        let bundle = Bundle(for: HomeViewController.self)
        let storyboard = UIStoryboard(name: "Main", bundle: bundle)
        let viewModel = HomeViewModel()
        return storyboard.instantiateViewController(identifier: HomeViewController.className) { coder in
            return HomeViewController(coder: coder, viewModel: viewModel, onSeeAllEvents: pushEventsViewController, onExploreAnimals: pushAnimalsViewController)
        }
    }
    
    private static func pushEventsViewController(to navigationController: UINavigationController?) {
        let viewController = EventComposer.eventsViewController()
        navigationController?.pushViewController(viewController, animated: true)
    }
    
    private static func pushAnimalsViewController(to navigationController: UINavigationController?) {
        let viewController = AnimalComposer.animalsViewController()
        navigationController?.pushViewController(viewController, animated: true)
    }
}

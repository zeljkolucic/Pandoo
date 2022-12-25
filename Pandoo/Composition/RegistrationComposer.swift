//
//  RegistrationComposer.swift
//  Pandoo
//
//  Created by Zeljko Lucic on 22.12.22..
//

import UIKit

public final class RegistrationComposer {
    private init() {}
    
    public static func pushFirstStepRegistrationViewController(to navigationController: UINavigationController?) {
        let bundle = Bundle(for: FirstStepRegistrationViewController.self)
        let storyboard = UIStoryboard(name: "Main", bundle: bundle)
        let viewModel = RegistrationViewModel()
        let viewController = storyboard.instantiateViewController(identifier: FirstStepRegistrationViewController.className) { coder in
            return FirstStepRegistrationViewController(coder: coder, viewModel: viewModel, onNext: pushSecondStepRegistrationViewController)
        }
        navigationController?.pushViewController(viewController, animated: true)
    }
    
    private static func pushSecondStepRegistrationViewController(with viewModel: RegistrationViewModel, to navigationController: UINavigationController?) {
        let bundle = Bundle(for: FirstStepRegistrationViewController.self)
        let storyboard = UIStoryboard(name: "Main", bundle: bundle)
        let viewController = storyboard.instantiateViewController(identifier: SecondStepRegistrationViewController.className) { coder in
            return SecondStepRegistrationViewController(coder: coder, viewModel: viewModel, onSubmit: popToRootViewController)
        }
        navigationController?.pushViewController(viewController, animated: true)
    }
    
    private static func popToRootViewController(navigationController: UINavigationController?) {
        navigationController?.popToRootViewController(animated: true)
    }
}

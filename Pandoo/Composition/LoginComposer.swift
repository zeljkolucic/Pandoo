//
//  LoginComposer.swift
//  Pandoo
//
//  Created by Zeljko Lucic on 22.12.22..
//

import UIKit

public final class LoginComposer {
    private init() {}
    
    public static func loginViewControllerEmbeddedInNavigationController() -> UINavigationController {
        let bundle = Bundle(for: LoginViewController.self)
        let storyboard = UIStoryboard(name: "Main", bundle: bundle)
        let viewModel = LoginViewModel()
        let viewController = storyboard.instantiateViewController(identifier: LoginViewController.className) { coder in
            return LoginViewController(coder: coder, viewModel: viewModel, onLogin: presentTabBarController, onRegister: RegistrationComposer.pushFirstStepRegistrationViewController)
        }
        return UINavigationController(rootViewController: viewController)
    }
    
    private static func presentTabBarController(over viewController: UIViewController) {
        let tabBarController = MainComposer.tabBarController()
        viewController.present(tabBarController, animated: true)
    }
}

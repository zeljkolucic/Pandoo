//
//  LoginComposer.swift
//  Pandoo
//
//  Created by Zeljko Lucic on 22.12.22..
//

import UIKit

public final class LoginViewModel {
    
}

public final class LoginViewController: UIViewController {
    private let viewModel: LoginViewModel
    
    init?(coder: NSCoder, viewModel: LoginViewModel) {
        self.viewModel = viewModel
        super.init(coder: coder)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    public override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .systemPink
    }
}

public final class LoginComposer {
    private init() {}
    
    public static func loginViewControllerEmbeddedInNavigationController() -> UINavigationController {
        let bundle = Bundle(for: LoginViewController.self)
        let storyboard = UIStoryboard(name: "Main", bundle: bundle)
        let viewModel = LoginViewModel()
        let viewController = storyboard.instantiateViewController(identifier: LoginViewController.className) { coder in
            return LoginViewController(coder: coder, viewModel: viewModel)
        }
        return UINavigationController(rootViewController: viewController)
    }
}

public extension UIViewController {
    static var className: String {
        return String(describing: self.self)
    }
}

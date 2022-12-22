//
//  LoginViewController.swift
//  Pandoo
//
//  Created by Zeljko Lucic on 22.12.22..
//

import UIKit

public final class LoginViewController: UIViewController {
    @IBOutlet private weak var imageView: UIImageView!
    @IBOutlet private weak var titleLabel: UILabel!
    @IBOutlet private weak var emailTextField: RoundedTextField!
    @IBOutlet private weak var passwordTextField: RoundedTextField!
    @IBOutlet private weak var loginButton: RoundedButton!
    @IBOutlet private weak var orLabel: UILabel!
    @IBOutlet private weak var registerButton: RoundedButton!
    
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
        configureLayout()
    }
    
    private func configureLayout() {
        
    }
}

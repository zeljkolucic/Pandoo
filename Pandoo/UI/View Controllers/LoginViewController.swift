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
    @IBOutlet private weak var passwordTextField: PasswordTextField!
    @IBOutlet private weak var loginButton: LoadingButton!
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
        titleLabel.text = Strings.appName.localized
        emailTextField.setPlaceholder(Strings.email.localized)
        passwordTextField.setPlaceholder(Strings.password.localized)
        loginButton.setTitle(Strings.login.localized, for: .normal)
        orLabel.text = Strings.or.localized
        registerButton.setTitle(Strings.register.localized, for: .normal)
        registerButton.layer.borderColor = UIColor.primaryGreen?.cgColor
        registerButton.layer.borderWidth = 1
    }
    
    @IBAction private func didTapLoginButton() {
        loginButton.showLoading()
    }
    
    @IBAction private func didTapRegisterButton() {
        
    }
}

extension LoginViewController: UITextFieldDelegate {
    public func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        if textField == emailTextField {
            passwordTextField.becomeFirstResponder()
        } else {
            passwordTextField.resignFirstResponder()
        }
        
        return true
    }
}

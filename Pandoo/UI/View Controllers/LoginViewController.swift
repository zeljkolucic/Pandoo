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
    private let onLogin: (UIViewController?) -> ()
    private let onRegister: (UINavigationController?) -> ()
    
    init?(coder: NSCoder, viewModel: LoginViewModel, onLogin: @escaping (UIViewController?) -> (), onRegister: @escaping (UINavigationController?) -> ()) {
        self.viewModel = viewModel
        self.onLogin = onLogin
        self.onRegister = onRegister
        super.init(coder: coder)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    public override func viewDidLoad() {
        super.viewDidLoad()
        configureLayout()
    }
    
    public override func viewWillDisappear(_ animated: Bool) {
        super.viewWillDisappear(animated)
        cleanInputForms()
    }
    
    private func configureLayout() {
        navigationController?.navigationBar.tintColor = .primaryGreen
        titleLabel.text = Strings.appName.localized
        emailTextField.setPlaceholder(Strings.email.localized)
        passwordTextField.setPlaceholder(Strings.password.localized)
        loginButton.setTitle(Strings.login.localized, for: .normal)
        orLabel.text = Strings.or.localized
        registerButton.setTitle(Strings.register.localized, for: .normal)
        registerButton.layer.borderColor = UIColor.primaryGreen?.cgColor
        registerButton.layer.borderWidth = 1
    }
    
    private func cleanInputForms() {
        emailTextField.text = ""
        passwordTextField.text = ""
    }
    
    @IBAction private func didTapLoginButton() {
        UIView.animate(withDuration: 0.3) { [weak self] in
            self?.loginButton.showLoading()
        } completion: { [weak self] _ in
            self?.loginButton.hideLoading()
            self?.logIn()
        }
    }
    
    private func logIn() {
        let email = emailTextField.text ?? ""
        let password = passwordTextField.text ?? ""
        viewModel.logInWith(email: email, password: password) { [weak self] result in
            switch result {
            case .success:
                self?.onLogin(self)
            case .failure:
                let title = Strings.invalidCredentials.localized
                let alertController = UIAlertController(title: title, message: nil, preferredStyle: .alert)
                alertController.addAction(UIAlertAction(title: Strings.ok.localized, style: .default))
                self?.present(alertController, animated: true)
            }
        }
    }
    
    @IBAction private func didTapRegisterButton() {
        onRegister(navigationController)
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

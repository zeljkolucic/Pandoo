//
//  SecondStepRegistrationViewController.swift
//  Pandoo
//
//  Created by Zeljko Lucic on 25.12.22..
//

import UIKit

public final class SecondStepRegistrationViewController: UIViewController {
    @IBOutlet private weak var emailTextField: RoundedTextField!
    @IBOutlet private weak var passwordTextField: PasswordTextField!
    @IBOutlet private weak var confirmPasswordTextField: PasswordTextField!
    @IBOutlet private weak var submitButton: RoundedButton!
    
    private let viewModel: RegistrationViewModel
    private let onSubmit: (UINavigationController?) -> Void
    
    init?(coder: NSCoder, viewModel: RegistrationViewModel, onSubmit: @escaping (UINavigationController?) -> Void) {
        self.viewModel = viewModel
        self.onSubmit = onSubmit
        super.init(coder: coder)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    public override func viewDidLoad() {
        super.viewDidLoad()
        configureLayout()
        configureTextFields()
    }
    
    private func configureLayout() {
        navigationItem.title = Strings.secondStepRegistrationTitle.localized
        emailTextField.setPlaceholder(Strings.email.localized)
        passwordTextField.setPlaceholder(Strings.password.localized)
        confirmPasswordTextField.setPlaceholder(Strings.confirmPassword.localized)
        submitButton.setTitle(Strings.submit.localized, for: .normal)
        submitButton.isEnabled = false
    }
    
    @IBAction private func didTapSubmitButton() {
        viewModel.email = emailTextField.text
        viewModel.password = passwordTextField.text
        viewModel.register { [weak self] result in
            switch result {
            case .success:
                self?.onSubmit(self?.navigationController)
                
            case .failure:
                let title = Strings.registrationErrorAlertTitle.localized
                let alertController = UIAlertController(title: title, message: nil, preferredStyle: .alert)
                alertController.addAction(UIAlertAction(title: Strings.ok.localized, style: .default))
                self?.present(alertController, animated: true)
            }
        }
    }
    
    private func configureTextFields() {
        emailTextField.addTarget(self, action: #selector(didChangeEditing), for: .editingChanged)
        passwordTextField.addTarget(self, action: #selector(didChangeEditing), for: .editingChanged)
        confirmPasswordTextField.addTarget(self, action: #selector(didChangeEditing), for: .editingChanged)
    }
    
    @objc private func didChangeEditing() {
        validateInput()
    }
    
    private func validateInput() {
        do {
            try viewModel.validate(email: emailTextField.text)
            try viewModel.validate(password: passwordTextField.text)
            submitButton.isEnabled = confirmPasswordTextField.text == passwordTextField.text
        } catch {
            submitButton.isEnabled = false
        }
    }
    
    private func validateEmail(from email: String?) {
        do {
            try viewModel.validate(email: email)
        } catch {
            emailTextField.setMessage(error.localizedDescription)
        }
    }
    
    private func validatePassword(from password: String?) {
        do {
            try viewModel.validate(password: password)
        } catch {
            passwordTextField.setMessage(error.localizedDescription)
        }
    }
    
    private func validatePasswordConfirmation(from passwordConfirmation: String?) {
        if confirmPasswordTextField.text != passwordTextField.text {
            confirmPasswordTextField.setMessage(Strings.nonMatchingPasswords.localized)
        }
    }
}

extension SecondStepRegistrationViewController: UITextFieldDelegate {
    public func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        if textField == emailTextField {
            passwordTextField.becomeFirstResponder()
        } else if textField == passwordTextField {
            confirmPasswordTextField.becomeFirstResponder()
        } else {
            confirmPasswordTextField.resignFirstResponder()
        }
        
        return true
    }
    
    public func textFieldDidEndEditing(_ textField: UITextField) {
        if textField == emailTextField {
            validateEmail(from: emailTextField.text)
        } else if textField == passwordTextField {
            validatePassword(from: passwordTextField.text)
        } else {
            validatePasswordConfirmation(from: confirmPasswordTextField.text)
        }
    }
}

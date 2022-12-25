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
        onSubmit(navigationController)
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
}

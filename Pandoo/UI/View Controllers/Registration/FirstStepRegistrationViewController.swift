//
//  FirstStepRegistrationViewController.swift
//  Pandoo
//
//  Created by Zeljko Lucic on 22.12.22..
//

import UIKit

public final class FirstStepRegistrationViewController: UIViewController {
    @IBOutlet private weak var firstNameTextField: RoundedTextField!
    @IBOutlet private weak var lastNameTextField: RoundedTextField!
    @IBOutlet private weak var phoneTextField: RoundedTextField!
    @IBOutlet private weak var addressTextField: RoundedTextField!
    @IBOutlet private weak var nextButton: RoundedButton!
    
    private let viewModel: RegistrationViewModel
    private let onNext: (RegistrationViewModel, UINavigationController?) -> ()
    
    public init?(coder: NSCoder, viewModel: RegistrationViewModel, onNext: @escaping (RegistrationViewModel, UINavigationController?) -> ()) {
        self.viewModel = viewModel
        self.onNext = onNext
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
        navigationItem.title = Strings.firstStepRegistrationTitle.localized
        firstNameTextField.setPlaceholder(Strings.firstName.localized)
        lastNameTextField.setPlaceholder(Strings.lastName.localized)
        phoneTextField.setPlaceholder(Strings.phone.localized)
        addressTextField.setPlaceholder(Strings.address.localized)
        nextButton.setTitle(Strings.next.localized, for: .normal)
        nextButton.isEnabled = false
    }
    
    private func configureTextFields() {
        firstNameTextField.addTarget(self, action: #selector(didChangeEditing), for: .editingChanged)
        lastNameTextField.addTarget(self, action: #selector(didChangeEditing), for: .editingChanged)
        phoneTextField.addTarget(self, action: #selector(didChangeEditing), for: .editingChanged)
        addressTextField.addTarget(self, action: #selector(didChangeEditing), for: .editingChanged)
    }
    
    @IBAction private func didTapNextButton() {
        viewModel.firstName = firstNameTextField.text
        viewModel.lastName = lastNameTextField.text
        viewModel.phone = phoneTextField.text
        viewModel.address = addressTextField.text
        onNext(viewModel, navigationController)
    }
    
    @objc private func didChangeEditing() {
        validateInput()
    }
    
    private func validateInput() {
        do {
            try viewModel.validate(firstName: firstNameTextField.text)
            try viewModel.validate(lastName: lastNameTextField.text)
            try viewModel.validate(phone: phoneTextField.text)
            try viewModel.validate(address: addressTextField.text)
            nextButton.isEnabled = true
        } catch {
            nextButton.isEnabled = false
        }
    }
    
    private func validateFirstName(from firstName: String?) {
        do {
            try viewModel.validate(firstName: firstName)
        } catch {
            firstNameTextField.setMessage(error.localizedDescription)
        }
    }
    
    private func validateLastName(from lastName: String?) {
        do {
            try viewModel.validate(lastName: lastName)
        } catch {
            lastNameTextField.setMessage(error.localizedDescription)
        }
    }
    
    private func validatePhone(from phone: String?) {
        do {
            try viewModel.validate(phone: phone)
        } catch {
            phoneTextField.setMessage(error.localizedDescription)
        }
    }
    
    private func validateAddress(from address: String?) {
        do {
            try viewModel.validate(address: address)
        } catch {
            addressTextField.setMessage(error.localizedDescription)
        }
    }
}

extension FirstStepRegistrationViewController: UITextFieldDelegate {
    public func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        if textField == firstNameTextField {
            lastNameTextField.becomeFirstResponder()
        } else if textField == lastNameTextField {
            phoneTextField.becomeFirstResponder()
        } else if textField == phoneTextField {
            addressTextField.becomeFirstResponder()
        } else {
            addressTextField.resignFirstResponder()
        }
        
        return true
    }
    
    public func textFieldDidEndEditing(_ textField: UITextField) {
        if textField == firstNameTextField {
            validateFirstName(from: firstNameTextField.text)
        } else if textField == lastNameTextField {
            validateLastName(from: lastNameTextField.text)
        } else if textField == phoneTextField {
            validatePhone(from: phoneTextField.text)
        } else {
            validateAddress(from: addressTextField.text)
        }
    }
}

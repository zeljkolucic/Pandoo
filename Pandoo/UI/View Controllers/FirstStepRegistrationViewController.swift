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
    
    @IBAction private func didTapNextButton() {
        onNext(viewModel, navigationController)
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
}

//
//  PasswordTextField.swift
//  Pandoo
//
//  Created by Zeljko Lucic on 22.12.22..
//

import UIKit

class PasswordTextField: RoundedTextField {
    private lazy var toggleButton: UIButton = {
        let button = UIButton()
        let image = UIImage(systemName: "eye.fill")
        button.setImage(image, for: .normal)
        button.backgroundColor = .clear
        button.tintColor = .lightGray
        button.addTarget(self, action: #selector(didTapToggleButton), for: .touchUpInside)
        button.translatesAutoresizingMaskIntoConstraints = false
        return button
    }()
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        self.setup()
    }
    
    required init?(coder: NSCoder) {
        super.init(coder: coder)
        self.setup()
    }
    
    func setup() {
        self.delegate = self
        addSubview(toggleButton)
        toggleButton.centerYAnchor.constraint(equalTo: centerYAnchor).isActive = true
        toggleButton.trailingAnchor.constraint(equalTo: trailingAnchor, constant: -10).isActive = true
        toggleButton.widthAnchor.constraint(equalToConstant: 40).isActive = true
    }
    
    override var isSecureTextEntry: Bool {
        didSet {
            if isFirstResponder {
                becomeFirstResponder()
            }
        }
    }
    
    @discardableResult
    override func becomeFirstResponder() -> Bool {
        let success = super.becomeFirstResponder()
        if isSecureTextEntry, let oldText = text {
            text?.removeAll()
            insertText(oldText + "?")
            text?.removeLast()
        }
        return success
    }
    
    @objc func didTapToggleButton() {
        isSecureTextEntry.toggle()
        let systemName = isSecureTextEntry ? "eye.fill" : "eye.slash.fill"
        let image = UIImage(systemName: systemName)
        toggleButton.setImage(image, for: .normal)
    }
    
    override func editingDidBegin() {
        super.editingDidBegin()
        toggleButton.tintColor = .primaryGreen
    }
    
    override func editingDidEnd() {
        super.editingDidEnd()
        toggleButton.tintColor = .lightGray
    }
    
    private var padding: UIEdgeInsets {
        return UIEdgeInsets(top: 0, left: 15, bottom: 0, right: 50)
    }

    override open func textRect(forBounds bounds: CGRect) -> CGRect {
        return bounds.inset(by: padding)
    }

    override open func placeholderRect(forBounds bounds: CGRect) -> CGRect {
        return bounds.inset(by: padding)
    }

    override open func editingRect(forBounds bounds: CGRect) -> CGRect {
        return bounds.inset(by: padding)
    }
}

extension PasswordTextField: UITextFieldDelegate {
    func textFieldDidChangeSelection(_ textField: UITextField) {
        DispatchQueue.main.async {
            self.text = self.text ?? ""
        }
    }
}

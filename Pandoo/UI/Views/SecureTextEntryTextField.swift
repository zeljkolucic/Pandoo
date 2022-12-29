//
//  SecureTextEntryTextField.swift
//  Pandoo
//
//  Created by Zeljko Lucic on 29.12.22..
//

import UIKit

final class SecureTextEntryTextField: UITextField {
    override init(frame: CGRect) {
        super.init(frame: frame)
        self.delegate = self
    }
    
    required init?(coder: NSCoder) {
        super.init(coder: coder)
        self.delegate = self
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
}

extension SecureTextEntryTextField: UITextFieldDelegate {
    func textFieldDidChangeSelection(_ textField: UITextField) {
        DispatchQueue.main.async {
            self.text = self.text ?? ""
        }
    }
}

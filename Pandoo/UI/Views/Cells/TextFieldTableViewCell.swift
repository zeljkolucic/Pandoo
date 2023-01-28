//
//  TextFieldTableViewCell.swift
//  Pandoo
//
//  Created by Zeljko Lucic on 28.12.22..
//

import UIKit

class TextFieldTableViewCell: UITableViewCell {
    private(set) lazy var textField: UITextField = {
        let textField = UITextField()
        textField.delegate = self
        textField.clearButtonMode = .whileEditing
        textField.autocorrectionType = .no
        textField.autocapitalizationType = .none
        textField.translatesAutoresizingMaskIntoConstraints = false
        return textField
    }()
    
    var placeholder: String? {
        get {
            return textField.placeholder
        } set {
            textField.placeholder = newValue
        }
    }
    
    var text: String? {
        get {
            return textField.text
        } set {
            textField.text = newValue
        }
    }
    
    var keyboardType: UIKeyboardType = .default {
        didSet {
            textField.keyboardType = keyboardType
        }
    }
    
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: .default, reuseIdentifier: reuseIdentifier)
        configureLayout()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    var padding: CGFloat {
        return 12
    }
    
    private func configureLayout() {
        selectionStyle = .none
        contentView.addSubview(textField)
        textField.topAnchor.constraint(equalTo: contentView.topAnchor, constant: padding).isActive = true
        textField.leadingAnchor.constraint(equalTo: contentView.leadingAnchor, constant: padding).isActive = true
        let bottomConstraint = NSLayoutConstraint(item: textField, attribute: .bottom, relatedBy: .equal, toItem: contentView, attribute: .bottom, multiplier: 1.0, constant: -padding)
        bottomConstraint.priority = .defaultLow
        bottomConstraint.isActive = true
        textField.trailingAnchor.constraint(equalTo: contentView.trailingAnchor, constant: -padding).isActive = true
        textField.becomeFirstResponder()
    }
}

extension TextFieldTableViewCell: UITextFieldDelegate {
    func textFieldShouldClear(_ textField: UITextField) -> Bool {
        textField.text = ""
        return true
    }
}

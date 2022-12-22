//
//  RoundedTextField.swift
//  Pandoo
//
//  Created by Zeljko Lucic on 22.12.22..
//

import UIKit

class RoundedTextField: UITextField {
    private lazy var messageLabel: UILabel = {
        let label = UILabel()
        label.textColor = .systemRed
        label.font = .preferredFont(forTextStyle: .footnote)
        label.numberOfLines = .zero
        label.isHidden = true
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        addTargets()
        configureLayout()
    }
    
    required init?(coder: NSCoder) {
        super.init(coder: coder)
        addTargets()
        configureLayout()
    }
    
    private var cornerRadius: CGFloat {
        return 5
    }
    
    func setPlaceholder(_ text: String, color: UIColor = .lightGray, font: UIFont = .preferredFont(forTextStyle: .body)) {
        attributedPlaceholder = NSAttributedString(
            string: text,
            attributes: [
                NSAttributedString.Key.foregroundColor: color,
                NSAttributedString.Key.font: font
            ]
        )
    }
    
    func setMessage(_ text: String) {
        messageLabel.text = text
        layer.borderColor = UIColor.systemRed.cgColor
        messageLabel.isHidden = false
    }
    
    private func addTargets() {
        addTarget(self, action: #selector(editingDidBegin), for: .editingDidBegin)
        addTarget(self, action: #selector(editingDidEnd), for: .editingDidEnd)
    }
    
    private func configureLayout() {
        backgroundColor = .clear
        font = .preferredFont(forTextStyle: .body)
        layer.borderWidth = 1
        layer.borderColor = UIColor.lightGray.cgColor
        layer.cornerRadius = cornerRadius
        constrainMessageLabel()
    }
    
    private func constrainMessageLabel() {
        addSubview(messageLabel)
        messageLabel.topAnchor.constraint(equalTo: bottomAnchor).isActive = true
        messageLabel.leadingAnchor.constraint(equalTo: leadingAnchor).isActive = true
        messageLabel.trailingAnchor.constraint(equalTo: trailingAnchor).isActive = true
    }
    
    @objc func editingDidBegin() {
        layer.borderColor = UIColor.systemGreen.cgColor
        layer.borderWidth = 1.5
        messageLabel.isHidden = true
    }
    
    @objc func editingDidEnd() {
        layer.borderColor = UIColor.lightGray.cgColor
        layer.borderWidth = 1
    }
    
    private var padding: UIEdgeInsets {
        return UIEdgeInsets(top: 0, left: 15, bottom: 0, right: 15)
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


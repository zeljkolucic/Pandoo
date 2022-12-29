//
//  StepperTableViewCell.swift
//  Pandoo
//
//  Created by Zeljko Lucic on 29.12.22..
//

import UIKit

final class StepperTableViewCell: UITableViewCell {
    private lazy var stackView: UIStackView = {
        let stackView = UIStackView(arrangedSubviews: [valueLabel, stepper])
        stackView.axis = .horizontal
        stackView.distribution = .fill
        stackView.alignment = .fill
        stackView.spacing = 6
        stackView.translatesAutoresizingMaskIntoConstraints = false
        return stackView
    }()
    
    private(set) lazy var valueLabel: UILabel = {
        let label = UILabel()
        label.text = "\(value)"
        return label
    }()
    
    private(set) lazy var stepper: UIStepper = {
        let stepper = UIStepper()
        stepper.tintColor = .primaryGreen
        stepper.minimumValue = .zero
        stepper.addTarget(self, action: #selector(stepperValueChanged), for: .valueChanged)
        return stepper
    }()
    
    var value: Int {
        return Int(stepper.value)
    }
    
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: .default, reuseIdentifier: reuseIdentifier)
        
        backgroundColor = .systemGray6
        contentView.addSubview(stackView)
        stackView.topAnchor.constraint(equalTo: contentView.topAnchor, constant: 5).isActive = true
        stackView.trailingAnchor.constraint(equalTo: contentView.trailingAnchor, constant: -20).isActive = true
        let bottomConstraint = NSLayoutConstraint(item: stackView, attribute: .bottom, relatedBy: .equal, toItem: contentView, attribute: .bottom, multiplier: 1.0, constant: -5)
        bottomConstraint.priority = .defaultLow
        bottomConstraint.isActive = true
    }
    
    required init?(coder: NSCoder) {
        super.init(coder: coder)
    }
    
    @objc private func stepperValueChanged() {
        valueLabel.text = "\(value)"
    }
}

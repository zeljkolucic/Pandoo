//
//  RoundedButton.swift
//  Pandoo
//
//  Created by Zeljko Lucic on 22.12.22..
//

import UIKit

class RoundedButton: UIButton {
    override init(frame: CGRect) {
        super.init(frame: frame)
        configureLayout()
    }
    
    required init?(coder: NSCoder) {
        super.init(coder: coder)
        configureLayout()
    }
    
    override var isEnabled: Bool {
        didSet {
            alpha = isEnabled ? 1 : 0.5
        }
    }
    
    private func configureLayout() {
        titleLabel?.font = .preferredFont(forTextStyle: .body)
        layer.cornerRadius = 5
    }
}

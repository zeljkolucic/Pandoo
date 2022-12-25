//
//  SecondStepRegistrationViewController.swift
//  Pandoo
//
//  Created by Zeljko Lucic on 25.12.22..
//

import UIKit

public final class SecondStepRegistrationViewController: UIViewController {
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
        
    }
}

//
//  FirstStepRegistrationViewController.swift
//  Pandoo
//
//  Created by Zeljko Lucic on 22.12.22..
//

import UIKit

public final class FirstStepRegistrationViewController: UIViewController {
    private let viewModel: RegistrationViewModel
    
    public init?(coder: NSCoder, viewModel: RegistrationViewModel) {
        self.viewModel = viewModel
        super.init(coder: coder)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    public override func viewDidLoad() {
        super.viewDidLoad()
    }
}

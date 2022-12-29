//
//  MainTabBarController.swift
//  Pandoo
//
//  Created by Zeljko Lucic on 26.12.22..
//

import UIKit

public final class MainTabBarController: UITabBarController {
    private let controllers: () -> [UIViewController]
    
    init(controllers: @escaping () -> [UIViewController]) {
        self.controllers = controllers
        super.init(nibName: nil, bundle: nil)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    public override func viewDidLoad() {
        super.viewDidLoad()
        tabBar.tintColor = .primaryGreen
    }
    
    public override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        setViewControllers(controllers(), animated: true)
    }
}



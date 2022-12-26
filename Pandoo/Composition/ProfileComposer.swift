//
//  ProfileComposer.swift
//  Pandoo
//
//  Created by Zeljko Lucic on 26.12.22..
//

import UIKit

public final class ProfileComposer {
    public static func profileViewController() -> ProfileViewController {
        let bundle = Bundle(for: ProfileViewController.self)
        let storyboard = UIStoryboard(name: "Main", bundle: bundle)
        let viewModel = ProfileViewModel()
        return storyboard.instantiateViewController(identifier: ProfileViewController.className) { coder in
            return ProfileViewController(coder: coder, viewModel: viewModel)
        }
    }
}

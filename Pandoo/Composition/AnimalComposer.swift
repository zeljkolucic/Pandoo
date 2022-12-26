//
//  AnimalComposer.swift
//  Pandoo
//
//  Created by Zeljko Lucic on 26.12.22..
//

import UIKit

public final class AnimalComposer {
    public static func animalsViewController() -> AnimalsViewController {
        let bundle = Bundle(for: AnimalsViewController.self)
        let storyboard = UIStoryboard(name: "Main", bundle: bundle)
        let viewModel = AnimalsViewModel()
        return storyboard.instantiateViewController(identifier: AnimalsViewController.className) { coder in
            return AnimalsViewController(coder: coder, viewModel: viewModel)
        }
    }
}

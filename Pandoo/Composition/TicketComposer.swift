//
//  TicketComposer.swift
//  Pandoo
//
//  Created by Zeljko Lucic on 26.12.22..
//

import UIKit

public final class TicketComposer {
    public static func ticketsViewController() -> TicketsViewController {
        let bundle = Bundle(for: TicketsViewController.self)
        let storyboard = UIStoryboard(name: "Main", bundle: bundle)
        let viewModel = TicketsViewModel()
        return storyboard.instantiateViewController(identifier: TicketsViewController.className) { coder in
            return TicketsViewController(coder: coder, viewModel: viewModel)
        }
    }
}


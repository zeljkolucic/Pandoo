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
            return TicketsViewController(coder: coder, viewModel: viewModel, onBuyTicket: pushBuyTicketViewController)
        }
    }
    
    private static func pushBuyTicketViewController(to navigationController: UINavigationController?) {
        let bundle = Bundle(for: ChooseTicketViewController.self)
        let storyboard = UIStoryboard(name: "Main", bundle: bundle)
        let viewController = storyboard.instantiateViewController(identifier: ChooseTicketViewController.className) { coder in
            return ChooseTicketViewController(coder: coder, onTicket: presentBuyTicketViewController)
        }
        navigationController?.pushViewController(viewController, animated: true)
    }
    
    private static func presentBuyTicketViewController(over viewController: UIViewController) {
        let bundle = Bundle(for: ChooseTicketViewController.self)
        let storyboard = UIStoryboard(name: "Main", bundle: bundle)
        let buyTicketViewController = storyboard.instantiateViewController(withIdentifier: BuyTicketViewController.className)
        buyTicketViewController.modalPresentationStyle = .overFullScreen
        viewController.present(UINavigationController(rootViewController: buyTicketViewController), animated: true)
    }
}


//
//  EventComposer.swift
//  Pandoo
//
//  Created by Zeljko Lucic on 26.12.22..
//

import UIKit

public final class EventComposer {
    public static func eventsViewController() -> EventsViewController {
        let bundle = Bundle(for: EventsViewController.self)
        let storyboard = UIStoryboard(name: "Main", bundle: bundle)
        let viewModel = EventsViewModel()
        return storyboard.instantiateViewController(identifier: EventsViewController.className) { coder in
            return EventsViewController(coder: coder, viewModel: viewModel, onSingleEvent: pushEventDetailViewController)
        }
    }
    
    public static func pushEventDetailViewController(with event: Event, to navigationController: UINavigationController?) {
        let bundle = Bundle(for: EventDetailViewController.self)
        let storyboard = UIStoryboard(name: "Main", bundle: bundle)
        let viewModel = EventViewModel(event: event)
        let viewController = storyboard.instantiateViewController(identifier: EventDetailViewController.className) { coder in
            return EventDetailViewController(coder: coder, viewModel: viewModel)
        }
        navigationController?.pushViewController(viewController, animated: true)
    }
}

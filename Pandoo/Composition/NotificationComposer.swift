//
//  NotificationComposer.swift
//  Pandoo
//
//  Created by Zeljko Lucic on 26.12.22..
//

import UIKit

public final class NotificationComposer {
    public static func notificationsViewController() -> NotificationsViewController {
        let bundle = Bundle(for: NotificationsViewController.self)
        let storyboard = UIStoryboard(name: "Main", bundle: bundle)
        let viewModel = NotificationsViewModel()
        return storyboard.instantiateViewController(identifier: NotificationsViewController.className) { coder in
            return NotificationsViewController(coder: coder, viewModel: viewModel)
        }
    }
}

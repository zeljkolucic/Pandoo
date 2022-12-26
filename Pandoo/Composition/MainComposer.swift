//
//  MainComposer.swift
//  Pandoo
//
//  Created by Zeljko Lucic on 26.12.22..
//

import UIKit

public final class MainComposer {
    public static func tabBarController() -> UITabBarController {
        let tabBarController = MainTabBarController(controllers: viewControllers)
        return tabBarController
    }
    
    private static func viewControllers() -> [UIViewController] {
        return [homeViewControllerEmbeddedInNavigationController(), ticketsViewController(), notificationsViewController(), profileViewController()]
    }
    
    private static func homeViewControllerEmbeddedInNavigationController() -> UINavigationController {
        let title = Strings.homeTitle.localized
        let image = UIImage(systemName: "house")
        let selectedImage = UIImage(systemName: "house.fill")
        
        let viewController = HomeComposer.homeViewController()
        viewController.title = title
        viewController.tabBarItem = UITabBarItem(title: title, image: image, selectedImage: selectedImage)
        
        return UINavigationController(rootViewController: viewController)
    }
    
    private static func ticketsViewController() -> UIViewController {
        let title = Strings.ticketsTitle.localized
        let image = UIImage(systemName: "ticket")
        let selectedImage = UIImage(systemName: "ticket.fill")
        
        let viewController = TicketComposer.ticketsViewController()
        viewController.title = title
        viewController.tabBarItem = UITabBarItem(title: title, image: image, selectedImage: selectedImage)
        
        return viewController
    }
    
    private static func notificationsViewController() -> UIViewController {
        let title = Strings.notificationsTitle.localized
        let image = UIImage(systemName: "bell")
        let selectedImage = UIImage(systemName: "bell.fill")
        
        let viewController = NotificationComposer.notificationsViewController()
        viewController.title = title
        viewController.tabBarItem = UITabBarItem(title: title, image: image, selectedImage: selectedImage)
        
        return viewController
    }
    
    private static func profileViewController() -> UIViewController {
        let title = Strings.profileTitle.localized
        let image = UIImage(systemName: "person")
        let selectedImage = UIImage(systemName: "person.fill")
        
        let viewController = ProfileComposer.profileViewController()
        viewController.title = title
        viewController.tabBarItem = UITabBarItem(title: title, image: image, selectedImage: selectedImage)
        
        return viewController
    }
}

//
//  NotificationsViewModel.swift
//  Pandoo
//
//  Created by Zeljko Lucic on 26.12.22..
//

import Foundation

public final class NotificationsViewModel {
    var notifications: [Notification] = [
        Notification(
            title: "Siberian tiger Rocco celebrates his 7th birthday!",
            description: "On Sunday, 11th of December siberian tiger Rocco celebrates his 7th birthday. With this occasion in mind, we prepared 20% discount on group tickets for the fastest 100 of our visitors. Be sure to grab yours!",
            timestamp: "07/12/2022 10:30 AM"
        ),
        Notification(
            title: "Welcome giraffe Marco!",
            description: "This weekend we are welcoming Marco, 2-year-old male giraffe. You can come say hello to Marco any day starting from Friday. But please do not feed him, because Marco is lactose-intolerant :)",
            timestamp: "01/12/2022 1:15 AM"
        ),
        Notification(
            title: "25% discount for Black Friday!",
            description: "On Sunday, 11th of December siberian tiger Rocco celebrates his 7th birthday. With this occasion in mind, we prepared 20% discount on group tickets for the fastest 100 of our visitors. Be sure to grab yours!",
            timestamp: "24/11/2022 9:00 AM"
        )
    ]
}

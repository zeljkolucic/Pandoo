//
//  Notification+didBuyTicket.swift
//  Pandoo
//
//  Created by Zeljko Lucic on 28.1.23..
//

import Foundation

extension Foundation.Notification.Name {
    static var didUpdateTickets: Foundation.Notification.Name {
        return .init(rawValue: "didUpdateTickets")
    }
}

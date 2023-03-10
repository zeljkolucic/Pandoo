//
//  TicketsViewModel.swift
//  Pandoo
//
//  Created by Zeljko Lucic on 26.12.22..
//

import Foundation

public final class TicketsViewModel {
    var tickets: [Ticket] {
        return User.loggedInUser?.tickets ?? []
    }
}

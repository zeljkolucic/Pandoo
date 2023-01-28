//
//  Ticket.swift
//  Pandoo
//
//  Created by Zeljko Lucic on 28.1.23..
//

import Foundation

class Ticket {
    let user: User
    let ticketId: String
    let date: Date
    
    init(user: User, ticketId: String, date: Date) {
        self.user = user
        self.ticketId = ticketId
        self.date = date
    }
    
    var formattedDate: String {
        let dateFormatter = DateFormatter()
        dateFormatter.dateFormat = "EEEE, dd MMMM yyyy"
        return dateFormatter.string(from: date)
    }
    
    var workingTime: String {
        return "Open 9:30 - 20:00"
    }
    
    private static var id: Int = 1
    
    static func ticketId(for date: Date) -> String {
        let dateFormatter = DateFormatter()
        dateFormatter.dateFormat = "yyyyMMdd"
        let formattedDate = dateFormatter.string(from: date)
        let ticketId = formattedDate.appending(String(format: "%05d", id))
        id += 1
        return ticketId
    }
}

class IndividualTicket: Ticket {}

class GroupTicket: Ticket {
    let numberOfAdults: Int
    let numberOfChildren: Int
    
    init(user: User, ticketId: String, date: Date, numberOfAdults: Int, numberOfChildren: Int) {
        self.numberOfAdults = numberOfAdults
        self.numberOfChildren = numberOfChildren
        super.init(user: user, ticketId: ticketId, date: date)
        
    }
}

class Promo5Plus1Ticket: Ticket {}

class Promo10Plus3Ticket: Ticket {}

class Promo20Plus7Ticket: Ticket {}

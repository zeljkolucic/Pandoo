//
//  BuyTicketViewModel.swift
//  Pandoo
//
//  Created by Zeljko Lucic on 28.1.23..
//

import Foundation

public final class BuyTicketViewModel {
    let ticketType: TicketType
    
    public init(ticketType: TicketType) {
        self.ticketType = ticketType
    }
    
    struct PurchaseError: Error {}
    
    func buyTicket(for date: Date, numberOfAdults: Int? = nil, numberOfChildren: Int? = nil, completion: @escaping (Result<(), Error>) -> Void) {
        guard let user = User.loggedInUser else {
            return completion(.failure(PurchaseError()))
        }
        
        switch ticketType {
        case .individual:
            let ticket = IndividualTicket(
                user: user,
                ticketId: Ticket.ticketId(for: date),
                date: date)
            user.tickets.append(ticket)
            
        case .group:
            if let numberOfAdults, let numberOfChildren {
                let ticket = GroupTicket(
                    user: user,
                    ticketId: Ticket.ticketId(for: date),
                    date: date,
                    numberOfAdults: numberOfAdults,
                    numberOfChildren: numberOfChildren)
                user.tickets.append(ticket)
            }
            
        case .promo5plus1:
            let ticket = Promo5Plus1Ticket(
                user: user,
                ticketId: Ticket.ticketId(for: date),
                date: date)
            user.tickets.append(ticket)
            
        case .promo10plus3:
            let ticket = Promo10Plus3Ticket(
                user: user,
                ticketId: Ticket.ticketId(for: date),
                date: date)
            user.tickets.append(ticket)
            
        case .promo20plus7:
            let ticket = Promo20Plus7Ticket(
                user: user,
                ticketId: Ticket.ticketId(for: date),
                date: date)
            user.tickets.append(ticket)
        }
        
        NotificationCenter.default.post(name: .didUpdateTickets, object: nil)
        completion(.success(()))
    }
}

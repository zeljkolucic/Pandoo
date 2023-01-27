//
//  Event.swift
//  Pandoo
//
//  Created by Zeljko Lucic on 27.1.23..
//

import Foundation

public struct Event {
    public let title: String
    public let description: String
    public let imageName: String
    public let numberOfLikes: Int
    
    public static var events: [Event] = [
        Event(
            title: "Boo at the Zoo!",
            description: "It’s no trick, only the sweetest treat: Boo at the Zoo, Smithsonian’s National Zoo and Conservation Biology Institute’s beloved family-friendly Halloween event, sponsored by Mars Wrigley Confectionery, is back Oct. 28, 29 and 30 from 5:30 p.m. to 8:30 p.m. Tickets include special after-hours access for animal viewing at the Elephant Community Center, Small Mammal House, Reptile Discovery Center, Great Ape House and Think Tank, dance party, a souvenir tote bag and around 30 trick-or-treat stations around the Zoo.",
            imageName: "Boo at the Zoo!",
            numberOfLikes: 11
        ),
        Event(
            title: "Giant Panda Birthday Celebrations",
            description: "Visit Asia Trail or tune into the Giant Panda Cam to see the Zoo's giant pandas receive special birthday treats!\n\nJuly 22 at 9 a.m. | Mei Xiang's Birthday\n\nAug. 21 at 9 a.m. | Xiao Qi Ji's Birthday\n\nAug. 27 at 9 a.m. | Tian Tian's Birthday",
            imageName: "Giant Panda Birthday Celebrations",
            numberOfLikes: 27
        ),
        Event(
            title: "Birds in flight",
            description: "Get an up-close look at exotic birds soaring overhead in this free, limited-run avian spectacular at the Smithsonian’s National Zoo. Join renowned bird behaviorist Phung Luu for a dazzling display of natural behaviors by his flock of exotic birds — from owls and falcons to macaws, ravens and cockatoos — performing six days a week. Birds in Flight takes place on the Great Meadow, across from the outdoor orangutan yards, at 10 a.m. and 1 p.m. Wednesdays through Mondays (no shows on Tuesdays), May 28 through Sept. 5. This event is free and open to the public and will be held rain or shine.",
            imageName: "Birds in flight",
            numberOfLikes: 14
        ),
        Event(
            title: "Ferrets Back from the Brink",
            description: "Black-footed ferrets once occupied an expansive range stretching from Canada to Mexico—including 12 states in the US. Then came the threats of habitat fragmentation, loss of their food source, and Yersinia pestis (the bacteria that causes plague). By 1979, black-footed ferrets were considered extinct, but after decades of conservation efforts and collaboration by Smithsonian researchers and wildlife experts, they’re coming back from the brink of extinction. Paul Marinari, senior curator at Smithsonian’s National Zoo and Conservation Biology Institute, will discuss the ongoing efforts to reintroduce the black-footed ferret into its native range and the threats still impacting this critically endangered carnivore today.",
            imageName: "Ferrets Back from the Brink",
            numberOfLikes: 41
        ),
        Event(
            title: "Feast with the beasts",
            description: "Feast with the Beasts is BACK! After a three year hiatus, Feast returns as one of the most unique and highly anticipated fundraising events in South Florida! The event benefits Zoo Miami education and conservation initiatives. Enjoy a premier tasting event with delectable bites, open bars, animal encounters, live entertainment, a Land to Sea Lounge, a special animal feeding, and a silent auction with a chance to win a VIP Behind the Scenes Tour. Celebrate in style and party at Feast with Beasts from land to sea!",
            imageName: "Feast with the beasts",
            numberOfLikes: 38
        )
    ]
}

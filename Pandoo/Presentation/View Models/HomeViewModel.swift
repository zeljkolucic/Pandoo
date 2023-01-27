//
//  HomeViewModel.swift
//  Pandoo
//
//  Created by Zeljko Lucic on 26.12.22..
//

import Foundation

public final class HomeViewModel {
    var events = Array(Event.events.prefix(5))
    var animals = Array(Animal.animals.prefix(5))
}

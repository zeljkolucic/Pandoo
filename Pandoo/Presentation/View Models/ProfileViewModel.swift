//
//  ProfileViewModel.swift
//  Pandoo
//
//  Created by Zeljko Lucic on 26.12.22..
//

import Foundation

struct Section {
    var header: String?
    var items: [Item]
    var footer: String?
}

class Item {
    let title: String
    let action: (() -> Void)?
    
    init(title: String, action: (() -> Void)?) {
        self.title = title
        self.action = action
    }
}

class DetailDisclosureItem: Item {
    var detail: String?
    
    init(title: String, detail: String?, action: (() -> Void)?) {
        self.detail = detail
        super.init(title: title, action: action)
    }
}

class DisclosureItem: Item {}

class DestructiveItem: Item {}

protocol Selectable: NSObject {
    func didSelectFirstName()
    func didSelectLastName()
    func didSelectPhone()
    func didSelectAddress()
    func didSelectChangePassword()
    func didSelectSignOut()
    func didSelectDeleteAccount()
}

public final class ProfileViewModel {
    weak var delegate: Selectable?
    
    var email: String? = "zeljko.lucic99@gmail.com"
    var firstName: String? = "Zeljko"
    var lastName: String? = "Lucic"
    var phone: String? = "+381641234567"
    var address: String? = "Bulevar kralja Aleksandra 77"
    
    var items: [Section] { [
        Section(items: [
            DetailDisclosureItem(title: Strings.firstName.localized, detail: firstName, action: delegate?.didSelectFirstName),
            DetailDisclosureItem(title: Strings.lastName.localized, detail: lastName, action: delegate?.didSelectLastName),
            DetailDisclosureItem(title: Strings.phone.localized, detail: phone, action: delegate?.didSelectPhone),
            DetailDisclosureItem(title: Strings.address.localized, detail: address, action: delegate?.didSelectAddress)
        ]),
        Section(items: [
            DisclosureItem(title: Strings.changePassword.localized, action: delegate?.didSelectChangePassword),
            DisclosureItem(title: Strings.signOut.localized, action: delegate?.didSelectSignOut),
            DestructiveItem(title: Strings.deleteAccount.localized, action: delegate?.didSelectDeleteAccount)
        ], footer: Strings.deleteAccountDescription.localized)
    ] }
}



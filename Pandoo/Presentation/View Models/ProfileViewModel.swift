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

protocol Reloadable: AnyObject {
    func reload()
}

public final class ProfileViewModel {
    weak var selectable: Selectable?
    weak var reloadable: Reloadable?
    
    var email: String? = User.loggedInUser?.email {
        didSet {
            reloadable?.reload()
        }
    }
    
    var firstName: String? = User.loggedInUser?.firstName {
        didSet {
            if let firstName {
                User.loggedInUser?.firstName = firstName
            }
            reloadable?.reload()
        }
    }
    
    var lastName: String? = User.loggedInUser?.lastName {
        didSet {
            if let lastName {
                User.loggedInUser?.lastName = lastName
            }
            reloadable?.reload()
        }
    }
    
    var phone: String? = User.loggedInUser?.phoneNumber {
        didSet {
            if let phone {
                User.loggedInUser?.phoneNumber = phone
            }
            reloadable?.reload() }
    }
    
    var address: String? = User.loggedInUser?.address {
        didSet {
            if let address {
                User.loggedInUser?.address = address
            }
            reloadable?.reload()
        }
    }
    
    var items: [Section] { [
        Section(items: [
            DetailDisclosureItem(title: Strings.firstName.localized, detail: firstName, action: selectable?.didSelectFirstName),
            DetailDisclosureItem(title: Strings.lastName.localized, detail: lastName, action: selectable?.didSelectLastName),
            DetailDisclosureItem(title: Strings.phone.localized, detail: phone, action: selectable?.didSelectPhone),
            DetailDisclosureItem(title: Strings.address.localized, detail: address, action: selectable?.didSelectAddress)
        ]),
        Section(items: [
            DisclosureItem(title: Strings.changePassword.localized, action: selectable?.didSelectChangePassword),
            DisclosureItem(title: Strings.signOut.localized, action: selectable?.didSelectSignOut),
            DestructiveItem(title: Strings.deleteAccount.localized, action: selectable?.didSelectDeleteAccount)
        ], footer: Strings.deleteAccountDescription.localized)
    ] }
    
    func changeFirstName(_ firstName: String?) throws {
        try Validator.validate(firstName, against: .firstName)
        self.firstName = firstName
    }
    
    func changeLastName(_ lastName: String?) throws {
        try Validator.validate(lastName, against: .lastName)
        self.lastName = lastName
    }
    
    func changePhone(_ phone: String?) throws {
        try Validator.validate(phone, against: .phone)
        self.phone = phone
    }
    
    func changeAddress(_ address: String?) throws {
        try Validator.validate(address, against: .address)
        self.address = address
    }
    
    func changePassword(_ oldPassword: String?, _ newPassword: String?) throws {
        try Validator.validate(newPassword, against: .password)
        if let newPassword {
            User.loggedInUser?.password = newPassword
        }
    }
}



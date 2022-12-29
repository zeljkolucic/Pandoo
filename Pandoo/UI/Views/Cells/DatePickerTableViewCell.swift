//
//  DatePickerTableViewCell.swift
//  Pandoo
//
//  Created by Zeljko Lucic on 29.12.22..
//

import UIKit

final class DatePickerTableViewCell: UITableViewCell {
    private(set) lazy var datePicker: UIDatePicker = {
        let datePicker = UIDatePicker()
        datePicker.datePickerMode = .date
        datePicker.preferredDatePickerStyle = .compact
        datePicker.tintColor = .primaryGreen
        return datePicker
    }()
    
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: .default, reuseIdentifier: reuseIdentifier)
        
        backgroundColor = .systemGray6
        accessoryView = datePicker
        var configuration = defaultContentConfiguration()
        configuration.text = Strings.date.localized
        contentConfiguration = configuration
    }
    
    required init?(coder: NSCoder) {
        super.init(coder: coder)
    }
}

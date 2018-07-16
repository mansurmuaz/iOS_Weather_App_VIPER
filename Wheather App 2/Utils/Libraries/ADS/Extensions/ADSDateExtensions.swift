//
//  DateExtensions.swift
//  AdessoProjectTemplate
//
//  Created by Zafer Caliskan on 8.01.2018.
//  Copyright © 2018 adesso. All rights reserved.
//

import Foundation

extension Date {

    var dateFormatted: String {
        let dateFormatter = DateFormatter()
        dateFormatter.dateFormat = "dd.MM.yyyy"
        return dateFormatter.string(from: self)
    }
}

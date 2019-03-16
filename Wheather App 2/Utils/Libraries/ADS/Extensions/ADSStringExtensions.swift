//
//  StringExtensions.swift
//  AdessoProjectTemplate
//
//  Created by Zafer Caliskan on 8.01.2018.
//  Copyright © 2018 adesso. All rights reserved.
//

import Foundation

extension String {

    var localized: String {
        return NSLocalizedString(self, comment: "")
    }

    func localized(comment: String) -> String {
        return NSLocalizedString(self, comment: comment)
    }

    var storyboardLocalized: String {
        return NSLocalizedString(self, tableName: "StoryboardLocalizable", bundle: Bundle.main, value: "", comment: "")
    }
}

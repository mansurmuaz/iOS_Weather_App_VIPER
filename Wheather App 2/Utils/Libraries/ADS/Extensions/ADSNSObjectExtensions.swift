//
//  NSObjectExtensions.swift
//  AdessoProjectTemplate
//
//  Created by Zafer Caliskan on 8.01.2018.
//  Copyright © 2018 adesso. All rights reserved.
//

import Foundation

extension NSObject {

    class var className: String {
        return String(describing: self)
    }
}

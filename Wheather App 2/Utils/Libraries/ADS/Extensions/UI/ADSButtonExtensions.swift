//
//  UIButton.swift
//  MACFit
//
//  Created by Zafer Caliskan on 13/06/2017.
//  Copyright © 2017 marsathletic. All rights reserved.
//

import UIKit

extension ADSButton {

    @IBInspectable var localizedString: String {
        set {
            setTitle(newValue.storyboardLocalized, for: .normal)
        }
        get {
            guard let titleLabel = titleLabel, let text = titleLabel.text else {
                return ""
            }
            return text
        }
    }
}

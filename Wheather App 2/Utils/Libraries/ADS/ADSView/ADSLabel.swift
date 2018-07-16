//
//  ADSLabel.swift
//  AdessoProjectTemplate
//
//  Created by Zafer Caliskan on 12.02.2018.
//  Copyright © 2018 adesso. All rights reserved.
//

import UIKit

@IBDesignable
class ADSLabel: UILabel {

    @IBInspectable var letterSpacing: Double = 0.5

    override func layoutSubviews() {
        super.layoutSubviews()

        setAttributedText(text: text)
    }

    func setAttributedText(text: String?) {
        attributedText = ADSUtils.getCharacterSpacingAttributedString(text: text, space: letterSpacing)
    }
}

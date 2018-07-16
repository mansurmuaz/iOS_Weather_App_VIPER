//
//  ADSTextField.swift
//  AdessoProjectTemplate
//
//  Created by Zafer Caliskan on 12.02.2018.
//  Copyright © 2018 adesso. All rights reserved.
//

import UIKit

@IBDesignable
class ADSTextField: UITextField {

    override func draw(_: CGRect) {
        setAttributedText(text: text, letterSpacing: 0.5)
    }

    func setAttributedText(text: String?, letterSpacing: Double) {
        attributedText = ADSUtils.getCharacterSpacingAttributedString(text: text, space: letterSpacing)
    }
}

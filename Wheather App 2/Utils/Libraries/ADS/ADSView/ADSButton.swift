//
//  ADSButton.swift
//  AdessoProjectTemplate
//
//  Created by Zafer Caliskan on 12.02.2018.
//  Copyright © 2018 adesso. All rights reserved.
//

import UIKit

@IBDesignable
class ADSButton: UIButton {

    @IBInspectable var startGradientColor: UIColor?
    @IBInspectable var endGradientColor: UIColor?
    @IBInspectable var addShadow: Bool = false
    @IBInspectable var letterSpacing: Double = 0
    @IBInspectable var cornerRadius: CGFloat = 0
    @IBInspectable var topCornerRadius: CGFloat = 0

    // border height, color

    override func draw(_: CGRect) {
        if let start = startGradientColor, let end = endGradientColor {
            applyGradient(colors: [start, end], startPoint: CGPoint(x: 0, y: 0.5), endPoint: CGPoint(x: 1, y: 0.5))
        }
        if addShadow {
            applyShadow()
        }
        if letterSpacing > 0 {
            setAttributedText(text: titleLabel?.text, letterSpacing: letterSpacing)
        }

        if topCornerRadius > 0 {
            roundCorners([.topLeft, .topRight], radius: topCornerRadius)
        } else if cornerRadius > 0 {
            roundCorners([.topLeft, .topRight, .bottomLeft, .bottomRight], radius: cornerRadius)
        }
    }

    func applyShadow() {
        let shadowLayer = CALayer()
        shadowLayer.shadowColor = ADSUtils.getColor(red: 56, greeen: 62, blue: 51).cgColor
        shadowLayer.shadowOffset = CGSize(width: 2, height: 2)
        shadowLayer.shadowOpacity = 0.5
        shadowLayer.shadowRadius = 6.0
        shadowLayer.shadowPath = UIBezierPath(roundedRect: bounds, cornerRadius: cornerRadius).cgPath

        layer.insertSublayer(shadowLayer, at: 0)
    }

    func setAttributedText(text: String?, letterSpacing: Double) {
        titleLabel?.attributedText = ADSUtils.getCharacterSpacingAttributedString(text: text, space: letterSpacing)
    }
}

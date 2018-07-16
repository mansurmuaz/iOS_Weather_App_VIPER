//
//  ADSNavigationController.swift
//  AdessoBaseProject
//
//  Created by Zafer Caliskan on 1.03.2018.
//  Copyright © 2018 Zafer Caliskan. All rights reserved.
//

import UIKit

enum NavigationBarType {
    case white
    case blue
    case turquoise
    case black
}

class ADSNavigationController: UINavigationController {
    
    func changeNavigationBarType(_ navigationBarType: NavigationBarType) {
        switch navigationBarType {
        case .white:
            barTintColor(tintColor: UIColor.white)
            barTextColor(textColor: UIColor(red: 0/255, green: 79/255, blue: 182/255, alpha: 1.0))
            backIcon(backIconName: "Icon-back")
        case .blue:
            barTintColor(tintColor: UIColor(red: 13/255, green: 73/255, blue: 192/255, alpha: 1.0))
            barTextColor(textColor: UIColor.white)
            backIcon(backIconName: "Icon-back-white")
        case .turquoise:
            barTintColor(tintColor: UIColor(red: 0/255, green: 187/255, blue: 179/255, alpha: 1.0))
            barTextColor(textColor: UIColor.white)
            backIcon(backIconName: "Icon-back-white")
        case .black:
            barStyle(barStyle: .black)
            tintColor(tintColor: UIColor.white)
        }
    }
    
    fileprivate func barStyle(barStyle: UIBarStyle) {
        navigationBar.barStyle = barStyle
    }
    
    fileprivate func tintColor(tintColor: UIColor) {
        navigationBar.tintColor = tintColor
    }
    
    fileprivate func barTintColor(tintColor: UIColor) {
        navigationBar.barTintColor = tintColor
    }
    
    fileprivate func barTextColor(textColor: UIColor) {
        navigationBar.titleTextAttributes = [NSAttributedStringKey.foregroundColor: textColor]
    }
    
    fileprivate func backIcon(backIconName: String) {
        let backImage = UIImage(named: backIconName)?.withRenderingMode(.alwaysOriginal)
        navigationBar.backIndicatorImage = backImage
        navigationBar.backIndicatorTransitionMaskImage = backImage
    }

}

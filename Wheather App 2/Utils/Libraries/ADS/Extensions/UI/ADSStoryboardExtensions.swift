//
//  UIStoryboard.swift
//  MACFit
//
//  Created by Zafer Caliskan on 12/06/2017.
//  Copyright © 2017 marsathletic. All rights reserved.
//

import UIKit

extension UIStoryboard {

    func instantiateViewController<VC: UIViewController>() -> VC {
        guard let viewController = self.instantiateViewController(withIdentifier: VC.className) as? VC
        else { fatalError("could not instantiateViewController with identifier \(VC.className)") }
        return viewController
    }

    func instantiateViewControllerWithNavigationController<VC: UIViewController>() -> (navigationController: UINavigationController, viewController: VC) {
        guard let viewController = self.instantiateViewController(withIdentifier: VC.className) as? VC
        else { fatalError("could not instantiateViewController with identifier \(VC.className)") }

        let navigationController = ADSNavigationController(rootViewController: viewController)

        return (navigationController, viewController)
    }
}

//
//  BaseWireframe.swift
//  AdessoBaseProject
//
//  Created by Zafer Caliskan on 1.03.2018.
//  Copyright © 2018 Zafer Caliskan. All rights reserved.
//

import UIKit

enum WireframeTransitionType {
    case root
    case present(fromViewController: UIViewController)
    case push(navigationController: UINavigationController)
    case tabBar(tabBarController: UITabBarController, tabBarItem: UITabBarItem)
}

class BaseWireframe {
    
    internal func changeView(transationType: WireframeTransitionType, viewController: UIViewController) {
        switch transationType {
        case .root:
            ADSUtils.changeWindowRootController(viewController)
        case .present(let fromViewController):
            fromViewController.present(viewController, animated: true, completion: nil)
        case .push(let navigationController):
            navigationController.pushViewController(viewController, animated: true)
        case .tabBar(let tabBarController, let tabBarItem):
            viewController.tabBarItem = tabBarItem
            tabBarController.addChildViewController(viewController)
        }
    }
    
}

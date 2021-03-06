//
//  HomeWireframe.swift
//  Wheather App 2
//
//  Created by Mansur Muaz  Ekici on 16.07.2018.
//  Copyright (c) 2018 Adesso. All rights reserved.
//
//  Template generated by Zafer Caliskan

import UIKit

class HomeWireframe: BaseWireframe {
    
    func show(transitionType: WireframeTransitionType, delegate: HomePresenterDelegateProtocol? = nil, extras: Any? = nil) {

        let viewController: HomeViewController = UIStoryboard.home.instantiateViewController()
        let navigationController = ADSNavigationController(rootViewController: viewController)
        navigationController.changeNavigationBarType(.black)
        let interactor = HomeInteractor(networkService: NetworkService.sharedInstance, coreDataService: CoreDataService.sharedInstance)
        
        let presenter = HomePresenter(viewController: viewController, interactor: interactor, delegate: delegate, extras: extras)
        
        viewController.presenter = presenter
        interactor.presenter = presenter

        changeView(transationType: transitionType, viewController: navigationController)
    }
    
}

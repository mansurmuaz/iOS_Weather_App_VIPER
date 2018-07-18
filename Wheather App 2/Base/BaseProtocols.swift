//
//  BaseProtocols.swift
//  AdessoBaseProject
//
//  Created by Zafer Caliskan on 2.03.2018.
//  Copyright © 2018 Zafer Caliskan. All rights reserved.
//

import Foundation

// MARK: - View Controller

protocol BaseViewControllerProtocol: class {
    
    func showError(errorModel: ErrorModel)
    func showReachability()
    func showSplash()
    func reloadTableView()
    func deleteTableRow(indexPaths: [IndexPath])
}

// MARK: - Presenter

protocol BasePresenterViewProtocol: class {
    
}

protocol BasePresenterInteractorProtocol: class {
    
    func handleAndShowError(errorModel: ErrorModel)
    
}

protocol BasePresenterDelegateProtocol: class {
    
}

// MARK: - Interactor

protocol BaseInteractorProtocol: class {
    
}

// MARK: - Extensions

// MARK: View Controller

extension BaseViewControllerProtocol {
    
    func showError(errorModel: ErrorModel) { }
    func showReachability() { }
    func showSplash() { }
    func reloadTableView() { }
    func deleteTableRow(indexPaths: [IndexPath]) { }
}

// MARK: Presenter

extension BasePresenterViewProtocol {
    
}

extension BasePresenterInteractorProtocol {
    
    func handleAndShowError(errorModel: ErrorModel) { }
    
}

extension BasePresenterDelegateProtocol {
    
}

// MARK: Interactor

extension BaseInteractorProtocol {
    
}

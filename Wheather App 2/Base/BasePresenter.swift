//
//  BasePresenter.swift
//  AdessoBaseProject
//
//  Created by Zafer Caliskan on 1.03.2018.
//  Copyright © 2018 Zafer Caliskan. All rights reserved.
//

import Foundation

class BasePresenter {
    
    func handleError(errorModel: ErrorModel, viewController: BaseViewControllerProtocol? = nil) -> Bool {
        if let genericErrorType = errorModel.genericErrorType {
            switch genericErrorType {
            case .reachability:
                if let vc = viewController {
                    vc.showReachability()
                    return false
                }
            case .tokenExpired:
                if let vc = viewController {
                    vc.showSplash()
                    return false
                }
            default:
                return true
            }
        }
        if let vc = viewController {
            vc.showError(errorModel: errorModel)
            return false
        }
        return true
    }
    
}

// MARK: - Extensions

// MARK: - Protocols Implemantations

// MARK: View Protocol

extension BasePresenter: BasePresenterViewProtocol {
    
}

// MARK: Interactor Protocol

extension BasePresenter: BasePresenterInteractorProtocol {
    
    func handleAndShowError(errorModel: ErrorModel) { }
    
}

// MARK: Delegate Protocol

extension BasePresenter: BasePresenterDelegateProtocol {
    
}

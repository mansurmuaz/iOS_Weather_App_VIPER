//
//  BaseViewController.swift
//  AdessoBaseProject
//
//  Created by Zafer Caliskan on 1.03.2018.
//  Copyright © 2018 Zafer Caliskan. All rights reserved.
//

import UIKit

class BaseViewController: ADSViewController {
    
    // MARK: - Lifecycle
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        configureView()
    }
    
    // MARK: - Configure
    
    func configureView() { }

}

// MARK: - Extensions

// MARK: - Protocol Implemantations

extension BaseViewController: BaseViewControllerProtocol {
    
    func showError(errorModel: ErrorModel) {
        showSingleChoicePopup(popupType: .error, title: errorModel.errorType.localized, message: errorModel.errorMessage, completionHandler: nil)
    }
    
    func showReachability() {
        let reachabilityViewController: ADSReachabilityViewController = UIViewController.instantiateFromNib()
        present(reachabilityViewController, animated: true, completion: nil)
    }
    
    func showSplash() {
        
    }
        
}

//
//  BaseInteractor.swift
//  AdessoBaseProject
//
//  Created by Zafer Caliskan on 1.03.2018.
//  Copyright © 2018 Zafer Caliskan. All rights reserved.
//

import Foundation

class BaseInteractor {
    
    // MARK: - Properties
    
    internal var coreDataService: CoreDataService!
    internal var networkService: NetworkService!
    
    init(networkService: NetworkService?, coreDataService: CoreDataService?) {
        if let networkService = networkService {
            self.networkService = networkService
        }
        if let coreDataService = coreDataService {
            self.coreDataService = coreDataService
        }
    }
    
}

// MARK: - Extensions

// MARK: - Protocols Implemantations

extension BaseInteractor: BaseInteractorProtocol {
    
}

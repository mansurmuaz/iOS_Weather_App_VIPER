//
//  AddBookmarkInteractor.swift
//  Wheather App 2
//
//  Created by Mansur Muaz  Ekici on 16.07.2018.
//  Copyright (c) 2018 Adesso. All rights reserved.
//
//  Template generated by Zafer Caliskan

import Foundation
import CoreData

class AddBookmarkInteractor: BaseInteractor {
    
    // MARK: - Dependencies
    
    var presenter: AddBookmarkPresenterInteractorProtocol!
    
    // MARK: - Initialization
    
    override init(networkService: NetworkService? = nil, coreDataService: CoreDataService? = nil) {
        super.init(networkService: networkService, coreDataService: coreDataService)
    }
    
    // MARK: - Business Logic

}

// MARK: - Extensions

// MARK: - Protocols Implemantations

extension AddBookmarkInteractor: AddBookmarkInteractorProtocol {
    
    func saveLocation(latitude: Double, longitude: Double) {
        
        let context = coreDataService.managedObjectContext

        let newLocation = NSEntityDescription.insertNewObject(forEntityName: "Location", into: context)
        newLocation.setValue(latitude, forKey: "latitude")
        newLocation.setValue(longitude, forKey: "longitude")

        coreDataService.saveContext()

        presenter.dismissView()
    }
}

//
//  CoreDataService.swift
//  AdessoProjectTemplate
//
//  Created by Zafer Caliskan on 8.01.2018.
//  Copyright © 2018 adesso. All rights reserved.
//

import Foundation
import CoreData

class CoreDataService: CoreDataServiceProtocol {

    static let sharedInstance = CoreDataService()
    private init() {}

    // MARK: - Delegate

    func update() -> Bool {
        do {
            try managedObjectContext.save()

            return true
        } catch {}

        return false
    }

    func delete(location: Location) {
        
        let context = managedObjectContext
        context.delete(location)
        
        do {
            try context.save()
        } catch {
            print("Error while deleting location")
        }
    }

    // MARK: - CoreData Stack

    private lazy var applicationDocumentsDirectory: URL = {
        let urls = FileManager.default.urls(for: .documentDirectory, in: .userDomainMask)
        return urls[urls.count - 1]
    }()


    lazy var managedObjectContext: NSManagedObjectContext = {

        var managedObjectContext: NSManagedObjectContext?
            managedObjectContext = self.persistentContainer.viewContext
        return managedObjectContext!
    }()

    lazy var persistentContainer: NSPersistentContainer = {
        let container = NSPersistentContainer(name: "Wheather_App_2")
        container.loadPersistentStores(completionHandler: { _, error in
            if let error = error as NSError? {

                fatalError("Unresolved error \(error), \(error.userInfo)")
            }
        })
        print("\(self.applicationDocumentsDirectory)")
        return container
    }()

    // MARK: Core Data Saving support

    func saveContext() {
        if managedObjectContext.hasChanges {
            do {
                try managedObjectContext.save()
            } catch {
                let nserror = error as NSError
                NSLog("Unresolved error \(nserror), \(nserror.userInfo)")
                abort()
            }
        }
    }
    
    func fetchLocations() -> [Location]? {
        let context = managedObjectContext
        let request = NSFetchRequest<NSFetchRequestResult>(entityName: "Location")
        request.returnsObjectsAsFaults = false
        
        do {
            if let locationsData = try context.fetch(request) as? [Location] {
                return locationsData
            } else {
                return nil
            }
        } catch {
            print("Error while fetching data")
            return nil
        }
    }
}

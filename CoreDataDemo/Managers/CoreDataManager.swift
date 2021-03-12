//
//  CoreDataManager.swift
//  CoreDataDemo
//
//  Created by Muflis on 07/03/21.
//

import CoreData
import UIKit

final class CoreDataManager {
    //MARK: - Properties
    private let modelName: String
    
    //MARK:- initialization
    
    init(modelName: String) {
        self.modelName = modelName
        setupNotoficationHandling()
    }
    
    //MARK:- managedobject context
    private(set) lazy var managedObjectContext:  NSManagedObjectContext = {
        let managedObjectContext = NSManagedObjectContext(concurrencyType: .mainQueueConcurrencyType)
        managedObjectContext.persistentStoreCoordinator = self.persistentStoreCoordinator
        return managedObjectContext
        
        
    }()
    
    
    //MARK:- NSMAnagedObjectModel
    private lazy var managedObjectModel: NSManagedObjectModel = {
        guard let objectURL = Bundle.main.url(forResource: self.modelName, withExtension: "momd")
        else {
            fatalError("Unable to find dataModel")
        }
        
        guard let managedObjectModel = NSManagedObjectModel(contentsOf: objectURL)
        else {
            fatalError("Unable to load data model")
        }
        
        return managedObjectModel
    }()
    
    //MARK:- NSPersistentStorecoordinator
    private lazy var persistentStoreCoordinator: NSPersistentStoreCoordinator = {
        //instantiate PSC
        let persistantStoreCoordinator = NSPersistentStoreCoordinator(managedObjectModel: self.managedObjectModel)
        //create address for persistance store in Documents
        
        let fileManager = FileManager.default
        let storeName = "\(self.modelName).sqlite"
        let directoryUrl = fileManager.urls(for: .documentDirectory, in: .userDomainMask)[0]
        let persistentStoreUrl = directoryUrl.appendingPathComponent(storeName)
        
        
        do {
            let options = [NSMigratePersistentStoresAutomaticallyOption: true, NSInferMappingModelAutomaticallyOption: true]
         try   persistantStoreCoordinator.addPersistentStore(ofType: NSSQLiteStoreType, configurationName: nil, at: persistentStoreUrl, options: options)
        }
        
        catch {
            fatalError("No conection to sql lite")
        }
        
        return persistantStoreCoordinator
    }()
    
    private func setupNotoficationHandling() {
        let notificationCenter = NotificationCenter.default
        notificationCenter.addObserver(self, selector: #selector(saveChanges(_:)), name: UIApplication.didEnterBackgroundNotification, object: nil)
        
        notificationCenter.addObserver(self, selector: #selector(saveChanges(_:)), name: UIApplication.willTerminateNotification, object: nil)
        

        
    }
    
    @objc func saveChanges(_ notification: Notification) {
        saveChanges()
    }
    
    private func saveChanges() {
        guard managedObjectContext.hasChanges else { return }
        do {
            try managedObjectContext.save()
        }
        catch {
            print("\(error), \(error.localizedDescription)")
        }
    }
}

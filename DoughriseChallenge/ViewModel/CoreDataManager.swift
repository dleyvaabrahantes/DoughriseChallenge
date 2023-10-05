//
//  CoreDataManager.swift
//  QuickListerGo
//
//  Created by David on 9/18/23.
//

import Foundation
import CoreData

class CoreDataManager {
    private let persistenContainer: NSPersistentContainer
    
    static let shared = CoreDataManager()
    
    var context: NSManagedObjectContext {
        return persistenContainer.viewContext
    }
    
    init() {
        persistenContainer = NSPersistentContainer(name: "DataExpense")
        let description = persistenContainer.persistentStoreDescriptions.first
        
        description?.setOption(true as NSNumber, forKey: NSPersistentHistoryTrackingKey)
        
        
        persistenContainer.loadPersistentStores { description, error in
            if let error = error {
                fatalError("Unable to iniatilic core data \(error)")
            }
        }
    }
    
    // Better save
        func saveContext() {
            let context = persistenContainer.viewContext

            if context.hasChanges {
                do {
                    try context.save()
                } catch {
                    fatalError("Error: \(error.localizedDescription)")
                }
            }
        }
    
    func updateSpent(name: String,value: Int){
        // Fetch the managed object from the context
        let context = persistenContainer.viewContext
        let fetchRequest: NSFetchRequest<Categorie> = Categorie.fetchRequest()
        fetchRequest.predicate = NSPredicate(format: "name == %@", name)
        
        do {
            let fetchedObjects = try context.fetch(fetchRequest)
            
            // Update the properties of the managed object
            let yourObject = fetchedObjects.first
            yourObject?.spent = Int16(value)
            
            // Save the changes
            try context.save()
            
        } catch {
            print("Error fetching object: \(error)")
        }
    }
}

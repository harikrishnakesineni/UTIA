//
//  CoreDataManager.swift
//  HelloCoreData
//
//  Created by Suneetha Nallamotu on 9/20/21.
//

import Foundation
import CoreData

class CoreDataManager {
    
    let persistentContainer: NSPersistentContainer
    init() {
        persistentContainer = NSPersistentContainer(name: "PovertyCoreData")
        persistentContainer.loadPersistentStores { description, error in
            if let error = error {
                fatalError("Core data Store failed \(error.localizedDescription)")
            }
        }
    }
    func deleteContinent(continent: Continent)
    {
        persistentContainer.viewContext.delete(continent)
        
        do {
            try persistentContainer.viewContext.save()
        } catch  {
            persistentContainer.viewContext.rollback()
            print("failed to save context\(error)")
        }
    }
    func getAllContinents() -> [Continent]{
        let fetchRequest: NSFetchRequest<Continent> = Continent.fetchRequest()
        
        do {
            return try persistentContainer.viewContext.fetch(fetchRequest)
        }
        catch {
            return []
        }
    }
    func saveContinent(name: String, donation: Double){
        let continent = Continent(context: persistentContainer.viewContext)
//        continent.name = name
//        continent.donation = donation
        
        do {
            try persistentContainer.viewContext.save()
        } catch  {
            print("failed to save continent \(error.localizedDescription)")
        }
    }
    func updateContinent(){
        do{
            try persistentContainer.viewContext.save()
        } catch {
            persistentContainer.viewContext.rollback()
        }
    }
    
}

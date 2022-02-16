//
//  Persistence.swift
//  QuottyApp
//
//  Created by ODC on 8/2/2022.
//

import CoreData

class PersistenceController {
    
    static let localPersistence = PersistenceController(inMemory: true)
    static let dbPersistence = PersistenceController()
    
    let container: NSPersistentContainer
    var containerIsLoaded = false
    let containerName = "QuottyApp"
    
    init(inMemory:Bool = false)
    {
        
        container = NSPersistentContainer(name: containerName)
        container.viewContext.automaticallyMergesChangesFromParent = true
        
        if inMemory
        {
            container.persistentStoreDescriptions.first?.url = URL(fileURLWithPath: "/dev/null")
        }
        
        container.loadPersistentStores(completionHandler: {
            description,error in
            
            if error == nil
            {
                self.containerIsLoaded = true
            }
            
        })
        
    }
    
    func save()
    {
    
        if self.container.viewContext.hasChanges && containerIsLoaded
        {
        
            do{
                
                try self.container.viewContext.save()
                container.viewContext.reset()
                
            }catch let err as NSError {
                
                print("Could not save. \(err)")

            }
        }
        
    }
     
    func deleteAll<T>(forType:T.Type,byCriteria predicate:NSPredicate? = nil)
    {
         
         let fetchRequest = NSFetchRequest<NSFetchRequestResult>(entityName: String(describing: T.self))
         fetchRequest.predicate = predicate
         let batchDeleteRequest = NSBatchDeleteRequest(fetchRequest: fetchRequest)
         
         if containerIsLoaded
         {
             do {
                 
                 try self.container.viewContext.execute(batchDeleteRequest)

             } catch let err as NSError {
                 
                 print("Could not delete. \(err)")

             }
         }
         
     }
    
    func getAll<T>(forType:T.Type,sort:NSSortDescriptor? = nil,predicate: NSPredicate? = nil) -> [T]
    {
        let entityDescription =
        NSEntityDescription.entity(forEntityName: String(describing: T.self),
                                   in: self.container.viewContext)
        
        let request = NSFetchRequest<NSFetchRequestResult>()
          
        request.entity = entityDescription
        
        if let sort = sort {
            request.sortDescriptors = [sort]
        }
        
        if let predicate = predicate {
            request.predicate = predicate
        }
        
        var objects:[Any] = []
        if containerIsLoaded
        {

            do
            {
                     
                objects = try self.container.viewContext.fetch(request)

            } catch {
                   print("Unable to fetch.")
            }

        }
        
        return objects as! [T];

    }
    
}

//
//  Persistence.swift
//  QuottyApp
//
//  Created by ODC on 8/2/2022.
//

import CoreData

struct PersistenceController {
    
    static let shared = PersistenceController()
    
    let container: NSPersistentContainer = {
        
        let persistentContainer = NSPersistentContainer(name: "QuottyApp")
        
        persistentContainer.viewContext.automaticallyMergesChangesFromParent = true
        
        return persistentContainer
        
    }()
    
    
    func create(author:String,content:String)
    {
            
         let entity = NSEntityDescription.entity(forEntityName: "QuoteEntity", in : self.container.viewContext)
         guard let entity = entity else {return}
         
         let record = NSManagedObject(entity: entity, insertInto: self.container.viewContext)
         record.setValue(author, forKey: "author")
         record.setValue(content, forKey: "content")
         
     }
    
    func save(inMemory:Bool = false)
    {
        
        if inMemory
        {
            self.container.persistentStoreDescriptions.first?.url = URL(fileURLWithPath: "/dev/null")
        }
        
        if self.container.viewContext.hasChanges
        {
            do{
                
                try self.container.viewContext.save()
                
            }catch let err as NSError {
                
                print("Could not save. \(err)")

            }
        }
       
    }
    
     /*
     func deleteAll()
     {
         
         let fetchRequest = NSFetchRequest<NSFetchRequestResult>(entityName: "Formation")

         let batchDeleteRequest = NSBatchDeleteRequest(fetchRequest: fetchRequest)

         do {
             
             try context.execute(batchDeleteRequest)

         } catch let err as NSError {
             print("Could not delete. \(err)")

         }
         
     }
    
    func deleteManyByCriteria()
    {
        
        let fetchRequest = NSFetchRequest<NSFetchRequestResult>(entityName: "Formation")

        let batchDeleteRequest = NSBatchDeleteRequest(fetchRequest: fetchRequest)

        do {
            
            try context.execute(batchDeleteRequest)

        } catch let err as NSError {
            print("Could not delete. \(err)")

        }
        
    }
    
    func getManyByCriteria()
    {

        var objects:[Any] = []
           do {
            
                let entityDescription =
                NSEntityDescription.entity(forEntityName: "Formation",
                                           in: context)

                let request = NSFetchRequest<NSFetchRequestResult>()
                  
                request.entity = entityDescription

                objects = try context.fetch(request)


              } catch {
                  print("Unable to fetch.")
              }
        
        return objects as! [Formation];

    }
     

    */
    
    func getAll() -> [QuoteEntity]
    {

        var objects:[Any] = []
           do {
            
                let entityDescription =
                NSEntityDescription.entity(forEntityName: "QuoteEntity",
                                           in: self.container.viewContext)
                
                let request = NSFetchRequest<NSFetchRequestResult>()
                  
                request.entity = entityDescription

               objects = try self.container.viewContext.fetch(request)


              } catch {
                  print("Unable to fetch.")
              }
        
        return objects as! [QuoteEntity];

    }
    
}

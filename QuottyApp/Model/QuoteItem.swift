//
//  QuoteItem.swift
//  QuottyApp
//
//  Created by ODC on 16/2/2022.
//

import Foundation
import CoreData

struct QuoteItem
{
    
    var quoteResponse:QuotesResponse?
    var userResponse:RandomUserResponse?
    
    func addToContext(context:NSManagedObjectContext)
    {
        
        let entity = NSEntityDescription.entity(forEntityName: "QuoteEntity", in : context)
        guard let entity = entity else {return}
        
        let record = NSManagedObject(entity: entity, insertInto: context)
        
        record.setValue((self.userResponse?.userInfo?.first?.name?.first)! + " " + (self.userResponse?.userInfo?.first?.name?.last)! , forKey: "author")
        record.setValue(self.quoteResponse?.content, forKey: "content")
        record.setValue(self.quoteResponse?.language_code, forKey: "language_code")
        record.setValue(self.userResponse?.userInfo?.first?.picture?.medium, forKey: "author_img")
        
    }
    
}

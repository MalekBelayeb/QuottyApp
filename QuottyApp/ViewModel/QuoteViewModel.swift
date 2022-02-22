//
//  QuoteViewModel.swift
//  QuotesAppSwiftUI
//
//  Created by ODC on 21/1/2022.
//

import Foundation

class QuoteViewModel:ObservableObject
{
    
    @Published var quoteItem:QuoteItem?
    
    @Published var quoteItems:[QuoteEntity]?
    
    public static let sharedInstance = QuoteViewModel()
    
    
    func getAuthor() async -> RandomUserResponse?
    {

        do{

            return try await WebServiceProvider.getRandomUser()
            
        }catch{
            
            return nil
            print(error)
            
        }
        
    }
    
    func getQuote() async -> QuotesResponse?
    {

        do{
            
            if let lng = LanguageViewModel.sharedInstance.selectedLanguage
            {
                
                return try await WebServiceProvider.getQuotesByLanguage(language: lng.code!)
                
            }else{
                
                return try await WebServiceProvider.getQuotesByLanguage(language: "en")
                
            }
            
        }catch{
            
            print(error)
            return nil
        }
        
    }
    
    func fetchQuoteItem() async
    {
        
        DispatchQueue.main.async {
            
            Task{
                    
                let quote = await self.getQuote()
                let author = await self.getAuthor()
                
                self.quoteItem = QuoteItem(quoteResponse: quote, userResponse:author)
                
                self.quoteItem?.addToContext(context: PersistenceController.dbPersistence.container.viewContext)
                
                PersistenceController.dbPersistence.save()
                
            }
            
        }
        
    }
    
    func getFavoriteItem()
    {
    
        self.quoteItems = PersistenceController.dbPersistence.getAll(forType:QuoteEntity.self)
        
    }
    
    
}

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
    
    let headerArr = ["x-rapidapi-host":"quotes15.p.rapidapi.com","x-rapidapi-key":"17b0bf5f66msh74f197c0e1a4c39p1ca7a9jsn69202a169abd"]
    
    func getAuthor() async -> RandomUserResponse?
    {

        let urlStr = "https://randomuser.me/api/"

        return try? await WebServiceProvider.callWebService(urlStr: urlStr)
        
    }
    
    func getQuote() async -> QuotesResponse?
    {

        var urlStr = ""
    
        if let lng = LanguageViewModel.sharedInstance.selectedLanguage
        {
             urlStr = "https://quotes15.p.rapidapi.com/quotes/random/?language_code="+lng.code!
        }else{
            urlStr = "https://quotes15.p.rapidapi.com/quotes/random/?language_code=en"
        }
        
        return try? await WebServiceProvider.callWebService(urlStr: urlStr, headerFields: headerArr)
        
    }
    
    func fetchQuoteItem() async
    {
        
        DispatchQueue.main.async {
            
            Task{
                    
                let quote = await self.getQuote()
                let author = await self.getAuthor()
                
                self.quoteItem = QuoteItem(quoteResponse: quote, userResponse:author)
        
            }
            
        }
        
    }
    
    func getFavoriteItem()
    {
        
        self.quoteItems = PersistenceController.dbPersistence.getAll(forType:QuoteEntity.self)
        PersistenceController.dbPersistence.deleteAll(forType: QuoteEntity.self)
        
    }
    
    
}

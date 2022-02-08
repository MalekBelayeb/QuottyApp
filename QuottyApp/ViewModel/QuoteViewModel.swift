//
//  QuoteViewModel.swift
//  QuotesAppSwiftUI
//
//  Created by ODC on 21/1/2022.
//

import Foundation

class QuoteViewModel:ObservableObject
{
    
    @Published var quote:QuotesResponse?
    @Published var author:RandomUserResponse?
    
    public static let sharedInstance = QuoteViewModel()
    
    func getAuthor() async
    {
        
        DispatchQueue.main.async {
            
            Task
            {
                do{
            
                    self.author = try await WebServiceProvider.getRandomUser()
             
                }catch{
                    
                }
            }
            
        }
        
    }
    
    func getQuote() async
    {
        
        DispatchQueue.main.async {
            
            Task{
                
                do{
                    
                    if let lng = LanguageViewModel.sharedInstance.selectedLanguage
                    {
                        
                        self.quote = try await WebServiceProvider.getQuotesByLanguage(language: lng.code!)
                        
                    }else{
                        
                        self.quote = try await WebServiceProvider.getQuotesByLanguage(language: "en")
                        
                    }
                        
                }catch{
                        
                }
                        
            }
            
        }
        
    }
}

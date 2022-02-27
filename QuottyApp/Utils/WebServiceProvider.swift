//
//  QuotesManager.swift
//  QuotesAppSwiftUI
//
//  Created by ODC on 18/1/2022.
//

import Foundation

class WebServiceProvider
{
    
    static func getQuotesByLanguage(language:String) async throws -> QuotesResponse?
    {
        
        let urlStr = "https://quotes15.p.rapidapi.com/quotes/random/?language_code="+language
        guard let url = URL(string: urlStr) else { return nil}
            
        var urlRequest = URLRequest(url: url)
        
        urlRequest.allHTTPHeaderFields = ["x-rapidapi-host":"quotes15.p.rapidapi.com","x-rapidapi-key":"17b0bf5f66msh74f197c0e1a4c39p1ca7a9jsn69202a169abd"]
        let (data,response) = try await URLSession.shared.data(for: urlRequest)

        if let response = (response as? HTTPURLResponse)
        {
            if response.statusCode == 200
            {
                
                let decodedData = try JSONDecoder().decode(QuotesResponse.self, from: data)
                return decodedData
                
            }else if response.statusCode == 429 // Too many requests
            {

                return nil

            }else{
                return nil
            }
        }else {
            return nil
        }
    }
    
    static func getRandomUser() async throws -> RandomUserResponse
    {
        
        let urlStr = "https://randomuser.me/api/"
        
        guard let url = URL(string: urlStr) else {fatalError("Missing URL")}
        

        let urlRequest = URLRequest(url: url)
                let (data,response) =
        
        try await URLSession.shared.data(for: urlRequest)
        
        guard (response as? HTTPURLResponse)?.statusCode == 200 else {
        print((response as? HTTPURLResponse)?.statusCode)
            fatalError()
        }
        
        let decodedData = try JSONDecoder().decode(RandomUserResponse.self, from: data)
        
        return decodedData
    
    }
    
}

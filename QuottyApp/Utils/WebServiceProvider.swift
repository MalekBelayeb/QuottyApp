//
//  QuotesManager.swift
//  QuotesAppSwiftUI
//
//  Created by ODC on 18/1/2022.
//

import Foundation

class WebServiceProvider
{
 
    static func callWebService <T:Decodable> (urlStr:String,headerFields:[String:String] = [:]) async throws -> T?
    {
        guard let url = URL(string: urlStr) else { return nil}
        
        var urlRequest = URLRequest(url: url)
        urlRequest.allHTTPHeaderFields = headerFields
        
        let (data,response) = try await URLSession.shared.data(for:urlRequest)
        
        if let response = (response as? HTTPURLResponse)
        {
            guard response.statusCode == 200 else {return nil}
            
            let decodedData = try JSONDecoder().decode(T.self, from: data)
            
            return decodedData
            
        }else{
            
            return nil
        }
        
    }
 
}

//
//  Quote.swift
//  QuotesAppSwiftUI
//
//  Created by ODC on 4/2/2022.
//

import Foundation


struct QuotesResponse:Decodable
{
    
    let language_code:String?
    let content:String?
    let url:String?
    let orginator:Orginator?
    
}

struct Orginator:Decodable
{
    
    let name:String?
    let url:String?
    
}



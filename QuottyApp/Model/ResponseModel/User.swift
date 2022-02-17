//
//  User.swift
//  QuotesAppSwiftUI
//
//  Created by ODC on 4/2/2022.
//

import Foundation

struct UserName:Decodable
{
    
    let title:String?
    let first:String?
    let last:String?

}

struct Picture:Decodable
{
    
    let large:String?
    let medium:String?
    let thumbnail:String?
    
}

struct Location:Decodable
{

    let city:String?
    let state:String?
    let country:String?

}

struct UserInfo : Decodable
{
    
    let name:UserName?
    let picture:Picture?
    let location:Location?
    let email:String?
    
}

struct RandomUserResponse:Decodable
{

    let userInfo:[UserInfo]?
    
    enum CodingKeys: String, CodingKey
    {
        case userInfo = "results"
    }

}
